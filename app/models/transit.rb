class Transit < ActiveRecord::Base
  attr_accessible :direction_id, :end_time, :route_id, :pause, :start_time, :stop_id, :buffer, :weekday, :weekend, :user_id
  attr_accessible :minutes

  belongs_to :user
  belongs_to :route
  belongs_to :stop
  belongs_to :direction

  require 'open-uri'


event = Huey::Event.new(name: 'All Lights Off', group: all, actions: {on: false})



  def self.fetch_minutes
    @transits = Transit.all
    g = Huey::Group.new(Huey::Bulb.find(3))
    g.name = 'bulbs'
    group = Huey::Group.find('bulbs')
    green = Huey::Event.new(name: 'Turn Green', group: group, actions: {on: true, hue: 25717, sat: 254, bri: 240})
    orange = Huey::Event.new(name: 'Turn Orange', group: group, actions: {on: true, hue: 7000, sat: 254, bri: 240})
    off = Huey::Event.new(name: 'Turn Off', group: group, actions: {on: false})
    red = Huey::Event.new(name: 'Turn Red', group: group, actions: {on: true, hue: 0, sat: 254, bri: 254})

    check_start = Time.now - (30 * 60)

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
        @minutes = []
        predictions.each do |p|
          @minutes << p.attr('minutes')
        end

        t_buffer = transit.buffer

        @minutes.each do |m|
          time = m.to_i - t_buffer
          puts "Delta: #{time}"
          if (0..1).include?(time)
            puts "red"
            red.execute
            break
          elsif (2..3).include?(time)
            puts "orange"
            orange.execute
            break
          elsif (4..10).include?(time)
            puts "green"
            green.execute
            break
          elsif (11..100).include?(time) || nil
            puts "off"
            off.execute
          end
        end
      else
        off.execute
      end
    end
  end
end
