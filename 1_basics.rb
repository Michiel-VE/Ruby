def get_int_input(question)
    loop do
        print question
        input = gets.chomp
        begin
            return Integer(input)
        rescue ArgumentError
            puts "This is not a number please enter a number."
        end
    end
end

print "What's your name? "
name = gets.chomp

puts "Hi #{name}! 👋"

age = get_int_input("How old are you? ")

years = get_int_input("How many years into the future do you want to go? ")



total = age.to_i + years.to_i

puts "In #{years} years, you'll be #{total} years old, #{name}!"