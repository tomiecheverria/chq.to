class AddVisitsCountToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :visits_count, :integer, default: 0
  end
end
