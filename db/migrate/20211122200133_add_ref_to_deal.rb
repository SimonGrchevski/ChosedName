class AddRefToDeal < ActiveRecord::Migration[6.1]
  def change
    add_reference :deals, :product, null: false, foreign_key: true
  end
end
