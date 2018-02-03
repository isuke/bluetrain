# frozen_string_literal: true

module Web::Controllers::Session
  class Create
    include Web::Action

    def call _params
      auth   = request.env['omniauth.auth']
      result = FindOrCreateUserForAuth.new(repository: UserRepository.new).call(auth)
      if result.success?
        session[:provider] = result.user.provider
        session[:uid]      = result.user.uid

        flash['success'] = 'Login seccessed'
      else
        flash['error'] = 'Login failed'
      end
      redirect_to routes.root_path
    end

  private

    def authenticate!
      # no-op
    end
  end
end
