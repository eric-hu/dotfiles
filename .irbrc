require_relative '.shared_ruby_console_init'
require 'irb/completion'

# Hirb makes tables easy.
extend_console 'hirb' do
  Hirb.enable
  extend Hirb::Console
end

# Build a colorful IRB prompt
IRB.conf[:PROMPT][:SIMPLE_COLOR] = {
  :PROMPT_I => "#{ANSI[:BLUE]}>>#{ANSI[:RESET]} ",
  :PROMPT_N => "#{ANSI[:BLUE]}>>#{ANSI[:RESET]} ",
  :PROMPT_C => "#{ANSI[:RED]}?>#{ANSI[:RESET]} ",
  :PROMPT_S => "#{ANSI[:YELLOW]}?>#{ANSI[:RESET]} ",
  :RETURN => "#{ANSI[:GREEN]}=>#{ANSI[:RESET]} %s\n",
  :AUTO_INDENT => true }

