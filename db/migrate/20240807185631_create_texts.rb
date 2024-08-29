class CreateTexts < ActiveRecord::Migration[7.1]
  def change
    create_table :texts do |t|
      t.string :category
      t.string :section
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
