class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false, default: ""
      t.string :genre
      t.text :description, default: ""
      t.string :authority, null: false, default: "normal"
      t.timestamps
    end
  end
end