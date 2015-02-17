User.delete_all
Post.delete_all
# Category.delete_all


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
  {name: "HTML"},
  {name: "TIL"},
  {name: "jQuery"},
  {name: "SQL"},
  {name: "Computer Science"},
  {name: "Testing"},
  {name: "XML"},
  {name: "Travel"},
  {name: "Hobbies"},
  {name: "Infographics"},
  {name: "Graphic Design"},
  {name: "Data Viz"}
])

posts = Post.create([
  { title: "TIL: binary trees with nothing", body: "<h5>Euismod Aenean Ornare Malesuada Inceptos</h5><pre><code>class BinaryTree<br><br>  attr_accessor :value, :right_branch, :left_branch<br> def initialize(value)<br>@value = value<br>@left_branch = nil<br>@right_branch = nil<br>end<br><br>def insert(value)<br>if value > @value<br> @right_branch ? @right_branch.insert(value) : @right_branch = BinaryTree.new(value)<br><br>elsif value < @value<br> @left_branch ? @left_branch.insert(value) : @left_branch = BinaryTree.new(value)<br>else<br>  'world ends'<br>end<br> end<br>end</code></pre>", user_id: users[0].id},
  { title: "TIL: Quick sorting", body: "<h3>Donec sed odio dui.</h3><p>Maecenas faucibus mollis interdum. Curabitur blandit tempus porttitor. Donec sed odio dui.</p> <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>", user_id: users[0].id},
  { title: "TIL: Ruby", body: "Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum. Donec ullamcorper nulla non metus auctor fringilla.", user_id: users[0].id },
  { title: "TIL: Rails API has_and_belongs_to_many", body: "Vestibulum id ligula porta felis euismod semper. Cras mattis consectetur purus sit amet fermentum. Maecenas sed diam eget risus varius blandit sit amet non magna. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.", user_id: users[0].id },
  { title: "TIL: AngularJS $promises", body: "Aenean lacinia bibendum nulla sed consectetur. Aenean lacinia bibendum nulla sed consectetur. Sed posuere consectetur est at lobortis. Etiam porta sem malesuada magna mollis euismod.", user_id: users[0].id },
  { title: "TIL: Backbone Routers", body: "Aenean lacinia bibendum nulla sed consectetur. Donec id elit non mi porta gravida at eget metus. Donec id elit non mi porta gravida at eget metus. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.", user_id: users[0].id },
  { title: "TIL: SQL Trigger Functions", body: "Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Sed posuere consectetur est at lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum.", user_id: users[0].id },
  { title: "TIL: Setting up AngularJS with Yeoman", body: "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Curabitur blandit tempus porttitor. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam id dolor id nibh ultricies vehicula ut id elit. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.", user_id: users[0].id },
  { title: "Ruby: AWS signKey", body: "<p class='lead'>In order to upload files to an AWS s3 server, you need the proper credentials and you have to pass these credentials into a multipart form with your file/data. Creating the credentials is not trivial.</p><p class='lead'>We make this a class method so when the endpoint receives the GET request, we can call <code class='inline'>Amazon.get_s3_upload_key</code> and render the returned hash into json by the controller. The hash generated will consist of 4 objects:</p><ol><li>Your access key (obtained through AWS),</li><li>A secure, random key that will be the url of the s3 object,</li><li>The policy: a stringified hash Base64 encoded, and</li><li>The signature: the policy hashed with your AWS secret key, then Base64 encoded.</li></ol><p class='lead'>Obtaining <strong>access keys and secrets</strong> is a trivial process. You'll need to create an account with <a href='http://aws.amazon.com/'>Amazon Web Services</a>. Once you have registered the next step is to set up an IAM identity. Your access keys and secrets are assigned to an IAM identity.</p><p class='lead'>The <strong>key</strong> is generated by ruby's built in secure random number generator interface. The result will be appended onto the bucket url and ultimately form the url for the s3 object.</p><pre><code><span class='str'>SecureRandom.uuid</span> <span class='com'>#=> 2d931510-d99f-494a-8c67-87feb05e1594</span></code></pre><p class='lead'>The <strong>policy</strong> is Base64 encoded and must consist (at-least) of the following elements:</p>", user_id: users[0].id },
  { title: "Title 1", body: "Curabitur blandit tempus porttitor. Aenean lacinia bibendum nulla sed consectetur. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Donec ullamcorper nulla non metus auctor fringilla.", user_id: users[0].id },
  { title: "Title 2", body: "Sed posuere consectetur est at lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis risus eget urna mollis ornare vel eu leo. Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Donec id elit non mi porta gravida at eget metus.", user_id: users[0].id },
  { title: "Title 3", body: "Maecenas faucibus mollis interdum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Etiam porta sem malesuada magna mollis euismod. Nullam quis risus eget urna mollis ornare vel eu leo. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.", user_id: users[0].id },
  { title: "Title 4", body: "Maecenas faucibus mollis interdum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere consectetur est at lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.", user_id: users[0].id },
  { title: "Title 5", body: "Cras mattis consectetur purus sit amet fermentum.", user_id: users[0].id },
  { title: "Title 6", body: "Cras justo odio, dapibus ac facilisis in, egestas eget quam.", user_id: users[0].id },
  { title: "Title 7", body: "Sed posuere consectetur est at lobortis.", user_id: users[0].id },
  { title: "Title 8", body: "Etiam porta sem malesuada magna mollis euismod.", user_id: users[0].id },
  { title: "Title 9", body: "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.", user_id: users[0].id },
  { title: "Title 10", body: "Cras justo odio, dapibus ac facilisis in, egestas eget quam.", user_id: users[0].id },
  { title: "Title 11", body: "Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.", user_id: users[0].id },
  { title: "Title 12", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", user_id: users[0].id },
  { title: "Title 13", body: "Curabitur blandit tempus porttitor.", user_id: users[0].id },
  { title: "Title 14", body: "Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.", user_id: users[0].id },
  { title: "Title 15", body: "Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.", user_id: users[0].id },
  { title: "Title 16", body: "Curabitur blandit tempus porttitor.", user_id: users[0].id },
  { title: "Title 17", body: "Nulla vitae elit libero, a pharetra augue.", user_id: users[0].id },
  { title: "Title 18", body: "Aenean lacinia bibendum nulla sed consectetur.", user_id: users[0].id },
  { title: "Title 19", body: "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.", user_id: users[0].id },
  { title: "Title 20", body: "Morbi leo risus, porta ac consectetur ac, vestibulum at eros.", user_id: users[0].id },
  { title: "Title 21", body: "Aenean lacinia bibendum nulla sed consectetur.", user_id: users[0].id },
  { title: "Title 22", body: "Donec id elit non mi porta gravida at eget metus.", user_id: users[0].id },
  { title: "Title 23", body: "Donec sed odio dui.", user_id: users[0].id },
  { title: "Title 24", body: "Integer posuere erat a ante venenatis dapibus posuere velit aliquet.", user_id: users[0].id }
])

images = Image.create([
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/eb00f33c-b80e-4e72-ada4-36bdc24f551b"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/e435045a-3719-4c52-b28f-4a137ffa797d"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/c0fd12b2-cd5e-482c-8461-754f0d68af76"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/9b29e2b6-9c1b-4632-b9bd-0c70b0edf7b4"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/90f76682-65fe-43a8-8346-9b7e1cf46fa7"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/7076b2a0-0d99-4c59-9172-0395ad6435b8"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/68845be2-443d-47bc-915c-5b98dfc425e8"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/4f6ee78a-4090-433c-85bb-7fdf4f49bd59"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/4b534792-4dd5-47c0-9c05-91fed7bcde41"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/4441cf26-bd79-40bb-8088-a1043b0539c6"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/363414b9-f355-47dc-9a91-7ace45e7a00e"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/221f5f6e-43bc-4ca8-9caa-18a682734b58"},
  {url: "https://s3.amazonaws.com/dubya-blog-bucket/uploads/199b6d9e-787a-43fc-a4ea-e7796a0842fc"}
])

