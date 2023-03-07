@students = []

def input_students
    puts "Please enter the names of students"
    puts "To finish, just hit return twice"
    name = gets.chomp
    while !name.empty? do
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        # get another name from the user
        name = gets.chomp
    end
end

def save_students
    # open file for writing
    file = File.open("students.csv", "w")
    # iterate over the array of students
    @students.each do |student|
        # Below is done to convert the hash into a new array so eventually we can convert into strings. so its [ [hash element:name], [hash element: cohort] ]
        student_data = [student[:name], student[:cohort]]
        # we then based on the array use join(", ")
        csv_line = student_data.join(", ")
        # we need to puts to the file, so it writes to the file and not to the screen
        file.puts csv_line
    end
    # every time we open a file we need to close it
    file.close
end

def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "9. Exit"
end

def show_students
    print_header
    print_student_list
    print_footer
end

def process(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        save_students
    when "9"
        exit
    else
        puts "I don't know what you meant, try again"
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_student_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall we have #{@students.count} great students"
end

interactive_menu


