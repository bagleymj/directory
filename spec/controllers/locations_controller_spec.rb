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
    describe "failure" do
      before(:each) do
        @attr = {
          :name => ""
        }
      end
      it "should render the 'new' page" do
        post :create, :location => @attr
        response.should render_template(:new)
      end
      it "should have the right title" do
        post :create, :location => @attr
        response.should have_selector("title", :content => " | Add Location")
      end
    end
    describe "success" do
      it "should add a new location" do
        lambda do
          post :create, :location => @attr
        end.should change(Location, :count).by(1)
      end
      it "should redirect to location list" do
        post :create, :location => @attr
        response.should redirect_to locations_path
      end
      it "should have a flash message" do
        post :create, :location => @attr
        flash[:success].should =~ /location added/i
      end
    end
  end

  describe "GET 'show'" do
    before { @location = Factory(:location) }
    it "should be successful" do
      get :show, :id => @location.id
      response.should be_success
    end
    it "should have the right title" do
      get :show, :id => @location.id
      response.should have_selector("title", :content => " | " + @location.name)
    end
  end

  describe "GET 'edit'" do
    before { @location = Factory(:location) }
    it "should be successful" do
      get :edit, :id => @location.id
      response.should be_success
    end
    it "should have the right title" do
      get :edit, :id => @location.id
      response.should have_selector("title", :content => " | Edit " + @location.name)
    end
    it "should have a name field" do
      get :edit, :id => @location.id
      response.should have_selector("input[name='location[name]'][type='text']")
    end
    it "should have an address1 field" do
      get :edit, :id => @location.id
      response.should have_selector("input[name='location[address1]'][type='text']")
    end
    it "should have an address2 field" do
      get :edit, :id => @location.id
      response.should have_selector("input[name='location[address2]'][type='text']")
    end
    it "should have a city field" do
      get :edit, :id => @location.id
      response.should have_selector("input[name='location[city]'][type='text']")
    end
    it "should have a state field" do
      get :edit, :id => @location.id
      response.should have_selector("input[name='location[state]'][type='text']")
    end
    it "should have a zip field" do
      get :edit, :id => @location.id
      response.should have_selector("input[name='location[zip]'][type='text']")
    end
  end

  describe "PUT 'update'" do
    before { @location = Factory(:location) }
    describe "failure" do
      before(:each) do
        @attr = {
          :name => ""
        }
        it "should render the 'edit' page" do
          put :update, :id => @location.id, :location => @attr
          response.should render_template(:edit)
        end
        it "should have the right title" do
          put :update, :id => @location.id, :location => @attr
          response.should have_selector("title", :content => "Edit Location")
        end
      end
    end
    describe "success" do

      before { @attr = { :name => "New Name", :address1 => "New Address", :address2 => "New 2nd Address", 
        :city => "Newcity", :state => "GA", :zip => "12345" } }

      it "should change the locations attributes" do
        put :update, :id => @location.id , :location => @attr
        @location.reload
        @location.name.should == @attr[:name]
        @location.address1.should == @attr[:address1]
        @location.address2.should == @attr[:address2]
        @location.city.should == @attr[:city]
        @location.state.should == @attr[:state]
        @location.zip.should == @attr[:zip]
      end
      it "should redirect to location list" do
        put :update, :id => @location.id, :location => @attr
        response.should redirect_to locations_path
      end
      it "should have a flash message" do
        put :update, :id => @location.id, :location => @attr
        flash[:success].should =~ /location updated/i
      end
    end
  end

  describe "DELETE 'destroy'" do
    before { @location = Factory(:location) }

    it "should destroy the section" do
      lambda do
        delete :destroy, :id => @location.id
      end.should change(Location, :count).by(-1)
    end

    it "should redirect to the location list" do
      delete :destroy, :id => @location.id
      response.should redirect_to locations_path
    end

    it "should have a flash message" do
      delete :destroy, :id => @location.id
      flash[:success].should =~ /location deleted/i
    end
  end

end
