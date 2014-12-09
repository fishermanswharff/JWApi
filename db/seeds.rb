User.delete_all
Post.delete_all
Category.delete_all

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

users = User.create([
  {
    first_name:"Jason",
    last_name:"Wharff",
    username:"jasonwharff",
    role:"admin",
    email:"fishermanswharff@mac.com",
    password_digest:"$2a$10$qA2kdO7MOlWkAUIUQWhNtuzlIZScAs69QrTHxn13BM9i6jUUuLbfS",
    token:"9cbaf8c82925426c869ecfc4b610c8a6",
  },
  {
    first_name: 'Jason',
    last_name: 'Wharff',
    username: 'dubya',
    role: 'admin',
    email: 'jasonwharff@gmail.com',
    password_digest: '$2a$10$iUY.xKqExZ7DhaWVAAh5Q.o/gfUDR5I7iHTp2Y46nmrogYIV504X6',
    token: '7a2ab5a8677b446eb1c269c5056a001d'
  }
])

categories = Category.create([
  {name: "Design"},
  {name: "Development"},
  {name: "Illustration"},
  {name: "Photography"},
  {name: "Ruby"},
  {name: "Javascript"},
  {name: "AngularJS"},
  {name: "CSS"},
  {name: "HTML"}
])

posts = Post.create([
  {
    title: "TIL: binary trees with nothing",
    body: "Euismod Aenean Ornare Malesuada Inceptos",
    categories: [categories[1],categories[4]],
    user_id: users[0].id
  }
])