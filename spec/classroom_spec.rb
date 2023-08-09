require 'spec_helper'

describe Classroom do
  describe '>> new classroom' do
    it '>> Create a new object' do
      # Arrange
      @classroom = Classroom.new('Label')

      # Act
      label = @classroom.label

      # Assert
      expect(label).to eq 'Label'
    end

    it '>> Add an student' do
      # Arrange
      classroom = Classroom.new('Label')
      student = Student.new('25', 'ruby-101', 'Mohi', parent_permission: true)

      # Act
      classroom.add_student(student)
      number_of_students = classroom.students.length

      # Assert
      expect(number_of_students).to eq 1
    end
  end
end
