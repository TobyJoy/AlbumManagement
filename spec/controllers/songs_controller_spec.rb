require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  
  describe 'GET #index' do
    
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user)
      sign_in user
    end
    
    it "gets all songs to load index" do
      album = create(:music_album, name: "Pagal", genres: "Bollywood", artist: "Toby")
      song  = create(:song, song_title: "morgan", duration: "2.30", music_album_id: album.id)
      get music_album_songs_url(music_album_id: album.id)
      expect(response).to render_template music_album_songs_url(music_album_id: album.id)
    end
  end
  
  # describe 'GET #new' do
#     
    # before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:user]
      # user = create(:user)
      # sign_in user
    # end
#     
    # it "returns http success" do
      # @album = build(:music_album)
      # allow(MusicAlbum).to receive(:new).and_return(@album)
      # get :new
      # expect(response).to render_template :new
    # end 
  # end
#   
  # describe "#create" do
#     
    # before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:user]
      # user = create(:user)
      # sign_in user
    # end
#     
    # context "for valid resource" do
      # it "redirects to the new music album" do
        # post :create, :params => { music_album: attributes_for(:music_album) }
        # album = MusicAlbum.order(:id).last
        # response.should redirect_to new_music_album_song_url(music_album_id: album.id)
      # end
    # end
#       
    # context "with invalid attributes" do
      # it "does not save the new contact" do
        # expect{
          # post :create, :params => { music_album: attributes_for(:music_album).merge(name: nil) }
        # }.to_not change(MusicAlbum,:count)
      # end
#       
      # it "re-renders the new method" do
        # post :create, :params => { music_album: attributes_for(:music_album).merge(name: nil) }
        # response.should render_template :new
      # end
    # end 
  # end


end
