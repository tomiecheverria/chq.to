class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :slug
      t.string :name, default: 'Unnamed Link', null: false
      t.string :url

      t.timestamps
    end
    add_index :links, :slug
  end
end
