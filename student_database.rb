require "./student_database_classes.rb"

student_database = Students.new([])
loop do

  print "Enter command:
  l: display all students
  n: enter new student data
  s: get more details about a student
  d: delete student:\n"
  input = gets.chomp

  break if input == "exit"

  case input
  when "l"
    if student_database.students.length == 0
      puts "There are no students."
    else
      student_database.list_all_students
    end
  when "n"
    print "Name: "
    name = gets.chomp
    print "Email: "
    email = gets.chomp
    print "Courses: "
    courses = gets.chomp.split(",")
    courses_and_grades = Hash.new
    courses.each do |course|
      print "What grade did the student recieve in #{course}?"
      grade = gets.chomp
      courses_and_grades[course] = grade
    end
    student_database.add_student(name, email, courses_and_grades)
  when "s"
    print "What is the student's ID? "
    id = gets.chomp.to_i
    student_database.display_student(id)
  when "d"
    print "What is the student's ID? "
    id = gets.chomp.to_i
    student_database.delete_student(id)
  else
    puts "I don't know that command, please try again. "
  end

end
