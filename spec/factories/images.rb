FactoryBot.define do
  factory :image do
    name { "Name" }

    after(:build) do |image|
      io = Rails.root.join('spec', 'factories', 'images', 'image.png').open
      image.image.attach(io:, filename: 'image.png', content_type: 'image/png')
    end
  end
end
