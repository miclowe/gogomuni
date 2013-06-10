# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

# Seeds all of the Muni Routes
Route.delete_all

url = "http://webservices.nextbus.com/service/publicXMLFeed?command=routeList&a=sf-muni"
results = Nokogiri::XML(open(url))

routes = results.xpath('//route')
routes.each do |r|
  r_tag = r.attr('tag')
  r_title = r.attr('title')
  Route.create!(:r_tag => r_tag, :r_title => r_title)
end

# Seeds all of the Muni stops and directions
Stop.delete_all
Direction.delete_all
Stopdirection.delete_all

Route.all.each do |row|
  r_tag = row.r_tag
  url = "http://webservices.nextbus.com/service/publicXMLFeed?command=routeConfig&a=sf-muni&r=" + "#{URI.escape(r_tag)}"
  results = Nokogiri::XML(open(url))

  stops = results.xpath('//route/stop')
  stops.each do |s|
    s_tag = s.attr('tag')
    s_title = s.attr('title')
    Stop.create!(:r_tag => r_tag, :s_tag => s_tag, :s_title => s_title)
  end

  directions = results.xpath("//route/direction")
  directions.each do |d|
    d_title = d.attr('title')

    directions.search("stop").each do |s|
      stop = Stop.find_by_s_tag(s.attr('title'))
      stop[:d_title] = d_title
      stop.save!
    end
  end
end


# stops = results.xpath('//route/stop')
#   stops.each do |s|
#     s_tag = s.attr('tag')
#     s_title = s.attr('title')
#     Stop.create!(:r_tag => r_tag, :s_tag => s_tag, :s_title => s_title)
#   end

#   directions = results.xpath("//route/direction")
#   directions.each do |d|
#     d_tag = d.attr('tag')
#     d_title = d.attr('title')
#     direction = Direction.create!(:d_tag => d_tag, :d_title => d_title)

#     directions.search("stop").each do |s|
#       stop = Stop.find_by_s_tag(s.attr('title'))
#       stop.direction = direction
#       stop.save!
#     end
#   end
