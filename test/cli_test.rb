# frozen_string_literal: true

require "test/unit"
require 'open3'

class CLITest < Test::Unit::TestCase
  def test_cli_output
    stdout_str = `ruby ./parser.rb \"*/15 0,24,54 1,15 * 1-5 /usr/bin/find\"`
    assert_equal(%(minute        0 15 30 45
hour          0
day of month  1 15
month         1 2 3 4 5 6 7 8 9 10 11 12
day of week   1 2 3 4 5
command       /usr/bin/find
), stdout_str)
  end
end