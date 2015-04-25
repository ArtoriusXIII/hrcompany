class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /customer/1/accounts 
  def index 
    @employee = Employee.find(params[:employee_id])
    # recall that each customer has either 0 or 1 account 
    # a customer does not have more accounts and 
    # that's why we write bellow account and not accounts!!! 
    # note that @account can be nil if no account has been created yet 
    @account = @employee.account 
  end


  

  # GET /customers/1/accounts/new 
  def new 
    @employee = Employee.find(params[:employee_id]) 
    @account = @employee.build_account()
  end


 
  # GET /employees/1/accounts/2/edit 
  def edit 
    @employee = Employee.find(params[:employee_id])
    # the employee has only one account, therefore we directly 
    # retrieve his account 
    @account = @employee.account
  end
 


  
   # POST /customers/1/accounts 
  def create 
    @employee = Employee.find(params[:employee_id]) 
    @account = @employee.build_account(account_params)

    respond_to do |format| 
      if @account.save 
        format.html { redirect_to employee_account_url(@employee, @account), notice: 'Account was successfully created.' } 
        format.json { render :show, status: :created, location: @account } 
      
      else 
        format.html { render :new } 
        format.json { render json: 
          @account.errors, status: :unprocessable_entity } 
      end 
    end 
  end
  
  def show 
    @employee = Employee.find(params[:employee_id]) 
    @account = @employee.account 
  end 
  
  # PATCH/PUT /customers/1/accounts/2 
  
    def update 
      @employee = Employee.find(params[:employee_id]) 
      @account = @employee.account 
      respond_to do |format| 
        if @account.update(account_params) 
          format.html { redirect_to employee_account_url(@employee, @account),
                notice: 'Account was successfully updated.' } 
          format.json { render :show, status: :ok, location: @account } 
        else 
          format.html { render :edit } 
          format.json { render json: @account.errors, 
            status: :unprocessable_entity } 
        end 
      end
    end

    

 
   # DELETE /blogs/1/posts/2 
    def destroy 
      @employee = Employee.find(params[:employee_id]) 
      # the employee has only one account, therefore 
      # we directly retrieve his account 
      @account = @employee.account 
      @account.destroy respond_to do |format|
        format.html { redirect_to employee_accounts_url(@employee), 
          notice: 'Account was successfully destroyed.' } 
        format.json { head :no_content } 
      end 
    end
  
  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:address2, :address1, :comments, :details, :employee_id)
    end
end
