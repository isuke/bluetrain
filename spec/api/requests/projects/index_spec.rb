RSpec.describe 'GET /api/projects' do
  include Rack::Test::Methods

  def app
    Hanami.app
  end

  let!(:user1) { Fabricate.create :user }
  let!(:user2) { Fabricate.create :user }
  let!(:project1) { Fabricate.create :project }
  let!(:project2) { Fabricate.create :project }
  let!(:project3) { Fabricate.create :project }

  let(:path) { '/api/projects' }

  before { get path }

  subject { last_response }

  # TODO: login
  xit "return curennt user's projects" do
    is_expected.to be_ok
  end

end
