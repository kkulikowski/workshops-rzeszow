class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :is_admin, only: [:new, :edit, :update, :destroy, :create]

  expose(:categories)
  expose(:category)
  expose(:product) { Product.new }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.category = Category.new(category_params)

    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
   if category.update(category_params)
    redirect_to category, notice: 'Category was successfully updated.'
   else
     render action: 'edit'
   end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
    def is_admin
      if user_signed_in?
        flash[:error] =  'You are not an admin.'
        return if current_user.try(:admin?)
        redirect_to new_user_session_path
        flash[:error] =  'You are not an admin.'
      else
        redirect_to new_user_session_path
        flash[:error] =  'Log in before continue.'
      end
    end
end
