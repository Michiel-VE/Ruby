def show_menu
    puts "\n📚 Student Grade Tracker"
    puts "1. Add new student"
    puts "2. View all students"
    puts "3. View student average"
    puts "4. Add grade to student"
    puts "5. Remove a grade"
    puts "6. Remove student"
    puts "7. Show top student"
    puts "8. Exit"
    print "Choose an option: "
  end

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

def list_all_students(studentlist)
    if studentlist.length() > 0
        studentlist.each_with_index do |student, i|
            puts "#{i + 1}. #{student.name}"
        end
    else
        puts "No students added yet"
    end
end

def get_student(studentlist)
    name = get_input("Select a student name: ")
    student = studentlist.find{ |student| student.name == name}

    return student
end

def get_avg(grades)
    return grades.sum.to_f / grades.size
end  

  studentlist = []
  Student = Struct.new(:name, :grades)

  loop do
    show_menu
    choice = get_input("Pick a number: ", type: :int)
    case choice
    when 1
        name = get_input("Student name: ")

        studentlist << Student.new(name, [])
    when 2
        list_all_students(studentlist)
    when 3
        list_all_students(studentlist)

        student = get_student(studentlist)
        
        if student.grades && !student.grades.empty?
            average = get_avg(student.grades)
            puts "#{student.name} with avg: #{'%.2f' % average}"
        else
            puts "#{student.name} has no grades yet!"
        end
    when 4
        student = get_student(studentlist)
        
        loop do
            grade = get_input("Add the students grade (-1 to end): ", type: :int)
            case grade
            when -1
                break                
            else
                student.grades << grade
                
            end
        end

        puts "#{student.name} has grades #{student.grades.join(", ")}"

    when 5
        student = get_student(studentlist)

        student.grades.each_with_index do |grade, i|
            puts "#{i+1} #{grade}"
        end
        index = get_input("Pick a grade to delete: ", type: :int)
        student.grades.delete_at(index-1)

    when 6
        list_all_students(studentlist)
        index = get_input("Pick a student to delete: ", type: :int)
        studentlist.delete_at(index-1)

    when 7
        top_student = studentlist
        .reject{|student| student.grades.empty? }
        .max_by{|student| get_avg(student.grades)}

        if top_student
            puts "#{top_student.name} has the highest average (#{'%.2f' % get_avg(top_student.grades)})"
        else
            puts "No student with grades yet"
        end
    when 8
      puts "Goodbye!"
      break
    end
  end
  