class PagesController < ApplicationController
  def index
    @character = Character.find_by_name('Kelsin', :include => { :videos => :matches })
  end
end
