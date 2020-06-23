class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events + @user.attended_events
    @upcoming_events = []
    @previous_events = []
    @events.each do |event|
      if Time.now < event.event_date
        @upcoming_events << event
      else
        @previous_events << event
      end
    end
  end
end
