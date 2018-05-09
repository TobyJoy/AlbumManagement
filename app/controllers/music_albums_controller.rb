class MusicAlbumsController < ApplicationController
  layout 'home'
  
  before_action :authenticate_user!
  before_action :find_album, only: [:edit, :update, :destroy]
  
  def index
    @albums = MusicAlbum.all
  end
  
  def new
    @album = MusicAlbum.new
  end
  
  def create
    @album = MusicAlbum.new(album_params.merge(:user_id => current_user.id))
    if @album.save
      flash[:notice] = "Successfully Created Album"
      redirect_to new_music_album_song_url(music_album_id: @album.id)
    else
      flash[:error] = @album.errors.full_messages.uniq.join(', ')
      render :new 
    end
  end
  
  def edit
  end
  
  def update
    updated_album = @album.update_attributes(album_params)
    flash[:notice] = "Successfully Updated Album" if updated_album
    flash[:error] = @album.errors.full_messages.uniq.join(', ') if !updated_album
    redirect_to music_album_songs_path(music_album_id: @album.id)
  end
  
  def destroy
    destroy_album = @album.delete
    flash.now[:notice] = "Successfully Deleted Album" if destroy_album
    flash.now[:error] = @album.errors.full_messages.uniq.join(', ') if !destroy_album
    redirect_to root_path
  end
  
  private
  
  def album_params
    params.require(:music_album).permit(:name, :photo, :genres, :artist, :user_id)
  end
  
  def find_album
    @album = MusicAlbum.find_by_id(params[:id])
  end
end
