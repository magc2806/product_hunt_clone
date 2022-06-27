class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, default: ""
      t.string :description
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
