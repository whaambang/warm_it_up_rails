class CreatePosses < ActiveRecord::Migration
  def change
    create_table :posses do |t|
      t.string :name

      t.timestamps
    end
  end
end
