class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events + @user.attended_events
    @upcoming_events = Event.upcoming
    @previous_events = Event.past
  end
end
