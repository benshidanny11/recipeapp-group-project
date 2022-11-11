require 'rails_helper'

RSpec.describe FoodRecipe, type: :model do
  describe 'RecipeFood model' do
    user = User.create(name: 'Steve', email: 'steve@example.com', password: '123456')
    recipe = Recipe.new(user_id: user, name: 'Grilled Chicken', preparation_time: '25 minutes',
                        cooking_time: '50 minutes', description: 'It is a delicious meal')
    food = Food.new(user_id: user, name: 'Rice', measurement_unit: 'kg', unit_price: 5)
    subject { FoodRecipe.new(food_id: food, recipe_id: recipe, quantity: 5) }
    before { subject.save }

    it 'check the quantity is not blank' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'check if quantity is numeric' do
      subject.quantity = 'not-numeric'
      expect(subject).to_not be_valid
    end

    it 'check if quantity is equal or greater than one' do
      expect(subject.quantity).to be >= 1
    end
  end
end
