class Memo < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :user_id, :memo


end
