require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, :type => :helper do

  context 'when there is an error' do

    describe "#render_acts_dates" do
      it "should output 'no shows for this day' when given a day there are not act_dates" do
        actdates = []
        helper.render_act_dates(actdates).should include "No se encontraron eventos para la fecha seleccionada"
      end

      it "should render partial show for collection" do
        actdate = [FactoryGirl.create(:act_date),FactoryGirl.create(:act_date)]

        actdates = ActDate.all
        helper.render_act_dates(actdates).should include "Precio"
      end
    end
  end
end
