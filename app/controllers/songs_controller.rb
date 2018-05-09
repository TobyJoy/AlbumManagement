class SongsController < ApplicationController
  
  layout 'home'
  
  before_action :authenticate_user!, except: [:index]
  
  before_action :find_album, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  before_action :find_songs, only: [:edit, :update, :destroy]
  
  
  def index
    @songs = @album.songs.nil? ? [] : @album.songs
  end
  
  def new
    @song = Song.new
  end
  
  def create
    song = Song.new(song_params.merge(music_album_id: @album.id))
    flash.now[:notice] = "Successfully Created Song" if song.save
    flash.now[:error] = song.errors.full_messages.uniq.join(', ') if !song.save
    redirect_to music_album_songs_path(music_album_id: @album.id)
  end
  
  def edit
  end
  
  def update
    update_song = @song.update_attributes(song_params)
    flash.now[:notice] = "Successfully Updated Song" if update_song
    flash.now[:error] = @song.errors.full_messages.uniq.join(', ') if !update_song
    redirect_to music_album_songs_path(music_album_id: @album.id)
  end
  
  def destroy
    destroy_song = @song.delete
    flash.now[:notice] = "Successfully Deleted Song" if destroy_album
    flash.now[:error] = @song.errors.full_messages.uniq.join(', ') if !destroy_album
    redirect_to music_album_songs_path(music_album_id: @album.id)
  end
  
  private
  
  def song_params
    params.require(:song).permit(:song_attachment, :song_title, :duration)
  end
  
  def find_album
    @album = MusicAlbum.find_by_id(params[:music_album_id].to_i)
  end
end
