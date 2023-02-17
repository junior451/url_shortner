require 'rails_helper'

RSpec.describe "ShortUrls", type: :request do
  describe "GET /" do
    it "renders the index page" do
      get "/"

      expect(response).to render_template(:index)
    end

    it "lists all the unique slugs which has been created" do
      shortner = create(:shortner)

      get "/"

      expect(response.body).to include(shortner.slug)
    end

    it "returns a successful response" do
      get "/"

      expect(response).to have_http_status(200)
    end
  end

  describe "Get /new" do
    before do
      get "/new"
    end

    it "renders the new page" do
      expect(response).to render_template(:new)
    end

    it "returns a successful response" do
      expect(response).to have_http_status(200)
    end
  end


  describe "creating a short url" do
    it "creates a new short url and redirects to the index page" do
      post "/short_urls", params: { url: "www.example.com" }

      expect(Shortner.count) == 1
    end

    it "returns a successful response" do
      post "/short_urls", params: { url: "www.example.com" }

      follow_redirect!

      expect(response.body).to include(Shortner.first.slug)
      expect(response).to have_http_status(:success)
    end
  end

end