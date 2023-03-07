
=begin
1. After we added the code to load the students from file, we ended up with adding the students
   to @students in two places. The lines in load_students() and input_students() are almost the same.
   This violates the DRY (Don't Repeat Yourself) principle. How can you extract them into a method to fix this problem?
   NEED TO DO

2. How could you make the program load students.csv by default if no file is given
   on startup? Which methods would you need to change?
   DONE - Change the try_load_students as it links to the terminal
    if filename.nil?
    filename = "students.csv" # use default filename if none is provided
    end

3. Continue refactoring the code. Which method is a bit too long? What method names
   are not clear enough? Anything else you'd change to make your code look more elegant? Why?
   - DONE
   - save_students: join & puts done on one line in main directory.rb
   - edited the selection method from "process" to "menu_decision" as think that shows more what the method does

4. Right now, when the user choses an option from our menu, there's no way of them
   knowing if the action was successful. Can you fix this and implement feedback messages
   for the user?
   DONE on main directory by adding puts after method introduced

5. The filename we use to save and load data (menu items 3 and 4) is hardcoded.
   Make the script more flexible by asking for the filename if the user chooses these
   menu items.

=end
