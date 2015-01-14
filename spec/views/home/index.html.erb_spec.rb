require 'spec_helper'

RSpec.describe "home/index.html.erb", :type => :view do

  it "displays scheduling details correctly" do
    act = FactoryGirl.create(:act, name: "Christmas Concert")
    assign(:act_dates, Kaminari.paginate_array([
        FactoryGirl.create(:act_date, act: act)
      ]).page(1))

    render

    expect(rendered).to have_content 'Programación'
    expect(rendered).to have_content 'Christmas Concert'
    expect(view).to render_template(:partial => "_show", :count => 1)
  end

end
