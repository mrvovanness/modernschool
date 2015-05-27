require 'nokogiri'
require 'open-uri'
# doc = Nokogiri::HTML(open("https://htmlacademy.ru/courses/"))
# doc.xpath('//tr')[1..18].each do |x|
#   Course.create(title: x.css('a')[0].text, description: x.css('p').text, user_id: 3)
# end


# ['teacher', 'student'].each do |role|
#   Role.find_or_create_by( {name: role} )
# end

# titles = Nokogiri::HTML(open("https://htmlacademy.ru/courses/4")).xpath('//tr')[1..14].map do |t|
#   t.css('a')[0].text
# end
#
# descriptions = (1..14).map do |n|
#   Nokogiri::HTML(open("https://htmlacademy.ru/courses/4/run/" << n.to_s)).xpath('//p')[0].text
# end
#
# 14.times do |i|
#   Lesson.create(title: titles[i+1], description: descriptions[i+1], course_id: 16)
# end

# answers = Nokogiri::HTML(open("https://toster.ru/q/216153"))
# answers.xpath('//article').each do |a|
#   Comment.create(lesson_id: 17, body: a.css('div.answer__text').text.strip, commenter_name: a.css('a.user-summary__name').text.strip)
# end

# news = Nokogiri::HTML(open("http://ria.ru/education")).css('div.list_item_content')
# news.each do |n|
#   Post.create(user_id: 3, title: n.css('h3.list_item_title a').text, body_markdown: n.css('div.list_item_announce').text)
# end

puts exams =  Nokogiri::HTML(open("http://studydep.miigaik.ru/akzamen/")).css('table.t')
