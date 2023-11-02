class RemoveAdoptionsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :adoptions
  end

  def down
    create_table :adoptions do |t|
      t.bigint "user_id", null: false
      t.bigint "pet_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
