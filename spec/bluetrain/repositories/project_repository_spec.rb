# frozen_string_literal: true

RSpec.describe ProjectRepository, type: :repository do
  let(:user_repository)    { UserRepository.new }
  let(:project_repository) { ProjectRepository.new }
  let(:member_repository)  { MemberRepository.new }

  before do
    user_repository.clear
    project_repository.clear
    member_repository.clear
  end

  describe '#by_user_id' do
    subject { project_repository.by_user_id(user1.id).to_a }

    let!(:user1) { Fabricate.create :user }
    let!(:user2)    { Fabricate.create :user }
    let!(:project1) { Fabricate.create :project }
    let!(:project2) { Fabricate.create :project }
    let!(:project3) { Fabricate.create :project }

    before do
      Fabricate.create :member, user_id: user1.id, project_id: project1.id
      Fabricate.create :member, user_id: user1.id, project_id: project2.id
      Fabricate.create :member, user_id: user2.id, project_id: project3.id
    end

    it { is_expected.to match_array [project1, project2] }
  end
end
