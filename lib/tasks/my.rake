task :fake => :environment do
  User.delete_all
  Post.delete_all
  Comment.delete_all

  users = []
  users << User.create!( :email => "admin@example.org", :password => "12345678")

  puts "Generate 20 fake users..."
  20.times do
    users << User.create!( :email => Faker::Internet.email, :password => "12345678")
  end

  50.times do |i|
    puts "Generate fake post #{i}"

    post = Post.create!( :title => Faker::Lorem.sentence,
                         :content => Faker::Lorem.paragraph,
                         :user_id => users.sample.id )

    5.times do
      Like.create!( :user => users.sample, :post => post )
    end

    rand(99).times do
      Subscription.create!( :user => users.sample, :post => post )
    end

    10.times do |j|
      post.comments.create!( :status => ["public", "private"].sample,
                             :content => Faker::Lorem.paragraph,
                             :user_id => users.sample.id )
    end
  end

end