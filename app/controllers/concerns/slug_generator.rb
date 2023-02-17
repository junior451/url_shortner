module SlugGenerator

  private

  def generate_slug
    ('A'..'Z').to_a.shuffle[0,5].join
  end
end