# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://htmlacademy.ru/courses/"))
doc.xpath('//tr')[1..18].each do |x|
  Course.create(title: x.css('a')[0].text, description: x.css('p').text, user_id: 3)
end


# ['teacher', 'student'].each do |role|
#   Role.find_or_create_by( {name: role} )
# end


