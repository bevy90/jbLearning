class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable
  
  rolify
  after_create :assign_default_role

  extend FriendlyId
  friendly_id :email, use: :slugged

  has_many :courses

  validate :must_have_a_role, on: :update
  
  def to_s
    email
  end

  def username
    self.email.split(/@/).first
  end

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end

  def online?
    updated_at > 2.minutes.ago
  end

  private
  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least one role")
   end
  end
end
