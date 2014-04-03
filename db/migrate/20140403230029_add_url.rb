class AddUrl < ActiveRecord::Migration
  def change
    add_column :recipes, :URL, :string
  end
end
