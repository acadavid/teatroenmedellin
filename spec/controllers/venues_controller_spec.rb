require 'spec_helper'
describe VenuesController, type: :controller do

  before(:each) do
    @theater = FactoryGirl.create(:theater)
    login_user FactoryGirl.create(:user)
  end

  def valid_attributes
    {name: "Le fantasie thingy", theater_id: @theater.to_param}
  end

  describe "GET new" do
    it "assigns a new venue as @venue" do
      get :new, {theater_id: @theater.to_param}
      assigns(:venue).should be_a_new(Venue)
    end
  end

  describe "GET edit" do
    it "assigns the requested venue as @venue" do
      venue = FactoryGirl.create(:venue)
      get :edit, {theater_id: @theater.to_param, id: venue.to_param}
      assigns(:venue).should eq(venue)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Venue" do
        expect {
          post :create, {theater_id: @theater.to_param, venue: valid_attributes}
        }.to change(Venue, :count).by(1)
      end

      it "assigns a newly created venue as @venue" do
        post :create, {theater_id: @theater.to_param, venue: valid_attributes}
        assigns(:venue).should be_a(Venue)
        assigns(:venue).should be_persisted
      end

      it "redirects to theater" do
        post :create, {theater_id: @theater.to_param, venue: valid_attributes}
        response.should redirect_to(@theater)
      end
    end

    describe "with invalid params" do
      it "does not save the new venue" do
        invalid_venue = FactoryGirl.attributes_for(:invalid_venue, theater: @theater)
        expect {
          post :create, {theater_id: @theater.to_param, venue: invalid_venue}
        }.to_not change(Venue,:count)
      end

      it "re-renders the 'new' template" do
        invalid_venue = FactoryGirl.attributes_for(:invalid_venue, theater: @theater)
        Venue.any_instance.stub(:save).and_return(false)
        post :create, {theater_id: @theater.to_param, venue: invalid_venue}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested venue" do
        venue = FactoryGirl.create(:venue)
        Venue.any_instance.should_receive(:update_attributes).with({"name" => "Pequeño teatro"})
        put :update, {theater_id: @theater.to_param, id: venue.to_param, venue: {'name' => "Pequeño teatro"}}
      end

      it "assigns the requested venue as @venue" do
        venue = FactoryGirl.create(:venue)
        put :update, {theater_id: @theater.to_param, id: venue.to_param, venue: valid_attributes}
        assigns(:venue).should eq(venue)
      end

      it "redirects to the theater" do
        venue = FactoryGirl.create(:venue)
        put :update, {theater_id: @theater.to_param, id: venue.to_param, venue: valid_attributes}
        response.should redirect_to(@theater)
      end
    end

    describe "with invalid params" do
      it "assigns the venue as @venue" do
        venue = FactoryGirl.create(:venue)
        invalid_venue = FactoryGirl.attributes_for(:invalid_venue, theater: @theater)
        Venue.any_instance.stub(:save).and_return(false)
        put :update, {theater_id: @theater.to_param, id: venue.to_param, venue: invalid_venue}
        assigns(:venue).should eq(venue)
      end

      it "re-renders the 'edit' template" do
        venue = FactoryGirl.create(:venue)
        invalid_venue = FactoryGirl.attributes_for(:invalid_venue, theater: @theater)
        Venue.any_instance.stub(:save).and_return(false)
        put :update, {theater_id: @theater.to_param, id: venue.to_param, venue: invalid_venue}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested venue" do
      venue = FactoryGirl.create(:venue)
      expect {
        delete :destroy, {theater_id: @theater.to_param, id: venue.to_param}
      }.to change(Venue, :count).by(-1)
    end

    it "redirects to the theater" do
      venue = FactoryGirl.create(:venue)
      delete :destroy, {theater_id: @theater.to_param, id: venue.to_param}
      response.should redirect_to(@theater)
    end
  end

end
