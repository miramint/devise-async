ENV["RAILS_ENV"] = "test"

require "minitest/autorun"
require "minitest/spec"
require "minitest/mock"
require "mocha"

require "devise/async"
require "rails/all"
require "devise"
require "resque"
require "sidekiq"
require "delayed_job_active_record"

require "support/rails_app"
require "support/helpers"
require "support/my_mailer"

load File.dirname(__FILE__) + "/support/rails_app/db/schema.rb"
