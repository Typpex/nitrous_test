class EmployeePolicy < ApplicationPolicy
  attr_reader :user, :employee

  def initialize(user, employee)
    @user = user
    @post = post
  end

  def index?
    debugger
    !user.blank?
  end
end