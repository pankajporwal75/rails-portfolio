class HomeController < ApplicationController

  def index
    @texts = Text.all
  end
end