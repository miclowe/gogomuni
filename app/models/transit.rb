class Transit < ActiveRecord::Base
  attr_accessible :direction_id, :end_time, :route_id, :pause, :start_time, :stop_id, :buffer, :weekday, :weekend, :user_id

  belongs_to :user
  belongs_to :route
  belongs_to :stop
  belongs_to :direction

  require 'open-uri'

  def self.fetch_minutes
    @transits = Transit.all
    check_start = Time.now - (5 * 60)

    @transits.each do |transit|
      # t_user_id = transit.user_id
      t_start_time = Time.parse(transit.start_time.strftime("%I:%M:%S %p"))

      if (check_start..Time.now).cover? t_start_time
        t_route_id = Route.find_by_id(transit.route_id)
        t_stop_id = Stop.find_by_id(transit.stop_id)
        t_r_tag = t_route_id.r_tag.to_s
        t_s_tag = t_stop_id.s_tag.to_s

        # puts "Start time: #{t_start_time}"
        # puts "Start check time: #{check_start}"

        puts "Fetching predictions for Route: #{t_r_tag}, Stop: #{t_s_tag}"

        url = "http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=sf-muni&r=#{URI.escape(t_r_tag)}&s=#{URI.escape(t_s_tag)}"
        results = Nokogiri::XML(open(url))

        predictions = results.xpath('//predictions/direction/prediction')
        minutes = []
        predictions.each do |p|
          minutes << p.attr('minutes')
        end

        t_buffer = transit.buffer
        minutes.each do |m|
          time = m.to_i - t_buffer
          if (0..1).include?(time)
            puts "red"
          elsif (2..3).include?(time)
            puts "blink"
          elsif (4..10).include?(time)
            puts "green"
          end
        end
      end
    end
  end
end
