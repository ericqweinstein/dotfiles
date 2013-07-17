# Vim FTW
Pry.config.editor = 'vim'

# Custom prompt magicks
fancy_prompt_char = [0x3299].pack("U*")

Pry.prompt = [
  proc { "\e[0;31m#{fancy_prompt_char} >> \e[0;34m" },
  proc { "    \e[0;31m| \e[0;34m" }
]

# Default hash and array for testing
HASH = {
  :bob => 'Marley', :mom => 'Barley',
  :god => 'Harley', :chris => 'Farley' } unless defined?(HASH)

ARRAY = HASH.keys unless defined?(ARRAY)

# Benchmark method
def go!(&block)
  require 'benchmark'

  result = nil
  timing = Benchmark.realtime do
    result = block.()
  end

  puts "Elapsed time: #{timing * 1000} milliseconds."
  result
end

# Clear the screen
def c
  system 'clear'
end

# Check for balanced parens & brackets
def validate_string(string)
  stack  = []
  lookup = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
  left   = lookup.keys
  right  = lookup.values

  string.each_char do |char|
    if left.include? char
      stack << char
    elsif right.include? char
      return false if stack.empty? || (lookup[stack.pop] != char)
    end
  end

  return stack.empty?
end

# Get methods except for those inherited from Object
class Object
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end

