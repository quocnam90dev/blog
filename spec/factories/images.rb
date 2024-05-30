# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :image do
    name { "Name" }

    after(:build) do |image|
      io = Rails.root.join('spec', 'factories', 'images', 'image.png').open
      image.image.attach(io:, filename: 'image.png', content_type: 'image/png')
    end
  end
end
