class WikiPolicy < ApplicationPolicy
  # class Scope < Scope
  #   attr_reader :user, :scope
  #
  #   def initialize(user, scope)
  #     @user  = user
  #     @scope = scope
  #   end
  #
  #   def resolve
  #     if user.admin?
  #       scope.all
  #     else
  #       scope.where(private: false)
  #     end
  #   end
  # end

  # def update?
  #   user.present?
  # end

  
end
