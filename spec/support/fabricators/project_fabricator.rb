# frozen_string_literal: true

Fabricator(:project) do
  name { Faker::Name.name }
end
