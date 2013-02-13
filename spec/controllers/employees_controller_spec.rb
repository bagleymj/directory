require 'spec_helper'

describe EmployeesController do

  render_views

  before(:each) do
    @attr = { :first_name => "Test", :last_name => "Employee", :middle_name => "Dee", :address1 => "Address", 
      :address2 => "", :city => "Macon", :state => "GA", :zip => "99999", :birthday => '1/1/1990',
      :mobile_num => "555-555-5555", :home_num => "555-555-5555" }
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
      response.should have_selector("input[name='employee[first_name]'][type='text']")
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
      response.should have_selector("title", :content => " | " + @employee.first_name)
    end
    it "should have the right title in big letters at the top" do
      get :show, :id => @employee.id
      response.should have_selector("title", :content => @employee.first_name)
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
      response.should have_selector("title", :content => " | Edit " + @employee.first_name)
    end
    it "should have the title in big letters at the top" do
      get :edit, :id => @employee.id
      response.should have_selector("h1", :content => "Edit " + @employee.first_name)
    end
    it "should have the correct form fields" do
      get :edit, :id => @employee.id
      response.should have_selector("input[name='employee[first_name]'][type='text']")
      response.should have_selector("input[name='employee[address1]'][type='text']")
      response.should have_selector("input[name='employee[address2]'][type='text']")
      response.should have_selector("input[name='employee[city]'][type='text']")
      response.should have_selector("input[name='employee[state]'][type='text']")
      response.should have_selector("input[name='employee[zip]'][type='text']")
    end
  end

  describe "PUT 'update'" do
    before { @employee = Factory(:employee) }
    describe "success" do
      before { @attr = {:first_name => "Test", :last_name => "Person", :middle_name => "Eff", :address1 => "1 Street", 
        :address2 => "12", :city => "WR", :state => "GA", :zip => "12345", :birthday => '1/1/1991',
        :home_num => "777-777-7777", :mobile_num => "777-777-7777"} }
      
      it "should change the employee's attributes" do
        put :update, :id => @employee.id, :employee => @attr
        @employee.reload
        @employee.first_name.should == @attr[:first_name]
        @employee.address1.should == @attr[:address1]
        @employee.address2.should == @attr[:address2]
        @employee.city.should == @attr[:city]
        @employee.state.should == @attr[:state]
        @employee.zip.should == @attr[:zip]
      end

      it "should redirect to the employee list" do
        put :update, :id => @employee.id, :employee => @attr
        response.should redirect_to employees_path
      end
    end
  end

  describe "DELETE 'destroy'" do
    before { @employee = Factory(:employee) }
    it "should delete the entry" do
      lambda do
        delete :destroy, :id => @employee.id
      end.should change(Employee, :count).by(-1)
    end
    it "should redirect to the employee list" do
      delete :destroy, :id => @employee.id
      response.should redirect_to employees_path
    end
  end
end
