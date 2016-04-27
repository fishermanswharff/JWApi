puts 'Truncating database…'
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  puts "Truncating #{table}"
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end
puts "Done truncating database.\nSeeding users…"
user = User.new(
  first_name: 'Jason',
  last_name: 'Wharff',
  username: 'jasonwharff',
  role: 'admin',
  email: 'fishermanswharff@mac.com',
  password: 'secret_sauce',
  password_confirmation: 'secret_sauce'
)
user.save
puts "Seeded #{User.count} users\nSeeding Categories…"
categories = Category.create([
  {name: 'Design'},
  {name: 'Development'},
  {name: 'Illustration'},
  {name: 'Photography'},
  {name: 'Ruby'},
  {name: 'Javascript'},
  {name: 'AngularJS'},
  {name: 'CSS'},
  {name: 'HTML'},
  {name: 'TIL'},
  {name: 'jQuery'},
  {name: 'SQL'},
  {name: 'Computer Science'},
  {name: 'Testing'},
  {name: 'XML'},
  {name: 'Travel'},
  {name: 'Hobbies'},
  {name: 'Infographics'},
  {name: 'Graphic Design'},
  {name: 'Data Viz'}
])
puts "Seeded #{Category.count} categories\nSeeding Posts…"
posts = Post.create([
  { title: 'TIL: binary trees with nothing', body: "<h5>Euismod Aenean Ornare Malesuada Inceptos</h5><pre><code>class BinaryTree<br><br>  attr_accessor :value, :right_branch, :left_branch<br> def initialize(value)<br>@value = value<br>@left_branch = nil<br>@right_branch = nil<br>end<br><br>def insert(value)<br>if value > @value<br> @right_branch ? @right_branch.insert(value) : @right_branch = BinaryTree.new(value)<br><br>elsif value < @value<br> @left_branch ? @left_branch.insert(value) : @left_branch = BinaryTree.new(value)<br>else<br>  'world ends'<br>end<br> end<br>end</code></pre>", user_id: user.id},
  { title: 'TIL: Quick sorting', body: "<h3>Donec sed odio dui.</h3><p>Maecenas faucibus mollis interdum. Curabitur blandit tempus porttitor. Donec sed odio dui.</p> <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>", user_id: user.id},
  { title: 'TIL: Ruby', body: "Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum. Donec ullamcorper nulla non metus auctor fringilla.", user_id: user.id },
  { title: 'TIL: Rails API has_and_belongs_to_many', body: "Vestibulum id ligula porta felis euismod semper. Cras mattis consectetur purus sit amet fermentum. Maecenas sed diam eget risus varius blandit sit amet non magna. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.", user_id: user.id },
  { title: 'TIL: AngularJS $promises', body: "Aenean lacinia bibendum nulla sed consectetur. Aenean lacinia bibendum nulla sed consectetur. Sed posuere consectetur est at lobortis. Etiam porta sem malesuada magna mollis euismod.", user_id: user.id },
  { title: 'TIL: Backbone Routers', body: "Aenean lacinia bibendum nulla sed consectetur. Donec id elit non mi porta gravida at eget metus. Donec id elit non mi porta gravida at eget metus. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.", user_id: user.id },
  { title: 'TIL: SQL Trigger Functions', body: "Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Sed posuere consectetur est at lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum.", user_id: user.id },
  { title: 'TIL: Setting up AngularJS with Yeoman', body: "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Curabitur blandit tempus porttitor. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam id dolor id nibh ultricies vehicula ut id elit. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.", user_id: user.id },
  { title: 'Ruby: AWS signKey', body: "<p class='lead'>In order to upload files to an AWS s3 server, you need the proper credentials and you have to pass these credentials into a multipart form with your file/data. Creating the credentials is not trivial.</p><p class='lead'>We make this a class method so when the endpoint receives the GET request, we can call <code class='inline'>Amazon.get_s3_upload_key</code> and render the returned hash into json by the controller. The hash generated will consist of 4 objects:</p><ol><li>Your access key (obtained through AWS),</li><li>A secure, random key that will be the url of the s3 object,</li><li>The policy: a stringified hash Base64 encoded, and</li><li>The signature: the policy hashed with your AWS secret key, then Base64 encoded.</li></ol><p class='lead'>Obtaining <strong>access keys and secrets</strong> is a trivial process. You'll need to create an account with <a href='http://aws.amazon.com/'>Amazon Web Services</a>. Once you have registered the next step is to set up an IAM identity. Your access keys and secrets are assigned to an IAM identity.</p><p class='lead'>The <strong>key</strong> is generated by ruby's built in secure random number generator interface. The result will be appended onto the bucket url and ultimately form the url for the s3 object.</p><pre><code><span class='str'>SecureRandom.uuid</span> <span class='com'>#=> 2d931510-d99f-494a-8c67-87feb05e1594</span></code></pre><p class='lead'>The <strong>policy</strong> is Base64 encoded and must consist (at-least) of the following elements:</p>", user_id: user.id },
])
puts "Seeded #{Post.count} posts\nSeeding Images…"
images = Image.create([
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/eb00f33c-b80e-4e72-ada4-36bdc24f551b'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/e435045a-3719-4c52-b28f-4a137ffa797d'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/c0fd12b2-cd5e-482c-8461-754f0d68af76'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/9b29e2b6-9c1b-4632-b9bd-0c70b0edf7b4'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/90f76682-65fe-43a8-8346-9b7e1cf46fa7'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/7076b2a0-0d99-4c59-9172-0395ad6435b8'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/68845be2-443d-47bc-915c-5b98dfc425e8'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/4f6ee78a-4090-433c-85bb-7fdf4f49bd59'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/4b534792-4dd5-47c0-9c05-91fed7bcde41'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/4441cf26-bd79-40bb-8088-a1043b0539c6'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/363414b9-f355-47dc-9a91-7ace45e7a00e'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/221f5f6e-43bc-4ca8-9caa-18a682734b58'},
  {url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/199b6d9e-787a-43fc-a4ea-e7796a0842fc'}
])
puts "Seeded #{Image.count} images\nAssociating posts with categories…"
posts[0].categories << Category.find_by(name:'Development')
posts[0].categories << Category.find_by(name:'Ruby')
posts[0].categories << Category.find_by(name:'Javascript')
posts[0].categories << Category.find_by(name:'TIL')
posts[1].categories << Category.find_by(name:'Development')
posts[1].categories << Category.find_by(name:'Ruby')
posts[1].categories << Category.find_by(name:'Computer Science')
posts[1].categories << Category.find_by(name:'TIL')
posts[2].categories << Category.find_by(name:'Development')
posts[2].categories << Category.find_by(name:'Graphic Design')
posts[2].categories << Category.find_by(name:'XML')
posts[2].categories << Category.find_by(name:'TIL')
posts[3].categories << Category.find_by(name:'Development')
posts[3].categories << Category.find_by(name:'Photography')
posts[3].categories << Category.find_by(name:'Ruby')
posts[3].categories << Category.find_by(name:'Illustration')
posts[4].categories << Category.find_by(name:'Development')
posts[4].categories << Category.find_by(name:'Data Viz')
posts[4].categories << Category.find_by(name:'Computer Science')
posts[4].categories << Category.find_by(name:'Travel')
posts[5].categories << Category.find_by(name:'Development')
posts[5].categories << Category.find_by(name:'Hobbies')
posts[5].categories << Category.find_by(name:'Testing')
posts[5].categories << Category.find_by(name:'SQL')
posts[6].categories << Category.find_by(name:'Development')
posts[6].categories << Category.find_by(name:'Ruby')
posts[6].categories << Category.find_by(name:'jQuery')
posts[6].categories << Category.find_by(name:'XML')
posts[7].categories << Category.find_by(name:'Javascript')
posts[8].categories << Category.find_by(name:'CSS')
puts "Done adding categories to posts.\nAdding images to a post…"
images.each { |image| posts[0].images << image }
puts 'Done seeding. Have a lovely day.'





