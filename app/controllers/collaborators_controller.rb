class CollaboratorsController < ApplicationController

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
  end

  def show
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
    @collaborator.user_id = params[:collaborator][:user_id]
    @collaborator.wiki_id = @wiki.id

    if @collaborator.save
      flash[:notice] = "Collaborator was added."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error adding the collaborator. Please try again."
      render :new
    end
  end

  def edit
    @collaborator = Collaborator.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.users.push(User.find(params[:wiki][:users]))

    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    user = @collaborator.user_id
    @collaborator = Collaborator.where(user_id: user, wiki_id: @wiki.id)

    if Collaborator.destroy(@collaborator)
      flash[:notice] = "Collaborator was successfully deleted."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error deleting the collaborator."
      render :show
    end
  end
end
