class User < ActiveRecord::Base

  validates :invitation_code, presence: true
  validates :invitation_code, inclusion: { in: %w(temporary_code) }

  has_many :memos, ->{ order("updated_at DESC") }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]

  def birthday
    "#{birth_year}-#{birth_month}-#{birth_day}"
  end

  def check_profile?
    nickname? && birth_year? && birth_month? && birth_day? && belonging?
  end

end
