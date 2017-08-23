class ChargesController < ApplicationController

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: 1500,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    # Add Stripe customer id to current user
    current_user.customer = customer.id

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    # Upgrades user to premium after successful charge
    current_user.role = 'premium'
    current_user.save
    redirect_to wikis_path

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: 1500
    }
 end

 def destroy
   # Delete customer info in Stripe
   customer = Stripe::Customer.retrieve(current_user.customer)
   customer.delete

   # Downgrade user role to standard
   current_user.role = 'standard'
   current_user.save

   # Clear out current user's Stripe customer id
   current_user.customer = nil

   # Change all private wikis owned by user to public
   Wiki.where(user_id: current_user.id).each do |wiki|
     wiki.private = false
     wiki.save
   end

   flash[:notice] = "You have successfully changed to a standard account."
   redirect_to wikis_path

 end

end
