class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  has_many :collaborators
  has_many :wikis, through: :collaborators

  before_save { self.email = email.downcase }
  after_initialize :init

    def init
      self.role  ||= :standard
    end

  enum role: [:standard, :admin, :premium]

  # def collaborators
  #   Collaborator.where(user_id: id)
  # end

end
