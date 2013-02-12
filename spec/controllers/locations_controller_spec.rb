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

end
