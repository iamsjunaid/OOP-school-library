require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  # convert the "Book" object into a JSON representation
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end

  # convert the JSON representation of the "Book" object into a "Book" object
  def self.json_create(object)
    new(object['title'], object['author'])
  end
end
