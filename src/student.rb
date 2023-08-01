require_relative 'Person'

class Student < Person
  attr_reader :name, :classroom

  def initialize(age, classroom, parent_permission: false, name: '')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
