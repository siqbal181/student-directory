def input_students
    puts "Please enter the names of students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------------------".center(20)
end

def print(students)
    students.each_with_index do |student, index|
        puts "#{index+1}. #{student[:name]} ".center(20)
    end
end

def print_footer(names)
    puts "Overall we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

=begin
1. We're using the each() method to iterate over an array of students.
   How can you modify the program to print a number before the name of each student,
   e.g. "1. Dr. Hannibal Lecter"? Hint: look into each_with_index()

2. Modify your program to only print the students whose name begins with a specific letter.
def print(students)
    students.each do |student|
       if student[:name].start_with?("S")
        puts student[:name]
       end
    end
end

3. Modify your program to only print the students whose name is shorter than 12 characters.
def print(students)
    students.each do |student|
       if student[:name].length < 12
        puts student[:name]
       end
    end
end

4. Rewrite the each() method that prints all students using while or until control flow methods (Loops).
def print(students)
    i = 0
    while i < students.length
        puts students[i][:name] if students[i][:name].length < 12
        i += 1
    end
end

5. Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.
def input_students
    puts "Please enter the names and country of birth of students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        puts "Please enter the country of birth:"
        country = gets.chomp
        students << {name: name, cohort: :november, country: country}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    students
end

def print(students)
    students.each_with_index do |student, index|
        puts "#{index+1}. #{student[:name]}, #{student[:country]} "
    end
end

6. Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.
   string.center(width)

7. In the input_students method the cohort value is hard-coded. How can you ask for both
   the name and the cohort? What if one of the values is empty? Can you supply a default value?
   The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?

   to_sym is converting strings to symbol: This is useful as symbols are immutable.

   Typo correction:
   def input_students
    puts "Please enter the names of students and cohort month"
    puts "To finish, just hit return twice"
    students = []
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    name = gets.chomp
    while !name.empty? do
        puts "Please enter the cohort month: "
        cohort = gets.chomp
        while !months.include?(cohort) do
            puts "Please enter a valid month:"
            cohort = gets.chomp
        end
        cohort = "Unknown" if cohort.empty?
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    students
end

8. Once you complete the previous exercise, change the way the users are displayed:
   print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts
   (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.

def print(students)
    sorted_by_month = {}
# print students grouped by cohorts
students.each do |student|
    month = student[:month]
    name = student[:name]
    if sorted_by_month[month] == nil
        sorted_by_month[month] = [name]
    else
        sorted_by_month[month].push(name)
    end
end
  sorted_by_month.each do |month|
    puts month
  end
end

9. Right now if we have only one student, the user will see a message "Now we have 1 students"
   whereas it should be "Now we have 1 student". How can you fix it so that it uses the singular
   form when appropriate and plural form otherwise?

def input_students
    puts "Please enter the names of students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :november}
        students.length == 1 ? (puts "Now we have 1 student") : (puts "Now we have #{students.count} students")
        # get another name from the user
        name = gets.chomp
    end
    students
end

10. We've been using the chomp() method to get rid of the last return character.
Find another method among those provided by the String class that could be used for the
same purpose (although it will require passing some arguments).

gets.strip is an alternative method - removes leading and trailing white space from input string

11. Once you have completed the "Asking for user input" section, open this file.
It's Ruby code but it has some typos. Copy it to a local file and open it in VS Code
without syntax highlighting. To do this, change the language of the file from 'Ruby' to 'Plain Text'
by clicking the blue word 'Ruby' in the bottom right corner and searching for 'plain text'.

12. What happens if the user doesn't enter any students? It will try to print an empty list.
    How can you use an if statement (Control Flow) to only print the list if there is at least one student in there?

def print(students)
  if students.length == 0
    puts "No students in directory"
  else
  print_students = students.each {|student| puts "#{student[:name]}"}
  end
end
=end

