class ProjectRepository < Hanami::Repository
  associations do
    has_many :members
    has_many :users, through: :members
  end
end
