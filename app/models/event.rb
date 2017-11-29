class Event < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :address, presence: true
  validates :name,presence: true
  validates :mobile,presence: true,  numericality: { only_integer: true }
  validates :start, presence: true
  validates :from, presence: true
  geocoded_by :address
  after_validation :geocode
  mount_uploader :image, ImageUploader

  def approved?
    if self.status == true
      true
    else
      false
    end
  end

  def expiry
    byebug
    @events = Event.all
    @events.each do |event|
      if event.to.past?
        event.destroy
      end
    end
  end

end
