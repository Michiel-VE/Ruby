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


amount = get_int_input("How many grocery items? ")
grocerylist = []

if amount == 0
    puts "You sure you're not hungry?"

else
    if amount >= 10
        puts "That's a haul!"
    else
        puts "That's a solid list!"
    end

    amount.times do |i|
        print "Enter item #{i+1}: "
        item = gets.chomp
        grocerylist << item
    end

    puts "🛒 Your grocery list:"
    grocerylist.each do |i|
        puts "- #{i}"
    end
end