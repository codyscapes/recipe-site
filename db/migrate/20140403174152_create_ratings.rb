class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.column :stars, :integer
    end
    create_table :recipe_ratings do |t|
      t.column :recipe_id, :integer
      t.column :rating_id, :integer
      t.timestamps
    end
  end
end
