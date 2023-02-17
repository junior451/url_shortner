class Shortner < ApplicationRecord
  validates :url, presence: true
  validate :valid_url

  def valid_url
    if url != nil
      uri = URI.parse(url)
      errors.add(:url, "not valid") unless uri.is_a?(URI::HTTP) && !uri.host.nil?
    end
  end  
end
