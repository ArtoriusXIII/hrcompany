require 'my_logger' 
require 'employee_decorator'

class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
   @employee = Employee.new()
    
    @employee.first_name = params[:employee][:first_name]
    @employee.last_name = params[:employee][:last_name]
    @employee.phone = params[:employee][:phone]
    @employee.job_type = params[:employee][:job_type]
    @employee.date_of_hire = params[:employee][:date_of_hire]
     @employee.salary = params[:employee][:salary]
    @employee.vacation_days = params[:employee][:vacation_days]
    @employee.status = params[:employee][:status]
    @employee.department = params[:employee][:department]
  
    
    
    #create instance
    myEmployee = BasicEmployee.new()
    
    #add extra
    if params[:employee][:request].to_s.length > 0 then
      myEmployee = AnnualLeaveDecorator.new(myEmployee)
    end
    
    #populate the description details
    @employee.status = myEmployee.details
    
    # retrieve the instance/object of the MyLogger class 
    logger = MyLogger.instance
    logger.logInformation("A new employee requested: " + @employee.status)
    
	   

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :phone, :job_type, :date_of_hire, :salary, :vacation_days, :status, :department, :manager)
    end
end
