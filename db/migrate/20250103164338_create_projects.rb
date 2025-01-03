class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :github
      t.string :link
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
