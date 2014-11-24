class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :uid
      t.string   :provider
      t.string   :name
      t.string   :github_name
      t.string   :email
      t.string   :posse_id
      t.string   :image
      t.references :posse, index: true

      t.timestamps
    end
  end
end
