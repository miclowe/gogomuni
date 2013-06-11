class PagesController < ApplicationController
  def index
  end

  def new_transit
    @routes = Route.all
    @stops = Stop.all
    @transit = Transit.new
  end

  def about
  end


end