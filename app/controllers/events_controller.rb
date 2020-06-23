class EventsController < ApplicationController
	helper_method :upcoming, :past 
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def shows
    @event = Event.find(params[:id])
    @user = User.find(@event.creator_id)
  end

  def past
    past_events = []
    Event.all.each do |event|
      past_events << event if event.event_date < Time.now
    end
    past_events
  end

  def upcoming
    upcoming_events = []
    Event.all.each do |event|
      upcoming_events << event if event.event_date >= Time.now
    end
    upcoming_events
  end

  def create
    @event = current_user.events.build(events_params)
    # @event = Event.new(params[:id])

    #   respond_to do |format|
    #     if @blog.save
    #       format.html { redirect_to @blog, notice: 'Blog was successfully created.' }

    #     else
    #       format.html { render :new }
    #       format.json { render json: @blog.errors, status: :unprocessable_entity }
    #     end
    #   end
  end

  private

  def event_params
    require(:events).permit(:location, :event_date)
  end
end
