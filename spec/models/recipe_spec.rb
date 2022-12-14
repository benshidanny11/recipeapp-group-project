require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Recipe model' do
    user = User.create(name: 'Steve', email: 'steve@example.com', password: '123456')
    subject do
      Recipe.new(user_id: user, name: 'Grilled Chicked', preparation_time: '25 minutes', cooking_time: '50 minutes',
                 description: 'Well grilled chicken')
    end
    before { subject.save }

    it 'check the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check if the name is not exceeding 50 characters' do
      subject.name = 'Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world
        Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the prepration_time is not blank' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end

    it 'check if the preparation time is not exceeding 100 characters' do
      subject.preparation_time = 'Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the cooking_time is not blank' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end

    it 'check if the cooking_time is not exceeding 100 characters' do
      subject.cooking_time = 'Lorem ipsum dolor sit amet, consectetur
      adipiscing elit, sed do eiusmod tempor incididunt ut labore et
      dolore magna aliqua.'
      expect(subject).to_not be_valid
    end

    it 'check the description is not blank' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'check if the description is not exceeding 300 characters' do
      subject.description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
      aliquip ex ea commodo consequat.'
      expect(subject).to_not be_valid
    end
  end
end
