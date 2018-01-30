module Api::Controllers::Projects
  class Index
    include Api::Action

    expose :projects

    def call _params
      @repositiry = ProjectRepository.new
      @projects = @repositiry.by_user_id(current_user.id)
    end
  end
end
