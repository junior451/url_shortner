class ShortUrlsController < ApplicationController
  def index
    @urls = Shortner.all
  end

  def new
    @urlShortner = Shortner.new
  end

  def create
    slug = "DDFGG"
    @shortened = Shortner.new(shortner_params.merge({slug: slug}))

    if @shortened.save
      redirect_to short_urls_index_path
    else
      render :new
    end
  end

  private

  def shortner_params
    params.permit(:url)
  end
end
