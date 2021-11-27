class AddQuantityToDeal < ActiveRecord::Migration[6.1]
  def change
    add_column :deals, :quantity, :integer
  end
end
