class RemoveColumnsFromTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :smoking_allowed, :string
    remove_column :tags, :pets_allowed, :string
    remove_column :tags, :pool, :string
    remove_column :tags, :free_parking, :string
    remove_column :tags, :ac, :string
    remove_column :tags, :wifi, :string
    remove_column :tags, :heating, :string
  end
end
