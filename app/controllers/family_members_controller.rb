class FamilyMembersController < ApplicationController
  def index
    @title = "Family Members"
    @family_members = FamilyMember.all
  end

  def new
    @title = "New Family Member"
    @family_member = FamilyMember.new
  end

  def create
    @family_member = FamilyMember.new(params[:family_member])
    if @family_member.save
      redirect_to family_members_path
    else
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
  end

  def update
    @family_member = FamilyMember.find(params[:id])
    if @family_member.update_attributes(params[:family_member])
      redirect_to family_members_path
    else
      render 'edit'
      @title = "Edit #{@family_member.name}"
    end
  end

  def destroy
    @family_member = FamilyMember.find(params[:id])
    @family_member.destroy
    redirect_to family_members_path
  end

end
