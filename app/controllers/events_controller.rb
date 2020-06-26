class EventsController < ApplicationController
  helper_method :upcoming, :past
  def new
    # byebug
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.creator_id)
  end

  def past
    Event.past
  end

  def upcoming
    Event.upcoming
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = 'You have successfully created an event'
      redirect_to root_path
    else
      flash.now[:alert] = 'Please fix the errors'
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:location, :event_date)
  end
end
