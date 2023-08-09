require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(13, 'Solid State', 'Asghari', parent_permission: false)
  end

  context 'When testing a Teacher class' do
    it 'takes four parameters and returns a Teacher object' do
    expect(@teacher).to be_an_instance_of Teacher
    end

    it 'should return the correct field' do
    expect(@teacher.specialization).to eql 'Solid State'
    end
  end

  context 'When using can_use_services? method' do
    it 'should always retuen true' do
    expect(@teacher.can_use_services?).to be true
    end
  end

  context 'Convert Teacher object to JSON' do
    it 'should check json string' do
      json_obj = @teacher.to_json.to_s
      json_str = '{"json_class":"Teacher","age":13,"specialization":"Solid State","name":"Asghari","parent_permission":false}'
      expect(json_obj).to eq json_str
    end
  end

  context '>Create an object from JSON' do
    it 'should check json string' do
      @teacher = JSON.parse(
        '{"json_class":"Teacher","age":13,"specialization":"Solid State","name":"Asghari","parent_permission":false}', create_additions: true)
      expect(@teacher).to be_an_instance_of Teacher
    end
  end
end