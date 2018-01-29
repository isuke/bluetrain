class MemberRepository < Hanami::Repository
  associations do
    belongs_to :user
    belongs_to :project
  end
end
