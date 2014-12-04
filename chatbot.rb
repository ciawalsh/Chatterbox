def get_response(input)
	key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
	/#{key}/ =~ input
	response = RESPONSES[key]
	response.nil? ? 'sorry?' : response % {c1: $1, c2: $2, c3: $3}
end

RESPONSES = {
	'goodbye' => 'bye',
	'quit' => 'Goodbye!',
	'ciao' => 'ciao',
	'sayonara' => 'sayonara',
	'how are you?' => 'I\'m very well thank you.',
	'what football team do you support?' => 'I follow you, so i follow Arsenal!',
	'do you like me?' => 'No............................ lol',
	'do you think you\'re funny?' => 'your mum does..... :)',
	'the weather is (.*)' => 'I hate it when it\'s %{c1}',
	'I love (.*)' => 'I love %{c1} too',
	'I would love to drive a (.*)' => 'A %{c1}, nice, wouldn\'t that be sweet to drive!',
	'I hate (.*) and (.*)' => 'I also hate %{c1}, but i like %{c2}, sorry!',
	'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}'
}

class String
def black;          "\033[30m#{self}\033[0m" end
def red;            "\033[31m#{self}\033[0m" end
def green;          "\033[32m#{self}\033[0m" end
def brown;          "\033[33m#{self}\033[0m" end
def blue;           "\033[34m#{self}\033[0m" end
def magenta;        "\033[35m#{self}\033[0m" end
def cyan;           "\033[36m#{self}\033[0m" end
def gray;           "\033[37m#{self}\033[0m" end
def bg_black;       "\033[40m#{self}\033[0m" end
def bg_red;         "\033[41m#{self}\033[0m" end
def bg_green;       "\033[42m#{self}\033[0m" end
def bg_brown;       "\033[43m#{self}\033[0m" end
def bg_blue;        "\033[44m#{self}\033[0m" end
def bg_magenta;     "\033[45m#{self}\033[0m" end
def bg_cyan;        "\033[46m#{self}\033[0m" end
def bg_gray;        "\033[47m#{self}\033[0m" end
def bold;           "\033[1m#{self}\033[22m" end
def reverse_color;  "\033[7m#{self}\033[27m" end
end

puts "Hello, what's your name?".red
print "> "
name = gets.chomp
puts "Hello #{name}".red
print "> "
while(input = gets.chomp) do
	puts get_response(input).red
	print "> "
	if input == 'quit' then exit(0) end
end
