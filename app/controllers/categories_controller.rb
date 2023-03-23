class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    #@category = Category.new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
  
    if @category.save
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update 
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, status: :see_other
  end

  def correct_user
    @category = current_user.categories.find_by(id: params[:id])
    redirect_to categories_path, notice: "Not Autorized to edit this category" if @category.nil?
  end

  private
  def category_params
    params.require(:category).permit(:title, :user_id)
  end


end
