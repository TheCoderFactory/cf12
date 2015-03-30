# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://coderfactory.co"
SitemapGenerator::Sitemap.sitemaps_host = "https://dl.dropboxusercontent.com/u/2236963/CFSitemap"
SitemapGenerator::Sitemap.public_path = 'tmp/'
# SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.create do

  add '/fast-track', :priority => 0.7, :changefreq => 'weekly'

  # Add all courses
  Shoppe::Product.all.active.each do |course|
    if course.has_variants?
      add '/courses/' + course.product_category.permalink + '/' + course.permalink, :lastmod => course.updated_at
    end
  end

  #
  # Add all articles:
  #
    Post.all.each do |post|
      add '/posts/' + post.slug, :lastmod => post.updated_at
    end


    add '/blog', :priority => 0.7, :changefreq => 'daily'
    add '/contact', :priority => 0.5, :changefreq => 'weekly'
end
