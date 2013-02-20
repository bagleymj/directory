require 'spec_helper'

describe FamilyMembersController do

  before(:each) do
    @attr = { :first_name => "Little", :last_name => "Kid", 
      :birthday => '1/1/2005', :employee_id => 1, 
      :relationship => "Child" }
  end

  render_views

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
    before(:each) do
      @employee = Factory(:employee)
    end
    it "should create a new family_member" do
      lambda do
        post :create, :family_member => @attr
      end.should change(FamilyMember, :count).by(1)
    end
    it "should redirect to the employee it belongs to" do
      post :create, :family_member => @attr
      response.should redirect_to :controller => :employees, :action => :show, :id => @attr[:employee_id]
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

  end

end
