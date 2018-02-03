# frozen_string_literal: true

require 'features_helper'

describe 'Home Page', type: :feature do
  before { visit '/home' }

  subject { page }

  it 'is successful' do
    expect(page).to have_content 'Home'
  end
end
