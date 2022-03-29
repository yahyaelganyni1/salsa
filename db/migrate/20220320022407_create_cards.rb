class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
