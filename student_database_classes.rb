module HelperMethods
  def id_generator
    rand(100000..999999)
  end
end

class Students
  include HelperMethods
  attr_accessor :students

  def initialize(students)
    @students = []
  end

  def list_all_students
    @students.each do |student|
      puts "ID: #{student.id}, Name: #{student.name}, Email: #{student.email}, Courses: #{student.courses}"
    end
  end

  def add_student(name, email, courses)
    @students << Student.new(name, email, courses, @id = id_generator)
  end

  def display_student(id)
    @students.each do |student|
      if student.id == id
        puts "ID: #{student.id}, Name: #{student.name}, Email: #{student.email}, Courses: #{student.courses}"
      else
        puts "That's not a student in our database."
      end
    end
  end

  def delete_student(id)
    @students.each do |student|
      if student.id == id
        student_index = @students.index(student)
        @students.delete_at(student_index)
      else
        puts "That's not a student in our database."
      end
    end
  end
end

class Student < Students
  attr_accessor :name, :email, :courses, :id
  def initialize(name, email, courses, id)
    @name, @email, @courses, @id = name, email, courses, id
  end
end
