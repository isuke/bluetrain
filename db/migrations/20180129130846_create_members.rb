Hanami::Model.migration do
  change do
    create_table :members do
      primary_key :id
      foreign_key :user_id   , :users   , on_delete: :set_null, null: true
      foreign_key :project_id, :projects, on_delete: :cascade , null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index %i[user_id]
      index %i[project_id]
      index %i[user_id project_id], unique: true
    end
  end
end
