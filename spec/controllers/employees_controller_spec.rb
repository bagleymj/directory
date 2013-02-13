require 'spec_helper'

describe EmployeesController do

  render_views

  before(:each) do
    @attr = { :name => "Test Name", :address1 => "Address", :address2 => "", :city => "Macon", :state => "GA", :zip => "99999" }
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end  
    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => " | Employee List")
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => " | New Employee")
    end
    it "should have the title in big letters at the top" do
      get :new
      response.should have_selector("h1", :content => "New Employee")
    end
    it "should have the correct form fields" do
      get :new
      response.should have_selector("input[name='employee[name]'][type='text']")
      response.should have_selector("input[name='employee[address1]'][type='text']")
      response.should have_selector("input[name='employee[address2]'][type='text']")
      response.should have_selector("input[name='employee[city]'][type='text']")
      response.should have_selector("input[name='employee[state]'][type='text']")
      response.should have_selector("input[name='employee[zip]'][type='text']")
    end
  end

  describe "POST 'create'" do
    it "should add a new record" do
      lambda do
        post :create, :employee => @attr
      end.should change(Employee, :count).by(1)
    end

    it "should redirect to employee list" do
      post :create, :employee => @attr
      response.should redirect_to employees_path
    end

  end

  describe "GET 'show'" do
    before { @employee = Factory(:employee) }
    it "should be successful" do
      get :show, :id => @employee.id
      response.should be_success
    end
    it "should have the right title" do
      get :show, :id => @employee.id
      response.should have_selector("title", :content => " | " + @employee.name)
    end
    it "should have the right title in big letters at the top" do
      get :show, :id => @employee.id
      response.should have_selector("title", :content => @employee.name)
    end
  end

  describe "GET 'edit'" do
    before { @employee = Factory(:employee) }
    it "should be successful" do
      get :edit, :id => @employee.id
      response.should be_success
    end
    it "should have the right title" do
      get :edit, :id => @employee.id
      response.should have_selector("title", :content => " | Edit " + @employee.name)
    end
    it "should have the title in big letters at the top" do
      get :edit, :id => @employee.id
      response.should have_selector("h1", :content => "Edit " + @employee.name)
    end
    it "should have the correct form fields" do
      get :edit, :id => @employee.id
      response.should have_selector("input[name='employee[name]'][type='text']")
      response.should have_selector("input[name='employee[address1]'][type='text']")
      response.should have_selector("input[name='employee[address2]'][type='text']")
      response.should have_selector("input[name='employee[city]'][type='text']")
      response.should have_selector("input[name='employee[state]'][type='text']")
      response.should have_selector("input[name='employee[zip]'][type='text']")
    end
  end
end
