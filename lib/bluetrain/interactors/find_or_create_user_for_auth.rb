require 'hanami/interactor'

class FindOrCreateUserForAuth
  include Hanami::Interactor

  expose :user

  def initialize repository: UserRepository.new
    @repository = repository
  end

  def call auth
    @user = @repository.find_by_provider_and_uid(auth.provider, auth.uid) || @repository.register(auth)
  end
end
