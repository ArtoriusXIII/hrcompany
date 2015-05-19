class BasicEmployee
    def initialize
      @status = "basic employee"
    end
    
    def details
        return @status
    end
    
end

class EmployeeDecorator
    def initialize(real_employee)
        @real_employee = real_employee
        @status = "no extra futueres"
    end
    
    def details
        return @status + " "+ @real_employee.details
    end
end

class AnnualLeaveDecorator < EmployeeDecorator
    def initialize(real_employee)
        super(real_employee)
        @status = "annual leave request"
    end
    
    def details
        return @status + " " + @real_employee.details
    end
end

