class RemovePasswordConfirmationFromLinks < ActiveRecord::Migration[7.1]
  def change
    remove_column :links, :password_confirmation, :string
  end
end
