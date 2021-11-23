class AddNameToDeal < ActiveRecord::Migration[6.1]
  def change
    add_column :deals, :name, :string
    add_column :deals, :category, :string
  end
end
