class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :name
      t.integer :micropost_id
      t.string :value

      t.timestamps
    end
    add_index :settings, :micropost_id
  end
end
