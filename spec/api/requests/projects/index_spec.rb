# frozen_string_literal: true

RSpec.describe 'GET /api/projects', type: :request do
  include Rack::Test::Methods

  def app
    Hanami.app
  end

  subject { last_response }

  let!(:user1)    { Fabricate.create :user }
  let!(:user2)    { Fabricate.create :user }
  let!(:project1) { Fabricate.create :project }
  let!(:project2) { Fabricate.create :project }
  let!(:project3) { Fabricate.create :project }

  let(:path) { '/api/projects' }

  before { get path }

  # TODO: login
  xit "return curennt user's projects" do
    is_expected.to be_ok
  end
end
