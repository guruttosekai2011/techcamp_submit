class AddInvitationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invitation_code, :string 
  end
end
