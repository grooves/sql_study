Sequel.migration do
  up do
    create_table(:purchases) do
      primary_key :id
      String :name
      Integer :price
      String :user_name
      String :category
      DateTime :purchased_at
    end
  end
end
