
=begin
1. After we added the code to load the students from file, we ended up with adding the students
   to @students in two places. The lines in load_students() and input_students() are almost the same.
   This violates the DRY (Don't Repeat Yourself) principle. How can you extract them into a method to fix this problem?
   DONE - Added an "add_students" method

2. How could you make the program load students.csv by default if no file is given
   on startup? Which methods would you need to change?
   DONE - Change the try_load_students as it links to the terminal
   if filename.nil?
   filename = "students.csv" # use default filename if none is provided
   end

3. Continue refactoring the code. Which method is a bit too long? What method names
   are not clear enough? Anything else you'd change to make your code look more elegant? Why?
   DONE
   save_students: join & puts done on one line in main directory.rb
   edited the selection method from "process" to "menu_decision" as think that shows more what the method does

4. Right now, when the user choses an option from our menu, there's no way of them
   knowing if the action was successful. Can you fix this and implement feedback messages
   for the user?
   DONE on main directory by adding puts after method introduced

5. The filename we use to save and load data (menu items 3 and 4) is hardcoded.
   Make the script more flexible by asking for the filename if the user chooses these
   menu items.
   DONE on main directory

6. We are opening and closing the files manually. Read the documentation of the File class
   to find out how to use a code block (do...end) to access a file, so that we didn't have to
   close it explicitly (it will be closed automatically when the block finishes).
   Refactor the code to use a code block.

7. We are de-facto using CSV format to store data. However, Ruby includes a library to work
   with the CSV files that we could use instead of working directly with the files.
   Refactor the code to use this library.
   DONE - On the load students main directory


=end

require 'csv'

CSV.foreach("students.csv", col_sep: ',') do |row|
    puts row
end