class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:author).all
    @user = current_user
  end

  def show
    @user = current_user

    @category = @user.categories.includes(:author, :expenses).find(params[:id])

    render :show
  end

  def new
    @user = current_user
    @category = Category.new
  end

  def create
    @user = current_user
    @category = @user.categories.build(category_param)

    if @category.save
      redirect_to categories_path, notice: 'Category successfully create'
    else
      flash.now[:error] = @category.errors.full_message.to_sentence
      render :new
    end
  end

  def destroy
    @category = current_user.categories.find(params[:id])

    if @category.destroy
      redirect_to categories_path, notice: 'Category was successfully deleted'
    else
      @category.errors.full_messages
    end
  end

  def category_param
    params.require(:category).permit(:name, :icon, :author_id)
  end
end
