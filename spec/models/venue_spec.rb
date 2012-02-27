require 'spec_helper'

describe Venue do

  it "should validate the presence of name and theater_id" do
    venue = Venue.new
    [:name, :theater_id].each do |attr|
      venue.should have(1).error_on(attr)
    end
  end

end
