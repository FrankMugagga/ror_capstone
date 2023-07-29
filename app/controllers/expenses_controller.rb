class ExpensesController < ApplicationController
  before_action :set_category
  def new
    @user = current_user
    @expense = @category.expenses.new
  end

  def create
    @expense = Expense.new(name: expense_params[:name], amount: expense_params[:amount])
    @expense.author = current_user
    @category = Category.find(expense_params[:category_id])

    # @category.id = expense_params[:category_id]

    if @expense.save
      @category.expenses << @expense
      redirect_to category_path(expense_params[:category_id]), notice: 'Expense was successfully created'
      puts "Category id: #{expense_params[:category_id]}"
    else
      puts @expense.errors.full_messages
      flash.now[:error] = @expense.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @category = Category.includes(:author).find(params[:category_id])
    @expense = @category.expenses.find(params[:id])
    if @expense.destroy
      redirect_to category_path(@category), notice: 'Category was successfully deleted'
    else
      @category.errors.full_messages
    end
  end

  private

  def set_category
    @category = Category.includes(:author).find(params[:category_id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end
