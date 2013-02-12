require 'spec_helper'


describe LocationsController do
  
  render_views

  before(:each) do
    @attr = {:name => "Test Location", :address1 => "Test street", :address2 => "",
      :city => "Forsyth", :state => "GA", :zip => "31029"}
  end

  describe "list locations" do
    it "should be successful" do
      get :index
      response.should be_successful
    end

    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => " | Location List")
    end

    it "should have the title in big letters on the page" do
      get :index
      response.should have_selector("h1", :content => "Location List")
    end

  end
  describe "'new' location" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    it "should have the correct title" do
      get :new
      response.should have_selector("title", :content => " | Add Location")
    end
    it "should have title in big letters on the page" do
      get :new
      response.should have_selector("h1", :content => "Add Location")
    end
    it "should have a name field" do
      get :new
      response.should have_selector("input[name='location[name]'][type='text']")
    end
    it "should have an address1 field" do
      get :new
      response.should have_selector("input[name='location[address1]'][type='text']")
    end
    it "should have an address2 field" do
      get :new
      response.should have_selector("input[name='location[address2]'][type='text']")
    end
    it "should have a city field" do
      get :new
      response.should have_selector("input[name='location[city]'][type='text']")
    end
    it "should have a state field" do
      get :new
      response.should have_selector("input[name='location[state]'][type='text']")
    end
    it "should have a zip field" do
      get :new
      response.should have_selector("input[name='location[zip]'][type='text']")
    end
  end

  describe "post 'create' location" do
    it "should add a new location" do
      lambda do
        post :create, :location => @attr
      end.should change(Location, :count).by(1)
    end
    it "should redirect to location list" do
      post :create, :location => @attr
      response.should redirect_to locations_path
    end
  end

  describe "GET 'show'" do
    it "should be successful"
  end
      

end
