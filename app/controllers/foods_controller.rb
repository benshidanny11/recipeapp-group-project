class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def destroy
    @food = Food.find(params[:id])
    return unless @food.destroy

    redirect_to foods_path
  end

  def create
    @food = Food.new(food_data)
    @food.user = User.find(current_user.id)
    if @food.save
      redirect_to food_path(@food)
    else
      redirect_to root_path
    end
  end

  def new
    @food = Food.new
  end

  private

  def food_data
    params.require(:food).permit(:name, :measurement_unit, :unit_price, :quantity)
  end
end
