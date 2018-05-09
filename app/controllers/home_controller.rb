class HomeController < ApplicationController
  
  def index
    @albums = params[:search_value].blank? ? MusicAlbum.all : MusicAlbum.search(params[:search_value]).records
  end
  
end
