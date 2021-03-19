class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_current_user, except: [:index]

  def index
    @users = User.all
  end

  def show
    add_breadcrumb('User')
  end

  def edit
    add_breadcrumb('User', users_show_path)
    add_breadcrumb('Edit')
  end
  

  # private

  # def set_current_user
  #   @user = current_user
  # end
end
