User.create!([
  {
    name: 'Steve',
    email: 'steve@gmail.com',
    password: '123456'
  },
  {
    name: 'Daniel',
    email: 'daniel@gmail.com',
    password: '123456'
  }
])

Food.create!([
  {
    user_id: 1,
    name: 'Rice',
    measurement_unit: 'kg',
    unit_price: 10
  },
  {
      user_id: 1,
      name: 'Beans',
      measurement_unit: 'kg',
      unit_price: 45
  },
  {
    user_id: 2,
    name: 'Bread',
    measurement_unit: 'kg',
    unit_price: 20
  },
  {
    user_id: 2,
    name: 'Cake',
    measurement_unit: 'kg',
    unit_price: 17
  },
])

Recipe.create!([
  {
    user_id: 2,
    name: 'Kerala Chicken roast',
    preparation_time: '2hrs',
    cooking_time: '25min',
    description: 'Kerala Chicken descrption',
    public: true
  },
  {
    user_id: 1,
    name: 'Grilled Cheese',
    preparation_time: '1hrs',
    cooking_time: '45min',
    description: 'Grilled Cheese descrption',
    public: true
  },
  {
    user_id: 1,
    name: 'Fried Chicken',
    preparation_time: '1 hour',
    cooking_time: '45 minutes',
    description: 'Fried Chicken descrption',
    public: true
  },{
    user_id: 2,
    name: 'Jollof Rice',
    preparation_time: '10 mins',
    cooking_time: '45 mins',
    description: 'Jollof Rice descrption',
    public: true
  }
])
puts 'Seed data loaded successfully'
