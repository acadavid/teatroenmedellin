require 'spec_helper'

RSpec.describe "user_sessions/new.html.erb", :type => :view do
  
  it "displays login form correctly" do
    assign(:user, User.new)
    render
    expect(rendered).to match /Ingresa los datos de logueo/
    response.body.should have_css("input#user_email")
    response.body.should have_css("input#user_password")
  end

end
