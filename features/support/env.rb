require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'
require 'cucumber/rake/task'

Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }

Capybara.configure do |config|
  config.app_host = 'https://www.yelp.com/'
  config.run_server = false
  config.default_selector = :css
  config.default_max_wait_time = 20
  config.wait_on_first_by_default = true
  config.ignore_hidden_elements = false
  config.save_and_open_page_path = 'public/screenshots'
end

Capybara.register_driver :poltergeist do |app|
   options = {
      :js_errors => false,
      :timeout => 120,
      :debug => false,
      :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
      :inspector => true,
      #:window_size => [1024, 1920],
   }
   Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :poltergeist_debug do |app|
  Capybara::Poltergeist::Driver.new(app, inspector: true)
end

Capybara.default_driver = :selenium
#Capybara.javascript_driver = :poltergeist
#Capybara.javascript_driver = :poltergeist_debug
#Capybara.javascript_driver = :selenium_chrome
