# frozen_string_literal: true

module Web
  module Authentication
    def self.included action
      action.class_eval do
        before :current_user
        before :authenticate!
        expose :current_user
      end
    end

  private

    def authenticate!
      halt 401 unless authenticated?
    end

    def authenticated?
      !current_user.nil?
    end

    def current_user
      @current_user ||= UserRepository.new.find_by_provider_and_uid(session[:provider], session[:uid])
    end
  end
end
