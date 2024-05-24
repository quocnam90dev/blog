# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  email         :string
#  name          :string
#  password_hash :string
#  password_salt :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_name   (name) UNIQUE
#
require 'bcrypt'

class User < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A\S+@\S+\z/ }

  validates :password, presence: true, confirmation: true, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?

  before_save :downcase_email

  attr_accessor :password

  def password=(password)
    @password = password
    self.password_salt = User.generate_salt
    self.password_hash = User.hash_password(password, password_salt)
  end

  def self.authenticate email, password
    return nil unless email.present?

    user = User.find_by(email: email.downcase)

    return nil unless user

    password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)

    user if password_hash == user.password_hash
  end

  def self.hash_password password, salt
    BCrypt::Engine.hash_secret(password, salt)
  end

  def self.generate_salt
    BCrypt::Engine.generate_salt
  end

  private
  def downcase_email
    self.email = email.downcase
  end

  def password_required?
    !persisted? || password.present?
  end
end
