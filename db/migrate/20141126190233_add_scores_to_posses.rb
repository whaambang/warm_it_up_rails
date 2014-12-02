class AddScoresToPosses < ActiveRecord::Migration
  def change
    add_column :posses, :scores, :integer, default: 0
  end
end
