require 'simplecov'
require 'coveralls'
require 'webmock/rspec'

formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter::new(formatters)

SimpleCov.start do
  add_filter { |src| (src.filename !~ /lib/) }
  add_filter "spec.rb"
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "guillotine"
require "pry"

path = [File.dirname(__FILE__), "support", "**", "*.rb"]
Dir[File.join(path)].each { |f| require f }

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.include TestHelpers
end
