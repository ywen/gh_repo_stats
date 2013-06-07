Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
require "#{File.dirname(__FILE__)}/../lib/gh_repo_stats"

RSpec.configure do |config|
  config.mock_with :rspec

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
