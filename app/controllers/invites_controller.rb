class InvitesController < ApplicationController
  def new; end

  def create
    @invite = Invite.new(params.permit(:user_id, :event_id))
    return unless @invite.save

    flash[:notice] = 'You are now attending this event'
    redirect_to root_path
  end
end
