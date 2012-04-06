require 'spec_helper'

describe "acts/new" do
  before(:each) do
    assign(:act, stub_model(Act,
      :name => "MyString",
      :description => "MyText",
      :clasification => "MyString",
      :price => "9.99"
    ).as_new_record)
  end

  it "renders new act form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => acts_path, :method => "post" do
      assert_select "input#act_name", :name => "act[name]"
      assert_select "textarea#act_description", :name => "act[description]"
      assert_select "input#act_clasification", :name => "act[clasification]"
      assert_select "input#act_price", :name => "act[price]"
    end
  end
end
