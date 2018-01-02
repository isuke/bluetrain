RSpec.describe UserRepository, type: :repository do
  let(:user_repositiy) { UserRepository.new }

  before { user_repositiy.clear }

  describe '#find_by_provider_and_uid' do
    let!(:user) { Fabricate.create :user }

    subject { user_repositiy.find_by_provider_and_uid(provider, uid) }

    context 'provider and uid is exsited' do
      let(:provider) { user.provider }
      let(:uid)      { user.uid }

      it { is_expected.to eq user }
    end

    context 'provider and uid is NOT exsited' do
      let(:provider) { user.provider }
      let(:uid)      { 'foo' }

      it { is_expected.to eq nil }
    end
  end

  describe '#register' do

    subject { user_repositiy.register(auth) }

    context 'arg is currect' do
      let(:auth) do
        info = Struct.new(:name, :email, :image)
          .new('foo', 'foo@example.com', '/hoge/hoge/foo.png')
        Struct.new(:provider, :uid, :info)
          .new('sample_provider', '11111', info)
      end

      it 'create user' do
        expect do
          subject
        end.to change(user_repositiy, :count).by(1)
      end
    end

    context 'arg is incurrect' do
      let(:auth) do
        info = Struct.new(:name, :email, :image)
          .new(nil, 'foo@example.com', '/hoge/hoge/foo.png')
        Struct.new(:provider, :uid, :info)
          .new('sample_provider', '11111', info)
      end

      it 'create user' do
        expect do
          subject
        end.to raise_error(Hanami::Model::NotNullConstraintViolationError)
         .and change(user_repositiy, :count).by(0)
      end
    end
  end
end
