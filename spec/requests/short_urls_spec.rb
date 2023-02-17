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
      post "/short_urls", params: { url: "https://www.example.com" }

      follow_redirect!

      expect(response.body).to include(Shortner.first.slug)
      expect(response).to have_http_status(:success)
    end

    context "invalid url" do

      it "displays error message to the user" do
        post "/short_urls", params: { url: "h//www.example.com" }

        expect(response.body).to include("Url not valid")
      end
    end
  end

  describe "10 latest urls endpoint" do
    before do
      10.times do
        create(:shortner, no_visits: Random.rand(7))
      end
    end

    it "returns the latest 10 urls with the nimber of visits" do
      get "/latest_urls"

      latest_shortened_urls = Shortner.order(created_at: :asc).limit(10)

      json_response = JSON.parse (response.body)
      expect(json_response).to eq(JSON.parse(latest_shortened_urls.to_json(only: [:url, :no_visits])))
    end
  end

end