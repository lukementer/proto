class Link < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  before_save :validate_protocol
  
  private
  def validate_protocol
    title = URI.parse(self.title)
    self.title = "http://#{self.title}" if title.scheme.blank?
  end
end
