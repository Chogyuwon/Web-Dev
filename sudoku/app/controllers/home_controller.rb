class HomeController < ApplicationController
  def index
    @contry = Contry.order("RANDOM()").first
  end
end
