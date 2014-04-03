class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :ratings

  def average_rating
    ratings = self.ratings.all.map{ |rating| rating.stars}
    avg = ratings.inject{ |sum, stars| sum + stars }.to_f / ratings.size
    avg.round(2)
  end

  def self.sort(arr, sort_method)
    if sort_method == 'rating'
      arr.sort_by{ |recipe| recipe.average_rating }.reverse!
    end
  end
end
