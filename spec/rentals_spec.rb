require 'spec_helper'

describe Rental do
  describe '>> new Rental' do
    it '>> Create a new object' do
      # Arrange
      @book = Book.new('Title', 'Author')
      @person = Student.new('25', 'ruby-101', 'Mohi', parent_permission: true)
      @rental = Rental.new('2020/12/12', @book, @person)

      # Act

      # Assert
      expect(@rental).to be_an_instance_of Rental
    end
  end

  context '>> convert Rental object to JSON' do
    it '>> Check json string' do
      # Arrange
      @book = Book.new('Title', 'Author')
      @person = Student.new('25', 'ruby-101', 'Mohi', parent_permission: true)
      @rental = Rental.new('2020/12/12', @book, @person)

      # Act
      json_obj = @rental.to_json.to_s
      json_str = <<~JSON
        {
          "json_class": "Rental",
          "date": "2020/12/12",
          "book": {
            "json_class": "Book",
            "title": "Title",
            "author": "Author"
          },
          "person": {
            "json_class": "Student",
            "age": "25",
            "classroom": "ruby-101",
            "name": "Mohi",
            "parent_permission": true
          }
        }
      JSON

      # Assert
      expect(json_obj).to eq json_str
    end
  end

  context '>> Create an object from JSON' do
    it '>> Check json string' do
      # Arrange
      @rental = JSON.parse(
        '{
          "json_class": "Rental",
          "date": "2020/12/12",
          "book": {
            "json_class": "Book",
            "title": "Title",
            "author": "Author"
          },
          "person": {
            "json_class": "Student",
            "age": "25",
            "classroom": "ruby-101",
            "name": "Mohi",
            "parent_permission": true
          }
        }',
        create_additions: true
      )

      # Assert
      expect(@rental).to be_an_instance_of Rental
    end
  end
end
