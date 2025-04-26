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

grocerylist = {}

amount = get_int_input("how many items: ")

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
        
        count_Item = get_int_input("How many #{item}?  ")

        grocerylist[item] = count_Item
    end
end

grocerylist.sort.each  do |item,amount|
       puts "- #{item}: #{amount}"
end