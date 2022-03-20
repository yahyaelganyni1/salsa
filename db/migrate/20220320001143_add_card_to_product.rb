class AddCardToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :card, :boolean, default: false
  end
end
