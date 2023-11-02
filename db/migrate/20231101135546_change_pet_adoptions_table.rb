
class ChangePetAdoptionsTable < ActiveRecord::Migration[6.0]
  def change
    change_table :pet_adoptions do |t|
      t.references :user, foreign_key: true
      t.remove :your_name
      t.remove :email
      t.remove :reason_for_adoption


      t.references :pet, foreign_key: true, index: true
    end
  end
end
