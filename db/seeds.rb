require 'nokogiri'
require 'open-uri'

# Roles for users
puts "create roles"
["teacher", "student"].each do |role|
Role.create!(name: role)
end
Role.all.map { |r| puts "role are created: #{r.name}" }

# Create user
puts "create user"
user = User.create!(email: "ex@mail.com", password: "bigsecret", role_ids: 1)
puts "user with email: #{user.email} and role: #{user.roles.first.name} are created"

# Create courses
puts "create courses"
doc = Nokogiri::HTML(open("https://htmlacademy.ru/courses/"))
doc.xpath('//tr')[1..18].each do |x|
  user.courses.create!(title: x.css('a')[0].text, description: x.css('p').text)
end
puts "#{Course.count} courses are created, all belongs to user with email: #{Course.first.user.email}"


# Create lessons
puts "create lessons"
titles = Nokogiri::HTML(open("https://htmlacademy.ru/courses/4")).xpath('//tr')[1..14].map do |t|
  t.css('a')[0].text
end

descriptions = (1..14).map do |n|
  Nokogiri::HTML(open("https://htmlacademy.ru/courses/4/run/" << n.to_s)).xpath('//p')[0].text
end

13.times do |i|
  user.courses.first.lessons.create!(title: titles[i+1], description: descriptions[i+1])
end
puts "#{Lesson.count} lessons are created for user with email: #{ Lesson.first.course.user.email }"

# Create comments
answers = Nokogiri::HTML(open("https://toster.ru/q/216153"))
answers.xpath('//article').each do |a|
  Lesson.all.first.comments.create!(body: a.css('div.answer__text').text.strip, commenter_name: a.css('a.user-summary__name').text.strip)
end
puts "#{Comment.count} comments are created for lesson #{Lesson.first.title}"

# Create news
news = Nokogiri::HTML(open("http://ria.ru/education")).css('div.list_item_content')
news.each do |n|
  user.posts.create!(title: n.css('h3.list_item_title a').text, body_markdown: n.css('div.list_item_announce').text)
end
puts "#{Post.count} news are created for user with email #{Post.first.user.email}"
