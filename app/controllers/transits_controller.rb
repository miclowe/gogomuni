class TransitsController < ApplicationController

  def new
    @transit = Transit.new
  end

  def create
    redirect_to @transit
  end

end
