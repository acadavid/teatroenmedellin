require 'spec_helper'

describe Act do

  it "should validate the presence of name, theater_id and date" do
    act = Act.new
    [:name, :theater_id, :date].each do |attr|
      act.should have(1).error_on(attr)
    end
  end

end
