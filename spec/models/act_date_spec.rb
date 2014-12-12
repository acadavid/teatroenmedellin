require 'spec_helper'

describe ActDate do

  before { @act_date = ActDate.new }

  subject { @act_date }

  it "should validate the presence date" do
    FactoryGirl.build(:act_date, :date => "").should_not be_valid
  end

  it "should be able to have an act" do
    should respond_to(:act)
  end

  it "should return an act" do
    subject.act = Act.new
    subject.act.should be_a_kind_of(Act)
  end
end
