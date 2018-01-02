require 'features_helper'

describe 'Visit home' do
  before { visit '/home' }

  subject { page }

  it 'is successful' do
    expect(page).to have_content 'Home'
  end
end
