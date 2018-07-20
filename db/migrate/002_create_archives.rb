Sequel.migration do
  up do
    create_table :archives do
      primary_key :id
      String :name, null: false
      String :path, null: false
      foreign_key :account_id, :accounts, on_delete: :restrict, on_update: :cascade, null: false
    end
  end

  down do
    drop_table :archives
  end
end
