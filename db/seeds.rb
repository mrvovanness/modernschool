# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'open-uri'

# doc = Nokogiri::HTML(open("https://htmlacademy.ru/courses/"))
# doc.xpath('//tr')[1..18].each do |x|
#   Course.create(title: x.css('a')[0].text, description: x.css('p').text, user_id: 3)
# end


# ['teacher', 'student'].each do |role|
#   Role.find_or_create_by( {name: role} )
# end

titles = Nokogiri::HTML(open("https://htmlacademy.ru/courses/4")).xpath('//tr')[1..14].map do |t|
  t.css('a')[0].text
end

descriptions = (1..14).map do |n|
  Nokogiri::HTML(open("https://htmlacademy.ru/courses/4/run/" << n.to_s)).xpath('//p')[0].text
end

14.times do |i|
  Lesson.create(title: titles[i+1], description: descriptions[i+1], course_id: 16)
end

