class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create :attendance_send

  def attendance_send
    UserMailer.attendance_email(self.event, self.user).deliver_now
  end

end
