require 'spec_helper'

describe Book do
  context '#Add new book' do
    # Arrange
    before :each do
      @book = Book.new 'Title', 'Author'
    end
    # Act

    # Assert
    it 'checks the name of the book' do
      expect(@book.title).to eq 'Title'
    end

    it 'checks the author of the book' do
      expect(@book.author).to eq 'Author'
    end

    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  context 'Add a rental' do
    it 'Add a rental to rentals Array' do
      # Arrange
      @book = Book.new('Title', 'Author')
      @person = Student.new('25', 'ruby-101', 'Mohi', parent_permission: true)
      @rental = Rental.new('2020/12/12', @book, @person)

      # Act
      @book.add_rental(@rental)

      # Assert
      expect(@book.rentals.length).to eq 1
    end
  end

  context 'convert book object to JSON' do
    it 'Check json string' do
      # Arrange
      @book = Book.new('Title', 'Author')

      # Act
      json_obj = @book.to_json.to_s

      # Assert
      expect(json_obj).to eq '{"json_class":"Book","title":"Title","author":"Author"}'
    end
  end

  context '>> Create an object from JSON' do
    it '>> Check json string' do
      # Arrange
      @book = JSON.parse('{"json_class":"Book","title":"Title","author":"Author"}', create_additions: true)

      # Act

      # Assert
      expect(@book).to be_an_instance_of Book
    end
  end
end
