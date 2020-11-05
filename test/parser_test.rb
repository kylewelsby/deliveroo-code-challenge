# frozen_string_literal: true

require "test/unit"
require_relative "../parser"

class ParserTest < Test::Unit::TestCase
  def test_input
    parser = Parser.new("*/15 0 1,15 * 1-5 /usr/bin/find")
    assert_equal("*/15", parser.minutes)
    assert_equal("0", parser.hours)
    assert_equal("1,15", parser.day_of_month)
    assert_equal("*", parser.month)
    assert_equal("1-5", parser.day_of_week)
    assert_equal("/usr/bin/find", parser.command)
  end

  def test_render
    parser = Parser.new("*/15 0 1,15 * 1-5 /usr/bin/find")
    assert_equal(%(minute        0 15 30 45
hour          0
day of month  1 15
month         1 2 3 4 5 6 7 8 9 10 11 12
day of week   1 2 3 4 5
command       /usr/bin/find), parser.render)
  end

  def test_render_exceed_limits
    parser = Parser.new("*/15 0,24 1,15,40 * 1-7 /usr/bin/find")
    assert_equal(%(minute        0 15 30 45
hour          0
day of month  1 15
month         1 2 3 4 5 6 7 8 9 10 11 12
day of week   1 2 3 4 5 6
command       /usr/bin/find), parser.render)
  end
end
