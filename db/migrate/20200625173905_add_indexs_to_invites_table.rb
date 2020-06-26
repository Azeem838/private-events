class AddIndexsToInvitesTable < ActiveRecord::Migration[6.0]
  def change
    add_index :invites, :user_id
    add_index :invites, :event_id
  end
end
