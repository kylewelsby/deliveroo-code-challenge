# frozen_string_literal: true

require "test/unit"
require_relative "../cron_part.rb"

class CronPartTest < Test::Unit::TestCase
  def test_every
    cron_part = CronPart.new("*", {min: 0, max: 10})
    assert_equal([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], cron_part.to_a)
  end

  def test_range
    cron_part = CronPart.new("1-5")
    assert_equal([1, 2, 3, 4, 5], cron_part.to_a)
  end

  def test_list
    cron_part = CronPart.new("1,5,10")
    assert_equal([1, 5, 10], cron_part.to_a)
  end

  def test_step
    cron_part = CronPart.new("*/15", {min: 0, max: 59})
    assert_equal([0, 15, 30, 45], cron_part.to_a)
  end

  def test_step_range
    cron_part = CronPart.new("0-30/15", {min: 0, max: 59})
    assert_equal([0, 15, 30], cron_part.to_a)
  end
end
