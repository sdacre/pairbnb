class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :listings, :image, :listing_image
  end
end
