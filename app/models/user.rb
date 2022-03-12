# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models #added this line to extend devise model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable #confirmable => means confirm email first and then you can login after following the instructions given in email by devise-auth-token
  include DeviseTokenAuth::Concerns::User

  include Rails.application.routes.url_helpers
  before_save :add_avatar
  after_create :send_confirmation_email

  validates :name, presence: true
  has_one_attached :avatar

  has_many :products, dependent: :destroy
  has_many :product_categories
  has_many :product_sub_categories

  private
  def add_avatar
    if self.avatar.attached?
      self.image = url_for(self.avatar)
    end
  end

  def send_confirmation_email
    UserMailer.registration_confirmation(self).deliver_now
  end
end
