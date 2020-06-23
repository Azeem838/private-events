class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = Event.upcoming.where(creator_id: @user.id)
    @previous_events = Event.past.where(creator_id: @user.id)
  end
end
