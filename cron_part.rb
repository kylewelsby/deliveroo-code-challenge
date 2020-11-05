class CronPart
  attr_reader :string, :options
  def initialize(string, options = {})
    @string = string
    @options = {min: 0, max: 59}.merge(options)
  end

  def to_a
    if string.include?("/") # step values
      step(string)
    elsif string.include?("-") # range of values
      range(string)
    elsif string.include?(",") # value list
      list(string)
    elsif string.include?("*")
      step_loop(1, options)
    else
      [string.to_i]
    end
  end

  private

  def range(string)
    from, to = string.split("-").map(&:to_i)
    Range.new(from, to).to_a.select do |n|
      n >= options[:min] && n <= options[:max]
    end
  end

  def list(string)
    string.split(",").map(&:to_i).select do |n|
      n >= options[:min] && n <= options[:max]
    end
  end

  def step(string)
    segment, multiplier = string.split("/")
    multiplier = multiplier.to_i
    if segment === "*"
      step_loop(multiplier, options)
    elsif segment.include?("-")
      from, to = string.split("-").map(&:to_i)
      step_loop(multiplier, {
        min: from,
        max: to
      })
    end
  end

  def step_loop(multiplier, options)
    val = options[:min]
    is_loop = true
    output = []
    while is_loop
      output << val
      val += multiplier
      if val > options[:max]
        is_loop = false
      end
    end
    output
  end
end
