require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end
  
  def sign_in
    # 1. Ask the user for the username -> SessionsView
    username = @sessions_view.ask_user_for("username")
    # 2. Ask user for the password -> SessionsView
    password = @sessions_view.ask_user_for("password")
    # 3. Find the employee by the username
    employee = @employee_repository.find_by_username(username)
    #   if found -> Check if passwords match
    if employee
      if employee.password == password
        @sessions_view.successfull_login(employee.username)
        return employee
      else
        @sessions_view.wrong_credentials
        sign_in
      end
    else
      @sessions_view.wrong_credentials
      sign_in

    end
    #     Successfull login 
    #   if not
    #     ?
  end
end