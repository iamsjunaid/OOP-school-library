require_relative '../src/modules/book_options'
require_relative '../src/modules/people_options'
require_relative '../src/modules/rental_options'

class App
  def initialize(options)
    @options = options
    @book_options = BookOptions.new
    @people_options = PeopleOptions.new
    @rentals_list = RentalOptions.new(@book_options, @people_options)
  end

  def select_option(user_choice)
    case user_choice
    when '1'
      @book_options.list_all_books
    when '2'
      @people_options.list_all_people
    when '3'
      @people_options.create_person
    when '4'
      @book_options.create_book
    when '5'
      @rentals_list.create_rental
    when '6'
      @rentals_list.list_all_rentals
    else
      puts 'Invalid option, please try again!'
    end
    @options.show_menu
  end
end
