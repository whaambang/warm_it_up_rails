class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :problem_id
      t.integer :posse_id
      t.text :content
      t.integer :points_earned, default: 0

      t.timestamps
    end
  end
end
