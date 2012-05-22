require 'spec_helper'

describe Act do

  it "should validate the presence of name, theater_id and date" do
    act = Act.new
    [:name, :theater_id].each do |attr|
      act.should have(1).error_on(attr)
    end
  end

  ["venue", "theater"].each do |attr|
    it "should have a #{attr} association" do
      act = Act.new
      act.should respond_to(attr)
    end
    
    it "should be able to have a #{attr}" do
      act = Act.new
      my_attr = attr.camelcase.constantize.new
      act.send("#{attr}=", my_attr)
      act.send(attr).should be_a_kind_of(attr.camelcase.constantize)
    end
  end

  ["act_date"].each do |attr|
    it "should have a #{attr} association" do
      act = Act.new
      act.should respond_to(attr)
    end
    
    it "should be able to have an array of #{attr}" do
      act = Act.new
      my_attr = attr.camelcase.constantize.new
      act.send(attr).push(my_attr)
      act.send(attr).should be_a_kind_of(Array)
    end
  end
end
