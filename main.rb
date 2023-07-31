# main.rb
require_relative 'src/person'
require_relative 'src/decorator/decorator'
require_relative 'src/decorator/capitalize_decorator'
require_relative 'src/decorator/trimmer_decorator'

person = Person.new(22, name: 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
