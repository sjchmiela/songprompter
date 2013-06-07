class EventsController < ApplicationController
  # before_action :set_event, only: [:show, :edit, :update, :destroy]
  expose(:event, attributes: :event_params)
  expose(:events) { Event.includes(:events_songs, :songs)}
  expose(:event_songs) { event.events_songs.order("position").includes(:song) }
  expose(:songs) { Song.find(:all, :conditions => ['id not in (?)', event.songs.map(&:id).join(',')], :order => :name)}
  # GET /events
  # GET /events.json
  def index
  end

  # GET /events/1/presentation
  def presentation
    render :layout => "presentation.html.erb"
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    if event.save
      update_songs
      redirect_to event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if event.save
      update_songs
      redirect_to event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    event.events_songs.each do |e|
      e.destroy
    end
    event.destroy
    redirect_to events_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date)
    end

    def update_songs
      event.events_songs.each do |e|
        e.destroy
      end
      params[:event_songs].each_with_index do |(key, value), index|
        EventsSong.create(:event => event, :song => Song.find(key), :position => index)
      end
    end
end
