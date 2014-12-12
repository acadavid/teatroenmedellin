require 'spec_helper'

describe Venue do

  it "should validate the presence of name and theater_id" do
    venue = Venue.new
    venue.should_not be_valid
  end

  it "should have a theater association" do
    venue = Venue.new
    venue.should respond_to(:theater)
  end

  it "should be able to have a theater" do
    venue = Venue.new
    theater = Theater.new
    venue.theater = theater
    venue.theater.should be_a_kind_of(Theater)
  end

end
