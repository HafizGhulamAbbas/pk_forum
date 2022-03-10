# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

Rails.application.config.assets.precompile += %w( jobs.css )
Rails.application.config.assets.precompile += %w( jobs.js )

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
%w[home posts users mcqs sessions faqs].each do |controller|
  Rails.application.config.assets.precompile += %W[#{controller}.js #{controller}.css]
end

Rails.application.config.assets.precompile += %w( 
  landing-animate.css 
  landing-bootstrap.css 
  landing-color-1.css 
  landing-feather-icon.css 
  landing-flag-icon.css 
  landing-fontawesome.css 
  landing-icofont.css 
  landing-owlcarousel.css 
  landing-responsive.css 
  landing-style.css 
  landing-themify.css 
  animate.css 
  bootstrap.css 
  chartist.css 
  color-1.css 
  date-picker.css 
  feather-icon.css 
  flag-icon.css 
  fontawesome.css 
  icofont.css 
  prism.css 
  responsive.css 
  style.css 
  themify.css 
  vector-map.css 
  sweetalert2.css
)
Rails.application.config.assets.precompile += %w( 
  landing-jquery-3.5.1.min.js 
  landing-feather.min.js 
  landing-feather-icon.js 
  landing-sidebar-menu.js 
  landing-config.js 
  landing-popper.min.js 
  landing-bootstrap.min.js 
  landing-owl.carousel.js 
  landing-owl-custom.js 
  landing-landing_sticky.js 
  landing-landing.js 
  landing-libs.min.js 
  landing-script.js 
  apex-chart.js 
  bootstrap-notify.min.js 
  bootstrap.min.js 
  chartist-plugin-tooltip.js 
  chartist.js 
  clipboard.min.js 
  config.js 
  counter-custom.js 
  custom-card.js 
  customizer.js 
  datepicker.custom.js 
  datepicker.en.js 
  datepicker.js 
  default.js 
  feather-icon.js 
  feather.min.js 
  index.js 
  jquery-3.5.1.min.js 
  jquery-jvectormap-2.0.2.min.js
  jquery-jvectormap-asia-mill.js 
  jquery-jvectormap-au-mill.js 
  jquery-jvectormap-chicago-mill-en.js 
  jquery-jvectormap-in-mill.js 
  jquery-jvectormap-uk-mill-en.js 
  jquery-jvectormap-us-aea-en.js 
  jquery-jvectormap-world-mill-en.js 
  jquery.counterup.min.js 
  jquery.waypoints.min.js 
  knob-chart.js 
  knob.min.js 
  popper.min.js 
  prism.min.js 
  script.js 
  sidebar-menu.js 
  stock-prices.js 
  sweetalert.min.js 
)
Rails.application.config.assets.precompile += %w( 
  landing-logo.png 
  landing-img-parten.png 
  landing-img-1.jpg 
  landing-img-2.jpg 
  landing-img-3.jpg 
  landing-img-4.jpg 
  landing-img-5.png 
  landing-img-6.jpg 
  landing-img-parten.jpg 
  landing-img-7.jpg
  landing-img-8.jpg
  landing-img-9.jpg 
  landing-1.jpg 
  landing-html.png 
  landing-bootstrap.png 
  landing-css.png 
  landing-sass.png 
  landing-pug.png 
  landing-npm.png 
  landing-gulp.png 
  landing-kit.png 
  landing-uikits.png 
  landing-layout.png 
  landing-builders.png 
  landing-iconset.png 
  landing-forms.png 
  landing-table.png 
  landing-apps.png 
  landing-unique-cards-1.jpg 
  landing-unique-cards-2.jpg 
  landing-unique-cards-3.jpg 
  landing-unique-cards-11.jpg 
  landing-unique-cards-12.jpg 
  landing-unique-cards-4.jpg 
  landing-unique-cards-5.jpg 
  landing-unique-cards-6.jpg 
  landing-unique-cards-9.jpg 
  landing-unique-cards-7.jpg 
  landing-unique-cards-8.jpg 
  landing-inner-pages-1.jpg 
  landing-inner-pages-2.jpg 
  landing-inner-pages-3.jpg 
  landing-inner-pages-4.jpg 
  landing-inner-pages-5.jpg 
  landing-inner-pages-6.jpg 
  landing-inner-pages-7.jpg 
  landing-inner-pages-8.jpg 
  landing-application-1.jpg 
  landing-application-2.jpg 
  landing-application-3.jpg 
  landing-application-4.jpg 
  landing-application-5.jpg 
  landing-application-6.jpg 
  landing-application-7.jpg 
  landing-application-8.jpg 
  landing-application-9.jpg 
  landing-application-10.jpg 
  landing-application-11.jpg 
  landing-application-12.jpg 
  1.png 
  logo.png 
  logo-1.png 
  dark-logo.png 
  1.jpg 
  2.jpg 
  4.jpg 
  product-1.png 
  product-2.png 
  product-3.png 
  product-4.png 
  product-5.png 
  graph-1.png 
  graph-2.png 
  graph-3.png 
  graph-4.png 
  graph-5.png 
  coming-soon-bg.jpg 
  faq-1.jpg 
  faq-2.jpg 
  faq-3.jpg 
  faq-4.jpg 
  blog.jpg 
  blog-2.jpg 
  blog-3.jpg 
  blog-5.jpg 
  blog-6.jpg 
  blog-4.jpg 
  blog-5.jpg 
  blog-12.jpg 
  blog-14.jpg 
  blog-comment.jpg 
  blog-single.jpg 
  signup.jpg 
  bg-profile.jpg 
)