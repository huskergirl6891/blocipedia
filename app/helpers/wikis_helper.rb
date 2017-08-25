require 'redcarpet'

module WikisHelper
  def markdown(text)
    # Initializes a Markdown parser
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(text).html_safe
  end

  def find_users()
    users = []
    collaborators = Collaborator.pluck(:user_id) # find all user_id's that are currently collaborators
    all_users = User.all
    all_users.each do |user|
      if !collaborators.include?(user.id)
        users << user # if user is not a collaborator, add to list
      end
    end
    users
    puts users
  end
end
