require 'rails_helper'

RSpec.describe 'recipes#index', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user = User.create(name: 'Steve', email: 'steve@gmail.com', password: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'steve@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @recipe1 = Recipe.new(user: @user, name: 'Fried Chicken', preparation_time: '40 minutes', cooking_time: '50 minutes',
                            description: 'Delicious fried chicken')
      @recipe2 = Recipe.new(user: @user, name: 'Grilled Chicked', preparation_time: '2 hrs 10 minutes', cooking_time: '50 minutes',
                            description: 'delicious grilled chicken')
      @recipe3 = Recipe.new(user: @user, name: 'Beef Pizza', preparation_time: '2hrs 10 minutes', cooking_time: '50 minutes',
                            description: 'Delicious Beef Pizza')
      @recipe4 = Recipe.new(user: @user, name: 'Yam Chips', preparation_time: '45 minutes', cooking_time: '50 minutes',
                            description: 'Delicious Yam chips')

      visit(recipes_path)
    end

    it 'shows the recipe name' do
      expect(page).to have_content('All Recipes')
    end
  end
end
