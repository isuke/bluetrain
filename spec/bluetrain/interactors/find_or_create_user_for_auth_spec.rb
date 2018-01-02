require 'spec_helper'

describe FindOrCreateUserForAuth do
  let(:user_repositiy) { UserRepository.new }
  let(:interactor) { FindOrCreateUserForAuth.new }
  let(:result) { interactor.call(auth) }

  subject { result }

  before { user_repositiy.clear }

  context "auth is new user" do
    let(:auth) do
      info = Struct.new(:name, :email, :image)
        .new('foo', 'foo@example.com', '/hoge/hoge/foo.png')
      Struct.new(:provider, :uid, :info)
        .new('sample_provider', '11111', info)
    end

    it { is_expected.to be_a_success }

    it "creates a User with correct title and author" do
      expect(result.user.provider).to   eq "sample_provider"
      expect(result.user.uid).to        eq "11111"
      expect(result.user.name).to       eq "foo"
      expect(result.user.email).to      eq "foo@example.com"
      expect(result.user.image_path).to eq "/hoge/hoge/foo.png"
    end
  end

  context "auth is exisit user" do
    let!(:user) { Fabricate.create :user }
    let(:auth) do
      info = Struct.new(:name, :email, :image)
        .new('foo', 'foo@example.com', '/hoge/hoge/foo.png')
      Struct.new(:provider, :uid, :info)
        .new(user.provider, user.uid, info)
    end

    it { is_expected.to be_a_success }

    it "creates a User with correct title and author" do
      expect(result.user.provider).to   eq user.provider
      expect(result.user.uid).to        eq user.uid
      expect(result.user.name).to       eq user.name
      expect(result.user.email).to      eq user.email
      expect(result.user.image_path).to eq user.image_path
    end
  end
end
