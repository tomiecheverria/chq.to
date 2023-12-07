class AddAccessedToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :accessed, :boolean, default: false
  end
end
