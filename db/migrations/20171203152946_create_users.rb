Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :provider  , String , null: false
      column :uid       , String , null: false
      column :name      , String , null: false
      column :email     , String , null: false
      column :image_path, String , null: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index %i[provider uid], unique: true
      index %i[email]       , unique: true
    end
  end
end
