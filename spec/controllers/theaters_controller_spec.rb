require 'spec_helper'

describe TheatersController, type: :controller do
  
  def valid_attributes
    {name: "Le Theater", description: "A very cool theater"}
  end
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
  
  describe "GET index" do
    it "should be successful" do
      get :index, {}
      response.should be_success
    end
    
    it "should assign the all theaters to @theaters" do
      theater1 = FactoryGirl.create(:theater)
      theater2 = FactoryGirl.create(:theater, name: "Supa Theater!")
      get :index, {}
      assigns(:theaters) =~ [theater1, theater2]
    end
  end
  
  describe "GET show" do
    it "should be successful" do
      theater = FactoryGirl.create(:theater)
      get :show, id: 1
      response.should be_success
    end
    
    it "should assign the right theater to @theater" do
      theater = FactoryGirl.create(:theater)
      get :show, id: 1
      assigns(:theater).should eq(theater)
    end 
  end

  describe "GET new" do
    it "assings a new theater to @theater" do
      login_user @user
      get :new
      assigns(:theater).should be_a_new(Theater)
    end
  end

  describe "GET edit" do
    it "assings the requested theater as @theater" do
      login_user @user
      theater = FactoryGirl.create(:theater)
      get :edit, id: 1
      assigns(:theater).should eq(theater)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Theater" do
        login_user @user
        expect {
          post :create, {theater: valid_attributes}
        }.to change(Theater, :count).by(1)
      end
      
      it "redirects to created Theater" do
        login_user @user
        post :create, {theater: valid_attributes}
        response.should redirect_to(Theater.last)
      end
    end
    
    describe "with invalid params" do
      it "does not save the new theater" do
        login_user @user
        invalid_theater = FactoryGirl.attributes_for(:invalid_theater)
        expect{
          post :create, {theater: invalid_theater}
        }.to_not change(Act,:count)
      end

      it "re-renders 'new' action" do
        login_user @user
        invalid_theater = FactoryGirl.attributes_for(:invalid_theater)
        Theater.any_instance.stub(:save).and_return(false)
        post :create, {theater: invalid_theater }
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "modifies the requested theater" do
        login_user @user
        theater = FactoryGirl.create(:theater)
        Theater.any_instance.should_receive(:update_attributes).with({"name" => "Whachadoing yo Theater"})
        put :update, {id: theater.to_param, theater: {name: "Whachadoing yo Theater"}}
      end

      it "assings the requested Theater as @theater" do
        login_user @user
        theater = FactoryGirl.create(:theater)
        put :update, {id: theater.to_param, theater: {name: "Whachadoing yo Theater"}}
        assigns(:theater).should eq(theater)
      end

      it "redirects to updated Theater" do
        login_user @user
        theater = FactoryGirl.create(:theater)
        put :update, {id: theater.to_param, theater: {name: "Whachadoing yo Theater"}}
        response.should redirect_to(theater)
      end
    end
    
    describe "with invalid params" do
      it "assigns the requested Theater as @theater" do
        login_user @user
        theater = FactoryGirl.create(:theater)
        invalid_theater = FactoryGirl.attributes_for(:invalid_theater)
        Theater.any_instance.stub(:save).and_return(false)
        put :update, {id: theater.to_param, theater: invalid_theater}
        assigns(:theater).should eq(theater)
      end

      it "re-renders 'edit' action" do
        login_user @user
        theater = FactoryGirl.create(:theater)
        invalid_theater = FactoryGirl.attributes_for(:invalid_theater)
        Theater.any_instance.stub(:save).and_return(false)
        put :update, {id: theater.to_param, theater: invalid_theater}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested theater" do
      login_user @user
      theater = FactoryGirl.create(:theater)
      expect {
        delete :destroy, {id: theater.to_param}
      }.to change(Theater, :count).by(-1)
    end

    it "redirects to the theater list" do
      login_user @user
      theater = FactoryGirl.create(:theater)
      delete :destroy, {id: theater.to_param}
      response.should redirect_to(theaters_url)
    end
  end

end
