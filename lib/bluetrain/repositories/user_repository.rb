class UserRepository < Hanami::Repository
  associations do
    has_many :members
    has_many :projects, through: :members
  end

  def find_by_provider_and_uid provider, uid
    users.where(provider: provider, uid: uid).one
  end

  def register auth
    create(
      provider:   auth.provider,
      uid:        auth.uid,
      name:       auth.info.name,
      email:      auth.info.email,
      image_path: auth.info.image,
    )
  end

  def count
    users.count
  end
end
