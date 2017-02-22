class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :smoking_allowed
      t.string :pets_allowed
      t.string :pool
      t.string :free_parking
      t.string :ac
      t.string :wifi
      t.string :heating

      t.timestamps
    end
  end
end
