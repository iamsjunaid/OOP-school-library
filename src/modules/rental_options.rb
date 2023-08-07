require_relative '../associations/rental'

class RentalOptions
  attr_accessor :rentals_list

  def initialize(book_options, people_options)
    @rentals_list = []
    @book_options = book_options
    @people_options = people_options
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @book_options.books_list.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_num = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    @people_options.people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals_list.push(Rental.new(date, @book_options.books_list[book_num], @people_options.people_list[person_num]))
    puts 'Rental created successfully'
  end

  def list_all_rentals
    puts 'Select a person from the following list by id '
    @people_options.people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals_list.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end