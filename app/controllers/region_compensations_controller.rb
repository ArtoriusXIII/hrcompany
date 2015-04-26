class RegionCompensationsController < ApplicationController
  before_action :set_region_compensation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @region_compensations = RegionCompensation.all
    respond_with(@region_compensations)
  end

  def show
    respond_with(@region_compensation)
  end

  def new
    @region_compensation = RegionCompensation.new
    respond_with(@region_compensation)
  end

  def edit
  end

  def create
    @region_compensation = RegionCompensation.new(region_compensation_params)
    @region_compensation.save
    respond_with(@region_compensation)
  end

  def update
    @region_compensation.update(region_compensation_params)
    respond_with(@region_compensation)
  end

  def destroy
    @region_compensation.destroy
    respond_with(@region_compensation)
  end

  private
    def set_region_compensation
      @region_compensation = RegionCompensation.find(params[:id])
    end

    def region_compensation_params
      params.require(:region_compensation).permit(:region_name, :country_name, :state, :number_of_employees, :salary_total)
    end
end
