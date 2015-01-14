require 'spec_helper'

RSpec.describe UserSessionsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    it "returns http success" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "Valid Session" do
      post :create, user: FactoryGirl.attributes_for(:user)
      @controller.stub(:login).and_return(true)
      #response.should redirect_to(root_url)
      #expect(response).to redirect_to root_url
      response.status.should eq 200
      #response.should_be redirected
      #assert_redirected_to root_url
    end

    it "Invalid Session" do
      post :create, user: FactoryGirl.attributes_for(:invalid_user)
      @controller.stub(:login).and_return(false)
      response.should render_template("new")
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      response.should redirect_to(root_url)
    end
  end

end
