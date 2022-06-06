class AddManagerId < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :manager_id, :string, limit: 8
  end
end
