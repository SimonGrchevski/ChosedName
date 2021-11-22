class RemoveRefToDeal < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :deal_id
  end
end
