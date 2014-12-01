class AddScoresToPosses < ActiveRecord::Migration
  def change
    add_column :posses, :scores, :integer
  end
end
