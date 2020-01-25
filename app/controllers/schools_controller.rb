class SchoolsController < ApplicationController
  before_action :load_school, only: %i(show edit update destroy)

  def index
    @school = School.all
  end

  def show
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to(school_path(@school), notice: "School added")
    else
      flash.now.alert = "Error saving school" 
      render(:new)
    end
  end

  def edit
  end

  def update
    load_school
    if @school.update(school_params)
      redirect_to(school_path(@school), notice: "School updated")
    else
      flash.now.alert = "Error saving school"
      render(:edit)
    end
  end

  def destroy
    load_school
    @school.destroy
    redirect_to(schools_path, notice: "School deleted")
  end

  private

  def load_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :address, :principal, :capacity, :private_school)
  end
end
