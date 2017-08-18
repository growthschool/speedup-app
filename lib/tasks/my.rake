task :fake => :environment do
  User.delete_all
  Post.delete_all

  users = []
  100.times do
    users << User.create!( :email => Faker::Internet.email, :password => "12345678")
  end

  100.times do |i|
    post = Post.create!( :title => Faker::Lorem.sentence,
                         :content => Faker::Lorem.paragraph,
                         :user_id => users.sample.id )

  end

end