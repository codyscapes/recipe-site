class RenameTable < ActiveRecord::Migration
  def change
    rename_table :recipe_ratings, :ratings_recipe
  end
end
