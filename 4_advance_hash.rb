def get_input(question, type: :string)
    loop do
        print question
        input = gets.chomp
        begin
            case type
            when :int
                return Integer(input)

            when :float
                return Float(input)

            else
                return input
            end
        rescue ArgumentError
            puts "This is not a number please enter a number."
        end
    end
end


grocerylist = {}
total = 0

amount = get_input("how many items: ", type: :int)

if amount == 0
    puts "Buying nothing?"
else
    if amount < 5
        puts "Traveling light"
    else
        puts "Hope you brought bags!"
    end

    amount.times do
        print "Enter item name:  "
        item = gets.chomp.strip.capitalize
        
        count_Item = get_input("How many #{item}?  ", type: :int)
        price = get_input("Price per #{item}?  ", type: :float)

        grocerylist[item] = [count_Item, price]
    end
end

grocerylist.sort.each  do |item,itemValue|
    total += itemValue[1]*itemValue[0]
    puts "- #{item}: #{itemValue[0]} @ #{itemValue[1]} = €#{itemValue[1]*itemValue[0]}"
end

puts "Total: €#{total}"