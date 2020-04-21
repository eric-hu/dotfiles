# 11/14/2011:
# Add all gems in the global gemset to the $LOAD_PATH so they can be used even
# in places like 'rails console'.
#
# Define a global ruby and switch to the global gemset,
# then
# gem install awesome_print wirble wirb hirb
if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

require 'rubygems'

# enable or disable echoing of SQL queries in IRB
# note that 'rails s' logger shows extra SQL queries when this is enabled
sql_echo_opt = false

## Settings below selectively taken from (2011/3/23)
## https://github.com/iain/osx_settings/blob/master/.irbrc

# Colors
ANSI = {}
ANSI[:RESET] = "\e[0m"
ANSI[:BOLD] = "\e[1m"
ANSI[:UNDERLINE] = "\e[4m"
ANSI[:LGRAY] = "\e[0;37m"
ANSI[:GRAY] = "\e[0;90m"
ANSI[:RED] = "\e[31m"
ANSI[:GREEN] = "\e[32m"
ANSI[:YELLOW] = "\e[33m"
ANSI[:BLUE] = "\e[34m"
ANSI[:MAGENTA] = "\e[35m"
ANSI[:CYAN] = "\e[36m"
ANSI[:WHITE] = "\e[37m"

# Loading extensions of the console. This is wrapped
# because some might not be included in your Gemfile
# and errors will be raised
def extend_console(name, care = true, required = true)
  if care
    require name if required
    yield if block_given?
    $console_extensions << "#{ANSI[:GREEN]}#{name}#{ANSI[:RESET]}"
  else
    $console_extensions << "#{ANSI[:GRAY]}#{name}#{ANSI[:RESET]}"
  end
rescue LoadError
  $console_extensions << "#{ANSI[:RED]}#{name}#{ANSI[:RESET]}"
end
$console_extensions = []

# Wirble is a gem that handles coloring the IRB
# output and history
extend_console 'wirble' do
  require 'irb'
  wirble_opts = {
    :skip_prompt => false
  }

  Wirble.init(wirble_opts)
  Wirble.colorize
end


# disabled 11/14/2011: this interferes with IRB in 'rails c' and 'rails s'
# environments (when paired with bundler include method at top of this file)
extend_console 'wirb' do
  Wirb.start
end

# awesome_print is prints prettier than pretty_print
extend_console 'ap' do
  alias pp ap
end

# When you're using Rails 3 console, show queries in the console
if sql_echo_opt
  extend_console 'rails3', defined?(ActiveSupport::Notifications), false do
    $odd_or_even_queries = false
    ActiveSupport::Notifications.subscribe('sql.active_record') do |*args|
      $odd_or_even_queries = !$odd_or_even_queries
      color = $odd_or_even_queries ? ANSI[:CYAN] : ANSI[:MAGENTA]
      event = ActiveSupport::Notifications::Event.new(*args)
      time = "%.1fms" % event.duration
      name = event.payload[:name]
      sql = event.payload[:sql].gsub("\n", " ").squeeze(" ")
      puts " #{ANSI[:UNDERLINE]}#{color}#{name} (#{time})#{ANSI[:RESET]} #{sql}"
    end
  end
end

# Show results of all extension-loading
puts "#{ANSI[:GRAY]}~> Console extensions:#{ANSI[:RESET]} #{$console_extensions.join(' ')}#{ANSI[:RESET]}"
