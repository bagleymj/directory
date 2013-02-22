require 'spec_helper'

describe EmployeesController do

  render_views

  before(:each) do
    @attr = { :first_name => "Test", :last_name => "Employee", :address1 => "Address", 
      :address2 => "", :city => "Macon", :state => "GA", :zip => "99999", :birthday => '1990-1-1',
      :hire_date => '2004-1-1', :mobile_num => "555-555-5555", :home_num => "555-555-5555", :job_title => "Purchasing",
      :extension => "5678", :email => "gmail@email.net", :location_id => 1 }
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
    it "should have the correct form fields" do
      get :new
      response.should have_selector("input[name='employee[first_name]'][type='text']")
      response.should have_selector("input[name='employee[last_name]'][type='text']")
      response.should have_selector("input[name='employee[email]'][type='text']")
      response.should have_selector("input[name='employee[address1]'][type='text']")
      response.should have_selector("input[name='employee[address2]'][type='text']")
      response.should have_selector("input[name='employee[city]'][type='text']")
      response.should have_selector("input[name='employee[state]'][type='text']")
      response.should have_selector("input[name='employee[zip]'][type='text']")
      response.should have_selector("input[name='employee[home_num]'][type='text']")
      response.should have_selector("input[name='employee[mobile_num]'][type='text']")
      response.should have_selector("input[name='employee[extension]'][type='text']")
      response.should have_selector("input[name='employee[job_title]'][type='text']")
    end
  end

  describe "POST 'create'" do
    describe "failure" do
      before (:each) do
        @attr = {
          :first_name => "",
          :last_name => ""}
      end
      it "should render the 'new' page" do
        post :create, :employee => @attr
        response.should render_template(:new)
      end

      it "should have the right title" do
        post :create, :employee => @attr
        response.should have_selector("title", :content => "New Employee")
      end
    end

    describe "success" do

      it "should add a new record" do
        lambda do
          post :create, :employee => @attr
        end.should change(Employee, :count).by(1)
      end

      it "should redirect to employee list" do
        post :create, :employee => @attr
        response.should redirect_to employees_path
      end

      it "should have a flash message" do
        post :create, :employee => @attr
        flash[:success].should =~ /employee saved/i
      end
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
    it "should have the correct form fields" do
      get :edit, :id => @employee.id
      response.should have_selector("input[name='employee[first_name]'][type='text']")
      response.should have_selector("input[name='employee[last_name]'][type='text']")
      response.should have_selector("input[name='employee[email]'][type='text']")
      response.should have_selector("input[name='employee[address1]'][type='text']")
      response.should have_selector("input[name='employee[address2]'][type='text']")
      response.should have_selector("input[name='employee[city]'][type='text']")
      response.should have_selector("input[name='employee[state]'][type='text']")
      response.should have_selector("input[name='employee[zip]'][type='text']")
      response.should have_selector("input[name='employee[home_num]'][type='text']")
      response.should have_selector("input[name='employee[mobile_num]'][type='text']")
      response.should have_selector("input[name='employee[extension]'][type='text']")
      response.should have_selector("input[name='employee[job_title]'][type='text']")
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @employee = Factory(:employee)
    end
    
    describe "failure" do
      before(:each) do
        @attr = {
          :first_name => "",
          :last_name => ""
        }
      end

      it "should render the 'edit' page" do
        put :update, :id => @employee.id, :employee => @attr
        response.should render_template(:edit)
      end

      it "should have the right title" do
        put :update, :id => @employee.id, :employee => @attr
        response.should have_selector("title", :content => " | Edit Employee")
      end

    end
    
    describe "success" do
      
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
        response.should redirect_to :action => :show, :id => @employee.id
      end

      it "should have a flash message" do
        put :update, :id => @employee.id, :employee => @attr
        flash[:success].should =~ /employee updated/i
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
    it "should have a flash message" do
      delete :destroy, :id => @employee.id
      flash[:success].should =~ /employee deleted/i
    end
  end
end
