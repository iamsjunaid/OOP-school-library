class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'Date' => @date,
      'Book' => @book,
      'Person' => @person
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['Date'], object['Book'], object['Person'])
  end
end
