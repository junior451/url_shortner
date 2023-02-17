require 'rails_helper'

RSpec.describe UrlShortner, type: :model do
  let(:shortened_url) { build(:url_shortner) }

  it "is valid with valid attributes" do
    p UrlShortner.all
    #expect(shortened_url).to be_valid
  end
end
