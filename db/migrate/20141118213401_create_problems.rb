class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :content
      t.string :answer

      t.timestamps
    end
  end
end
