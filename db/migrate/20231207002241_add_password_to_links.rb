class AddPasswordToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :password, :string
  end
end
