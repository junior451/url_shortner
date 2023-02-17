class AddNoVisitsToShortners < ActiveRecord::Migration[6.1]
  def change
    add_column :shortners, :no_visits, :integer, default: 0
  end
end
