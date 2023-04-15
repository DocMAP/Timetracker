class AddHoursRequestedToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :hours_requested, :decimal, default: 0.0
  end
end
