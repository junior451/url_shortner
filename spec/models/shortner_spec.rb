require 'rails_helper'

RSpec.describe Shortner, type: :model do
  let(:shortned_url) { build(:shortner) }

  it "is valid with valid attributes" do
    expect(shortned_url).to be_valid
  end

  it "is invalid without a url" do
    shortned_url.url = nil
    expect(shortned_url).to_not be_valid
  end
end
