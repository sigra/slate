# Markdown
set :markdown_engine, :kramdown

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

activate :i18n, mount_at_root: :ru, langs: [:en, :ru]

# Activate the syntax highlighter
activate :syntax

activate :autoprefixer do |config|
  config.browsers = ['last 2 version', 'Firefox ESR']
  config.cascade  = false
  config.inline   = true
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

# Build Configuration
configure :build do
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  activate :minify_css
  activate :minify_javascript
  # activate :relative_assets
  # activate :asset_hash
  # activate :gzip
end

activate :deploy do |deploy|
  deploy.build_before    = true
  deploy.deploy_method   = :sftp
  deploy.host            = 'app.salesap.ru'
  deploy.port            = 22
  deploy.path            = '/mnt/sites/salesap_api/www'
  deploy.user            = 'salesap_api'
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567
