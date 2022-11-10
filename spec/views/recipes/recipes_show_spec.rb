require 'rails_helper'

RSpec.describe 'Recipes#show', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user = User.create(name: 'Steve', email: 'steve@gmail.com', password: '123456')
      @user2 = User.create(name: 'Steve', email: 'steve@gmail.com', password: '123456')
      @user3 = User.create(name: 'Steve', email: 'steve@gmail.com', password: '123456')

      visit new_user_session_path
      fill_in 'Email', with: 'steve@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @recipe1 = Recipe.new(user: @user, name: 'Grilled Chicken', preparation_time: '12 minutes', cooking_time: '35 minutes',
                            description: 'Delicious grilled chicked')
      @recipe2 = Recipe.new(user: @user, name: 'Beef Pizza', preparation_time: '40 minutes', cooking_time: '55 minutes',
                            description: 'Delicious Beef Pizza')
      @recipe3 = Recipe.new(user: @user, name: 'Fried Chicked', preparation_time: '32 minutes', cooking_time: '25 minutes',
                            description: 'Deliocus Fried Chicken')
      @recipe4 = Recipe.new(user: @user, name: 'Jollof Rice', preparation_time: '10 minutes', cooking_time: '60 minutes',
                            description: 'Delicious Jollof Rice')
      @recipe1.save!

      visit recipe_path(@recipe1)
    end

    it 'shows recipe name' do
      recipe = Recipe.first
      expect(page).to have_content(recipe.name)
    end

    it 'shows recipe has preparation time' do
      recipe = Recipe.first
      expect(page).to have_content(recipe.preparation_time)
    end

    it 'shows recipe has cooking time' do
      recipe = Recipe.first
      expect(page).to have_content(recipe.cooking_time)
    end
  end
end
