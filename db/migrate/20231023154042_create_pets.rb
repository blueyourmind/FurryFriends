class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.text :story
      t.string :species
      t.date :found_when
      t.string :status
      t.timestamps
    end
  end
end
