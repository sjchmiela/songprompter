class SongsController < ApplicationController
  # before_action :set_song, only: [:show, :edit, :update, :destroy]
  expose(:song, attributes: :song_params)
  expose(:songs)
  expose(:events) { song.events }
  # GET /songs
  # GET /songs.json
  def index
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    if song.save
      redirect_to song, notice: 'Song was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    if song.save
      redirect_to song, notice: 'Song was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    song.destroy
    redirect_to songs_url, notice: 'Song was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :text)
    end
end
