require 'uri'

class Shortner < ApplicationRecord
  validates :url, presence: true
end
