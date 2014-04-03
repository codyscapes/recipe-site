class AlterTable < ActiveRecord::Migration
  def change
    rename_table :ratings_recipe, :ratings_recipes
  end
end
