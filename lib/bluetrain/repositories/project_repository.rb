class ProjectRepository < Hanami::Repository
  associations do
    has_many :members
    has_many :users, through: :members
  end

  def by_user_id user_id
    projects
      .join(members)
      .where(members[:user_id].qualified => user_id)
      .to_a
  end
end
