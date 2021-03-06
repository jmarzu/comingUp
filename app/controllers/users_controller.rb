class UsersController < ApplicationController
  
  before_action :is_authenticated
  before_action :is_admin

  # create a new blank template for user, direct to new user page
  def new
    @user = User.new
  end

  # create a new user in the db, redirect to admin profile
  def create
    user = User.new(user_params)
<<<<<<< HEAD
    if user.save && !user.admin
      user.create_student
      redirect_to students_path
    elsif user.save && user.admin
=======
    if user.save
      session[:user_id] = user.id
      @students = user.students.create()
>>>>>>> 7a7bea518daf98a1a2973bf5844129bbe2a81f62
      redirect_to students_path
    else
      flash[:danger] = @user.errors.messages
      redirect_to new_user_path
    end
  end

  # pull user info, populate form, pull up form
  def edit
    @user = User.find_by_id(params[:id])
  end

  # update already existing user
  def update
    User.find(params[:id]).update(user_params)
    redirect_to student_path(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end

  # def student_params
  #   params.require(:student).permit(:brand, :linkedin, :resume, :jobtracker, :portfolio)
  # end

end
