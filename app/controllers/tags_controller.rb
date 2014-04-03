class TagsController < ApplicationController

  def new
    @tag = Tag.new
    render('new.html.erb')
  end

  def create
    @tag = Tag.create(params[:tag])
    redirect_to('/recipes')
  end

  def edit
    @tag = Tag.find(params[:id])
    render('edit.html.erb')
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to('/recipes')
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(params[:tag])
    redirect_to('/recipes')
  end

end
