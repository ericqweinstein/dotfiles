# Vim FTW
Pry.config.editor = 'vim'

# Custom prompt magicks
fancy_prompt_char = [0x3299].pack("U*")

Pry.prompt = [
  proc { "\e[0;31m#{fancy_prompt_char} >> \e[0;34m" },
  proc { "    \e[0;31m| \e[0;34m" }
]

# Set Pry color scheme
Pry.config.theme = 'railscasts'

# Default hash and array for testing
HASH = {
  :bob => 'Marley', :mom => 'Barley',
  :god => 'Harley', :chris => 'Farley' } unless defined?(HASH)

ARRAY = HASH.keys unless defined?(ARRAY)

# Aliases for pry-debugger commands
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'

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

# Copy/paste to clipboard
def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
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

# For when we need to explicitly call bash (instead of default sh)
def bash(command)
  require 'shellwords'
  escaped_command = Shellwords.escape(command)
  system "bash -c #{escaped_command}"
end

