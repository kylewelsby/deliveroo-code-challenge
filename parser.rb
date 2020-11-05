require_relative "./cron_part"

class Parser
  attr_reader :minutes, :hours, :day_of_month, :month, :day_of_week, :command
  def initialize(input)
    raise StandardError, "Unsupoorted Cron string" if input.split(" ").size != 6

    @minutes, @hours, @day_of_month, @month, @day_of_week, @command = input.split(" ")
  end

  def render
    output = []
    output << "minute        " + CronPart.new(@minutes, {min: 0, max: 59}).to_a.join(" ")
    output << "hour          " + CronPart.new(@hours, {min: 0, max: 23}).to_a.join(" ")
    output << "day of month  " + CronPart.new(@day_of_month, {min: 1, max: 31}).to_a.join(" ")
    output << "month         " + CronPart.new(@month, {min: 1, max: 12}).to_a.join(" ")
    output << "day of week   " + CronPart.new(@day_of_week, {min: 0, max: 6}).to_a.join(" ")
    output << "command       " + @command
    output.join("\n")
  end
end

# Allow the program to run via command line
#
# Examples
#
#   ruby parser.rb "*/15 0 1,15 * 1-5 /usr/bin/find"
#
# Returns String rendered output of given cron command
puts Parser.new(ARGV[0]).render if __FILE__ == $PROGRAM_NAME
