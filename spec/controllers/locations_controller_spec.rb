require 'spec_helper'


describe LocationsController do
  
  render_views

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

end
