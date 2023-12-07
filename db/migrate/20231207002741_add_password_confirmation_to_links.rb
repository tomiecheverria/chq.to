class AddPasswordConfirmationToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :password_confirmation, :string
  end
end
