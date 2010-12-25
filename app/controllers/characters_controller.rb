require 'ustream'

class CharactersController < ApplicationController
  def show
    @character = Character.find_by_name(params[:id]) || Character.find(params[:id])
  end

  def reload
    @character = Character.find_by_name(params[:id]) || Character.find(params[:id])
    @character.load

    redirect_to character_path(@character.name)
  end
end
