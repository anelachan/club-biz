# main class to store event data incl. basic details and ticket purchase info
# also stores related students, posts, ads, announcements
# an event is associated with one club, and can only be created by an Admin.

class Event < ActiveRecord::Base
  belongs_to :club, class_name: "Club"
  has_many :ticket_reservations, foreign_key: "event_id", dependent: :destroy
  has_many :students, through: :ticket_reservations, source: :student
  has_many :posts, foreign_key: "event_id", dependent: :destroy
  has_many :ads, foreign_key: "event_id", dependent: :destroy
  has_many :announcements, foreign_key: "event_id", dependent: :destroy

  has_attached_file :banner, styles: {thumb: "100x100#"}, default_url: "/images/:style/missing.png"
  validates_attachment :banner, presence: true, 
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, 
    size: {in: 0..1.megabytes}

  validates :name, presence:true
  validates :start, presence:true 
  validates :end, presence:true
  validates :location, presence:true, length: {minimum: 4}
  validates :description, presence:true, length: {maximum: 500}
  validates :ticket_price, presence:true, numericality: :true
  validates :initial_tickets_avail, presence:true, numericality: {only_integer: true}
  validates :ticket_purchase_instructions, presence:true, length: {maximum: 140}
  validates :sales_start, presence:true
  validates :sales_end, presence:true
  validates :conditions, presence:true, length: {maximum: 200}
  validates :banner, presence:true

  validate :valid_start, :valid_end, :valid_sales_start, :valid_sales_end
  validate :start_has_time, :end_has_time, :sales_start_has_time, :sales_end_has_time
  validate :start_in_future, :sales_start_in_future
  validate :end_after_start, :sales_end_after_start

  default_scope -> {order('start ASC')}

  # THE FOLLOWING ARE ALL DATETIME VALIDATIONS #
  def start_has_time
    errors.add(:start, " must have a time. Time cannot be midnight.") unless \
    has_time?(self.start)
  end

  def end_has_time
    errors.add(:end, " must have a time. Time cannot be midnight.") unless \
    has_time?(self.end)
  end

  def sales_start_has_time
    errors.add(:sales_start, " must have a time. Time cannot be midnight.") unless \
    has_time?(self.sales_start)
  end

  def sales_end_has_time
    errors.add(:sales_end, " must have a time. Time cannot be midnight.") unless \
    has_time?(self.sales_end)
  end

  def has_time?(dt)
    dt.strftime("%H:%M") != "00:00"
    rescue NoMethodError
      false 
  end

  def valid_start
    errors.add(:start, " date/time not valid. Please enter in format DD/MM/YYYY HH:MM") unless \
    valid_datetime?(self.start)
  end

  def valid_end
    errors.add(:end, " date/time not valid. Please enter in format DD/MM/YYYY HH:MM") unless \
    valid_datetime?(self.end)
  end

  def valid_sales_start
    errors.add(:sales_start, " date/time not valid. Please enter in format DD/MM/YYYY HH:MM") unless \
    valid_datetime?(self.sales_start)
  end

  def valid_sales_end
    errors.add(:sales_end, " date/time not valid. Please enter in format DD/MM/YYYY HH:MM") unless \
    valid_datetime?(self.sales_end)
  end

  def valid_datetime?(dt)
    str = dt.strftime("%d/%m/%Y %H:%M")
    DateTime.parse(str)
    true
    rescue ArgumentError, NoMethodError
      false
  end

  def start_in_future
    if !self.start.nil?
      errors.add(:start, " cannot be in the past.") unless self.start > DateTime.now
    end
  end

  def sales_start_in_future
    if !self.sales_start.nil?
      errors.add(:sales_start, " cannot be in the past.") unless self.sales_start > DateTime.now
    end
  end

  def end_after_start
    if !self.start.nil? and !self.end.nil?
      errors.add(:end, " cannot be before start") unless self.end > self.start
    end
  end

  def sales_end_after_start
    if !self.sales_start.nil? and !self.sales_end.nil?
    errors.add(:sales_end, " cannot be before start") unless self.sales_end > self.sales_start
    end
  end

end
