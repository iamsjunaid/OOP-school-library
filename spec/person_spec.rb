require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(13, 'Kanza', parent_permission: false)
    @unknown = Person.new(10)
  end

  context 'When testing a Person class' do
    it 'takes three parameters and returns a Person object' do
      expect(@person).to be_an_instance_of Person
    end

    it 'should return the correct age = 13' do
      expect(@person.age).to eql 13
    end

    it 'should return the correct name = Kanza' do
      expect(@person.name).to eql 'Kanza'
    end
  end

  context 'When using can_use_services? method' do
    it 'should return false if under age and no parent permission' do
      expect(@person.can_use_services?).to be false
    end

    it 'should return true have parent permission' do
      expect(@unknown.can_use_services?).to be true
    end
  end

  context 'When using correct_name method' do
    it 'should return the correct name' do
      expect(@unknown.correct_name).to eql 'Unknown'
    end
  end
end
