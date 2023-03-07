@students = []

def add_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def input_students
    puts "Please enter the names of students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
        #@students << {name: name, cohort: :november}
        add_students(name, :november)
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end
end

def save_students
    puts "What file would you like to save the list into?"
    file_input = gets.chomp
    file = File.open(file_input, "w")
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        file.puts student_data.join(",")
    end
    puts "Students have been saved."
    file.close
end

def load_students(filename = "students.csv")
    @students = []
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        add_students(name, cohort)
    end
    puts "#{@students.length} students have been loaded in the file."
    file.close
end

def interactive_menu
    loop do
        print_menu
        menu_decision(STDIN.gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
    print_header
    print_student_list
    print_footer
end

def menu_decision(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        save_students
    when "4"
        load_students
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

def try_load_students
    filename = ARGV.first # first argument from the command line
    if filename.nil?
      filename = "students.csv" # use default filename if none is provided
    end
    if File.exist?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
  end  
  
  try_load_students
  interactive_menu