# curl to the user's avatar
# curl -X PATCH -F "user[avatar]=@app/assets/images/judge.jpg" http://localhost:3000/users/1
# curl -X PATCH -F "user[avatar]=@app/assets/images/judge.jpg" http://jwdotcom.herokuapp.com/users/9

# cUrl to a post's image
# curl -X PATCH -F "post[image]=@app/assets/images/post-image-1.gif" http://localhost:3000/posts/1
# curl -X PATCH -F "post[image]=@/Users/jason/Pictures/Kauai-2014/bin/full-size/kauai-napali-coast-boat-2.jpg" http://jwdotcom.herokuapp.com/posts/:id
# image: "http://s3.amazonaws.com/dubya-blog-bucket/posts/images/000/000/001/original/post-image-1.gif?1418096877"
# image: "https://s3.amazonaws.com/dubya-blog-bucket/posts/images/000/000/001/original/kauai-napali-coast-boat-2.jpg"


# curl -i -X POST -d 'user[username]=me&user[password]=123456&user[password_confirmation]=123456&user[first_name]=ricky&user[last_name]=bobby&user[role]=admin&user[email]=puma@rickybobby.com' http://localhost:3000/users

# curl -i -X POST -d 'user[username]=yo&user[password]=123456&user[password_confirmation]=123456&user[first_name]=joemamma&user[last_name]=fu&user[role]=admin&user[email]=me@me.com' http://localhost:3000/users














