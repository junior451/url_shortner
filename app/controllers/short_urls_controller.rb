class ShortUrlsController < ApplicationController
  include SlugGenerator

  def index
    @urls = Shortner.all
  end

  def new
    @urlShortner = Shortner.new
  end

  def get_original_url
    shortened = Shortner.where(slug: params[:slug]).first
    shortened.no_visits += 1
    shortened.save
    redirect_to shortened.url
  end

  def create
    slug = generate_slug

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
