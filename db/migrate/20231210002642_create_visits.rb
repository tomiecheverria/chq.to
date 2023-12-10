class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.references :link, null: false, foreign_key: true
      t.datetime :accessed_at, null: false
      t.string :ip_address, null: false

      t.timestamps
    end
  end
end
