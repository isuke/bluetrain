# frozen_string_literal: true

Fabricator(:user) do
  provider 'google_oauth2'
  uid      { SecureRandom.hex }
  name     { Faker::Name.name }
  email    { Faker::Internet.safe_email }
  image_path nil
end