posts[0].categories << Category.find_by(name:"Development")
posts[0].categories << Category.find_by(name:"Ruby")
posts[0].categories << Category.find_by(name:'Javascript')
posts[0].categories << Category.find_by(name:'TIL')

posts[1].categories << Category.find_by(name:"Development")
posts[1].categories << Category.find_by(name:"Ruby")
posts[1].categories << Category.find_by(name:"Computer Science")
posts[1].categories << Category.find_by(name:"TIL")

posts[2].categories << Category.find_by(name:"Development")
posts[2].categories << Category.find_by(name:"Graphic Design")
posts[2].categories << Category.find_by(name:"XML")
posts[2].categories << Category.find_by(name:"TIL")

posts[3].categories << Category.find_by(name:"Development")
posts[3].categories << Category.find_by(name:"Photography")
posts[3].categories << Category.find_by(name:"Ruby")
posts[3].categories << Category.find_by(name:"Illustration")

posts[4].categories << Category.find_by(name:"Development")
posts[4].categories << Category.find_by(name:"Data Viz")
posts[4].categories << Category.find_by(name:"Computer Science")
posts[4].categories << Category.find_by(name:"Travel")

posts[5].categories << Category.find_by(name:"Development")
posts[5].categories << Category.find_by(name:"Hobbies")
posts[5].categories << Category.find_by(name:"Testing")
posts[5].categories << Category.find_by(name:"SQL")

