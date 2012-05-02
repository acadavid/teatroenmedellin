require 'spec_helper'

describe TheatersController do
  
  def valid_attributes
    {name: "Le Theater", description: "A very cool theater"}
  end
  
  describe "GET index" do
    it "should be successful" do
      get :index, {}
      response.should be_success
    end
    
    it "should assign the all theaters to @theaters" do
      theater1 = Factory(:theater)
      theater2 = Factory(:theater, name: "Supa Theater!")
      get :index, {}
      assigns(:theaters) =~ [theater1, theater2]
    end
  end
  
  describe "GET show" do
    it "should be successful" do
      theater = Factory(:theater)
      get :show, id: 1
      response.should be_success
    end
    
    it "should assign the right theater to @theater" do
      theater = Factory(:theater)
      get :show, id: 1
      assigns(:theater).should eq(theater)
    end 
  end

  describe "GET new" do
    it "assings a new theater to @theater" do
      get :new
      assigns(:theater).should be_a_new(Theater)
    end
  end

  describe "GET edit" do
    it "assings the requested theater as @theater" do
      theater = Factory(:theater)
      get :edit, id: 1
      assigns(:theater).should eq(theater)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Theater" do
        expect {
          post :create, {theater: valid_attributes}
        }.to change(Theater, :count).by(1)
      end
      
      it "redirects to created Theater" do
        post :create, {theater: valid_attributes}
        response.should redirect_to(Theater.last)
      end
    end
    
    describe "with invalid params" do
      it "assings a newly created but unsaved theater as @theater" do
        Theater.any_instance.stub(:save).and_return(false)
        post :create, {theater: {}}
        assigns(:theater).should be_a_new(Theater)
      end

      it "re-renders 'new' action" do
        Theater.any_instance.stub(:save).and_return(false)
        post :create, {theater: {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "modifies the requested theater" do
        theater = Factory(:theater)
        Theater.any_instance.should_receive(:update_attributes).with({"name" => "Whachadoing yo Theater"})
        put :update, {id: theater.to_param, theater: {name: "Whachadoing yo Theater"}}
      end

      it "assings the requested Theater as @theater" do
        theater = Factory(:theater)
        put :update, {id: theater.to_param, theater: {name: "Whachadoing yo Theater"}}
        assigns(:theater).should eq(theater)
      end

      it "redirects to updated Theater" do
        theater = Factory(:theater)
        put :update, {id: theater.to_param, theater: {name: "Whachadoing yo Theater"}}
        response.should redirect_to(theater)
      end
    end
    
    describe "with invalid params" do
      it "assigns the requested Theater as @theater" do
        theater = Factory(:theater)
        Theater.any_instance.stub(:save).and_return(false)
        put :update, {id: theater.to_param, theater: {}}
        assigns(:theater).should eq(theater)
      end

      it "re-renders 'edit' action" do
        theater = Factory(:theater)
        Theater.any_instance.stub(:save).and_return(false)
        put :update, {id: theater.to_param, theater: {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested theater" do
      theater = Factory(:theater)
      expect {
        delete :destroy, {id: theater.to_param}
      }.to change(Theater, :count).by(-1)
    end

    it "redirects to the theater list" do
      theater = Factory(:theater)
      delete :destroy, {id: theater.to_param}
      response.should redirect_to(theaters_url)
    end
  end

end
