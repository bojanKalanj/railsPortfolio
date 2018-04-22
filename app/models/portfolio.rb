class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if:
                                lambda { |attrs| attrs['name'].blank? }

  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  after_initialize :set_default

  def set_default
    # self.main_image ||= "http://via.placeholder.com/600x400"
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    # self.thumb_image ||= "http://via.placeholder.com/350x200"
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

  # scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Angular") }
end
