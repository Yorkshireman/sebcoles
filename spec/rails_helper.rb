# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'database_cleaner'

require 'devise'

# Add additional requires below this line. Rails is not loaded until this point!

# CAPYBARA FEATURE SPECS METHODS
  def fill_in_sign_up_form
    fill_in('user_first_name', :with => 'Test')
    fill_in('user_last_name', :with => 'User')
    fill_in('user_email', :with => 'testuser@email.com')
    fill_in('user_password', :with => 'testuser')
    fill_in('user_password_confirmation', :with => 'testuser')
  end

  def create_and_login_user_as_a(user_type)
    @user = FactoryGirl.create(user_type)
    visit(new_user_session_path)
    fill_in('user_email', :with => @user.email)
    fill_in('user_password', :with => @user.password)
    click_button('Log in')
  end

  def admin_link_not_visible_for(user_types)
    user_types.each do |type|
      create_and_login_user_as_a(type)
      expect(page).to_not have_link("Admin")
      click_link("Logout")
    end
  end

  def redirected_to_redirect_path_when_trying_to_access_admin_path_as(user_types, redirect_path, access_method)
    user_types.each do |type|
      create_and_login_user_as_a(type)
      if access_method == :visit 
        visit(admin_path)
        elsif access_method == :click_on
          click_on("Admin")
      end
      expect(current_path).to eq(redirect_path)
      click_link("Logout")
    end
  end

  def can_visit_admin_page_as(types)
    types.each do |type|
      create_and_login_user_as_a(type)
      click_on("Admin")
      expect(current_path).to eq(admin_path)
      click_on("Logout")
    end
  end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.include Devise::TestHelpers, :type => :controller

  Capybara.register_driver :rack_test do |app|
    Capybara::RackTest::Driver.new(app, :respect_data_method => true, :redirect_limit => 20)
  end
  
end
