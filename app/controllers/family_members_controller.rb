class FamilyMembersController < ApplicationController
  def index
    @title = "Family Members"
    @family_members = FamilyMember.all
  end

  def new
    @title = "New Family Member"
    @family_member = FamilyMember.new(:employee_id => params[:employee_id], 
                                     :last_name => params[:last_name])
    @nav_id = params[:location_id].to_i
  end

  def create
    @family_member = FamilyMember.new(params[:family_member])
    if @family_member.save
      flash[:success] = "Family member created."
      redirect_to :controller => :employees, :action => :show, :id => @family_member.employee_id
    else
      @title = "New Family Member"
      @nav_id = "admin"
      render 'new'
    end
  end

  def show
    @family_member = FamilyMember.find(params[:id])
    @title = @family_member.name
  end

  def edit
    @family_member = FamilyMember.find(params[:id])
    @title = "Edit #{@family_member.name}"
    @nav_id = params[:location_id].to_i
  end

  def update
    @family_member = FamilyMember.find(params[:id])
    if @family_member.update_attributes(params[:family_member])
      @family_member.reload
      flash[:success] = "Family member updated."
      redirect_to :controller => :employees, :action => :show, :id => @family_member.employee_id
    else
      @nav_id = "admin"
      @title = "Edit Family Member"
      render 'edit'
    end
  end

  def destroy
    @family_member = FamilyMember.find(params[:id])
    @family_member.destroy
    flash[:success] = "Family member deleted."
    redirect_to :controller => :employees, :action => :show, :id => @family_member.employee_id
  end

end
