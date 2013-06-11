class PagesController < ApplicationController
  def index
  end

  def new_transit
    @transit = Transit.new
  end

  def about
  end


end