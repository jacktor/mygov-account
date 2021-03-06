class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  validates_presence_of :subject, :received_at, :user_id
  after_create :deliver_notification

  attr_accessible :body, :received_at, :subject, :as => [:default, :admin]
  attr_accessible :user_id, :app_id, :as => :admin
  
  def self.newest_first
    order('received_at DESC, id DESC')
  end
  
  def self.not_viewed
    where(viewed_at: nil)
  end
  
  private
  
  def deliver_notification
    NotificationMailer.notification_email(self).deliver
  end
end
