require 'spec_helper'

describe FamilyMembersController do


  render_views

  def create_employee
    @employee = Employee.create(:first_name => "Test",
                                :last_name => "Employee",
                                :email => "employee@email.com",
                                :home_num => "555-555-5555",
                                :mobile_num => "555-555-55555",
                                :address1 => "123 Main Street",
                                :city => "Town",
                                :state => "GA",
                                :zip => "31088",
                                :location_id => 1,
                                :job_title => "Tester",
                                :birthday => '1970-1-1',
                                :hire_date => '1990-1-1')
  end

  before(:each) do
    create_employee
    @attr = { :first_name => "Little", :last_name => "Kid", 
      :birthday => '2005-1-1', :employee_id => 1, 
      :relationship => "Son" }
  end


  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Family Members")
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "New Family Member")
    end
    it "should have the right form fields" do
      get :new
      response.should have_selector("input[name='family_member[first_name]'][type='text']")
      response.should have_selector("input[name='family_member[last_name]'][type='text']")
    end
  end

  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = {
          :first_name => "",
        }
      end
      #it "should render the 'new' page" do
      #  post :create, :family_member => @attr
      #  response.should render_template(:new)
      #end
      #it "should have the correct title" do
      #  post :create, :family_member => @attr
      #  response.should have_selector("title", :content => "New Family Member")
      #end
    end
    describe "success" do
      it "should create a new family_member" do
        lambda do
          post :create, :family_member => @attr
        end.should change(FamilyMember, :count).by(1)
      end
      it "should redirect to the employee it belongs to" do
        post :create, :family_member => @attr
        response.should redirect_to :controller => :employees, :action => :show, :id => @attr[:employee_id]
      end
      it "should have a flash message" do
        post :create, :family_member => @attr
        flash[:success].should =~ /family member created/i
      end
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @family_member = Factory(:family_member)
    end
    it "should be successful" do
      get :show, :id => @family_member.id
      response.should be_success
    end
    it "should have the right title" do
      get :show, :id => @family_member.id
      response.should have_selector("title", :content => " | #{@family_member.name}")
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @family_member = Factory(:family_member)
    end
    it "should be successful" do
      get :edit, :id => @family_member.id
      response.should be_success
    end
    it "should have the right title" do
      get :edit, :id => @family_member.id
      response.should have_selector(:title, :content => " | Edit #{@family_member.name}")
    end
    it "should have the right form fields" do
      get :edit, :id => @family_member.id
      response.should have_selector("input[name='family_member[first_name]'][type='text']")
      response.should have_selector("input[name='family_member[last_name]'][type='text']")
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @family_member = Factory(:family_member)
    end
    describe "failure" do
      before(:each) do
        @attr = {
          :first_name => "",
        }
      end
      #it "should render the 'edit' page" do
      #  put :update, :id => @family_member.id, :family_member => @attr
      #  response.should render_template(:edit)
      #end
      #it "should have the correct title" do
      #  put :update, :id => @family_member.id, :family_member => @attr
      #  response.should have_selector("title", :content => "Edit Family Member")
      #end
    end
    describe "success" do
      it "should change the family member's attributes" do
        put :update, :id => @family_member.id, :family_member => @attr
        @family_member.reload
        @family_member.first_name.should == @attr[:first_name]
        @family_member.last_name.should == @attr[:last_name]
        @family_member.relationship.should== @attr[:relationship]
        @family_member.employee_id.should == @attr[:employee_id]
      end
      it "should redirect to the user it belongs to" do
        put :update, :id => @family_member.id, :family_member => @attr
        response.should redirect_to :controller => :employees, :action => :show, :id => @attr[:employee_id]
      end
      it "should have a flash message" do
        put :update, :id => @family_member.id, :family_member => @attr
        flash[:success].should =~ /family member updated/i
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @family_member = Factory(:family_member)
    end
    it "should delete the row" do
      lambda do
        delete :destroy, :id => @family_member.id
      end.should change(FamilyMember, :count).by(-1)
    end
    it "should redirect to family member list" do
      delete :destroy, :id => @family_member.id
      response.should redirect_to :controller => :employees, :action => :show, :id => @family_member.employee_id
    end
    it "should have a flash message" do
      delete :destroy, :id => @family_member.id
      flash[:success].should =~ /family member deleted/i
    end
  end
end
