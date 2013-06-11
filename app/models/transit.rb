class Transit < ActiveRecord::Base
  attr_accessible :direction_id, :end_time, :route_id, :pause, :start_time, :stop_id, :walk_duration, :weekday, :weekend, :user_id

  belongs_to :user
  belongs_to :route
  belongs_to :stop
  belongs_to :direction

  require 'open-uri'

  def fetch_minutes
    r_tags = current_user.
    s_tag =
    url = "http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=sf-muni&r=" + "#{URI.escape(r_tag)}" + "#{URI.escape(s_tag)}"
    results = Nokogiri::XML(open(url))

    predictions = results.xpath('//predictions/direction/prediction')
    minutes = []
    predictions.each do |p|
      minutes << p.attr('minutes')
    end
    return minutes
  end
end
