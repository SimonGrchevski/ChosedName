class RemoveReferenceToDeal < ActiveRecord::Migration[6.1]
  def change
    remove_column :deals, :product_id
  end
end
