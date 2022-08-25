class AddCoordinatesToShows < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :latitude, :float
    add_column :shows, :longitude, :float
  end
end
