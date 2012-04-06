require 'spec_helper'

describe Theater do

  it "should validate the presence of name" do
    theater = Theater.new
    [:name].each do |attr|
      theater.should have(1).error_on(attr)
    end
  end

end
