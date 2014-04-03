class RecipesController < ApplicationController
  def index
    @ratings = Rating.all
    @tags = Tag.all
    @query = params[:query]
    if params[:query]
      @recipes = Recipe.basic_search(params[:query])
      render("index.html.erb")
    else
      @recipes = Recipe.all
      render('index.html.erb')
    end
  end

  def new
    @tags = Tag.all
    @recipe =Recipe.new
    render('new.html.erb')
  end



  def create
    @recipe = Recipe.create(params[:recipe])
    @recipe.tags << Tag.find(params[:tag])
    redirect_to('/recipes')
  end

  def show
      @ratings = Rating.all
      @recipe = Recipe.find(params[:id])
      @avg = @recipe.average_rating
      render('show.html.erb')
  end

  def edit
    @tags = Tag.all
    @recipe = Recipe.find(params[:id])
    render('edit.html.erb')
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to('/recipes')
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])

    if params[:stars]
      @recipe.ratings << Rating.find_by(:stars => params[:stars])
    end
    if params[:tag]
      @recipe.tags << Tag.find(params[:tag])
      redirect_to('/recipes')
    else
      redirect_to('/recipes')
    end
  end
end
