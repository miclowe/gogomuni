class PagesController < ActionController::Base
  require  'open-uri'

  def index

  end

  def test
    # url = "http://webservices.nextbus.com/service/publicXMLFeed?command=routeList&a=sf-muni"
    # results = Nokogiri::XML(open(url))

    # @routes = []

    # routes = results.xpath('//route')
    # routes.each do |r|
    #   @route = {}
    #   @route[:r_tag] = r.attr('tag')
    #   @route[:r_title] = r.attr('title')
    #   @routes << @route
    # end


    # @stops = []
    # @routes.each do |route|
    #   route_tag = route[:r_tag]
      # url = "http://webservices.nextbus.com/service/publicXMLFeed?command=routeConfig&a=sf-muni&r=" + "#{URI.escape(route_tag)}"
      # results = Nokogiri::XML(open(url))

      # stops = results.xpath('//route/stop')
      # stops.each do |s|
      #   @stop = {}
      #   @stop[:s_tag] = s.attr('tag')
      #   @stop[:s_title] = s.attr('title')
      #   dirs = results.xpath('//direction')
      #   @stops << @stop
      # end


    url = "http://webservices.nextbus.com/service/publicXMLFeed?command=routeConfig&a=sf-muni&r=N"
    results = Nokogiri::XML(open(url))

    @directions = []

    results.each do |row|
      dirs = results.xpath('//route/direction')
      @d_tag = row.attr('tag')
      @d_title = row.attr('title')
      # dirs.each do |stops|
      #   s_tag =
      # end
      @directions << @d_tag
      @directions << @d_title
    end

      # dirs = results.xpath('//direction')
      # dirs.each do |d|

      #   dir = d.attr('tag')
      #   dir_title = d.attr('title')
      #   dir_stops = results.xpath('//direction/stop')
      #   dir_stops.each do |ds|
      #     @dir_stop = ds.attr('tag')
      #   end

      # end




  end
end