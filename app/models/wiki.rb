class Wiki < ActiveRecord::Base
  belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators

  after_initialize :init

    def init
      self.private  ||= false
    end

end
