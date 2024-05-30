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
FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "First #{n} Last #{n}"}
    sequence(:email) {|n| "user#{n}@example.com"}
    password { 'changeme' }
    password_confirmation { password }
  end
end
