class PagesController < ApplicationController
  def index
    @character = Character.find_by_name('Kelsin')
  end
end
