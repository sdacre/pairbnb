class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
  	change_column :listings, :listing_image, "varchar[] USING (string_to_array(listing_image, ','))"
  end
end
