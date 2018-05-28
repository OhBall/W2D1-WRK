require_relative "Employee.rb"
require 'byebug'
class Manager < Employee
  attr_accessor :employees  
  
  def initialize(name, title, salary, boss)
    super 
    @employees = []
  end 
  
  def bonus(multiplier) 
    # return salary if employee.class != Manager 
    base = employees.inject(0) do |acc, employee| 
      # debugger
      sub_bonus = employee.bonus(1)
      if employee.class == Manager 
        sub_bonus += employee.salary
      end 
      acc += sub_bonus
    end 
    base * multiplier 
  end 
  
  def add_employee(employee)
    self.employees << employee
  end
  
end 

ned = Manager.new("ned","founder",1000000, nil)
darren = Manager.new('darren','TA Manager', 78000,ned)
shawna = Employee.new('shawna','TA',12000,darren)
david = Employee.new('david','TA',10000,darren)

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