posts[6].categories << Category.find_by(name:"Development")
posts[6].categories << Category.find_by(name:"Ruby")
posts[6].categories << Category.find_by(name:"jQuery")
posts[6].categories << Category.find_by(name:"XML")

posts[7].categories << Category.find_by(name:"Javascript")
posts[8].categories << Category.find_by(name:"CSS")
posts[9].categories << Category.find_by(name:"Travel")
posts[10].categories << Category.find_by(name:"SQL")
posts[11].categories << Category.find_by(name:"Infographics")
posts[12].categories << Category.find_by(name:"TIL")
posts[13].categories << Category.find_by(name:"Infographics")
posts[14].categories << Category.find_by(name:"SQL")
posts[15].categories << Category.find_by(name:"Graphic Design")
posts[16].categories << Category.find_by(name:"AngularJS")
posts[17].categories << Category.find_by(name:"Design")
posts[18].categories << Category.find_by(name:"Ruby")
posts[19].categories << Category.find_by(name:"Javascript")
posts[20].categories << Category.find_by(name:"Illustration")
posts[21].categories << Category.find_by(name:"Travel")
posts[22].categories << Category.find_by(name:"Hobbies")
posts[23].categories << Category.find_by(name:"HTML")
posts[24].categories << Category.find_by(name:"Photography")
posts[25].categories << Category.find_by(name:"TIL")
posts[26].categories << Category.find_by(name:"Ruby")
posts[27].categories << Category.find_by(name:"TIL")
posts[28].categories << Category.find_by(name:"CSS")
posts[29].categories << Category.find_by(name:"TIL")
posts[30].categories << Category.find_by(name:"Data Viz")
posts[31].categories << Category.find_by(name:"TIL")
posts[32].categories << Category.find_by(name:"TIL")

images.each { |image| posts[12].images << image }

# cUrl to the user's avatar
# curl -X PATCH -F "user[avatar]=@app/assets/images/judge.jpg" http://localhost:3000/users/1
# curl -X PATCH -F "user[avatar]=@app/assets/images/judge.jpg" http://jwdotcom.herokuapp.com/users/9

# cUrl to a post's image
# curl -X PATCH -F "post[image]=@app/assets/images/post-image-1.gif" http://localhost:3000/posts/1
# curl -X PATCH -F "post[image]=@/Users/jason/Pictures/Kauai-2014/bin/full-size/kauai-napali-coast-boat-2.jpg" http://jwdotcom.herokuapp.com/posts/:id
# image: "http://s3.amazonaws.com/dubya-blog-bucket/posts/images/000/000/001/original/post-image-1.gif?1418096877" 
# image: "https://s3.amazonaws.com/dubya-blog-bucket/posts/images/000/000/001/original/kauai-napali-coast-boat-2.jpg" 




















