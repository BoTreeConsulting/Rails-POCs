class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  # Provided by CanCan
  # Automatically authorize all actions in a RESTful style resource controller. 
  # It will use a before filter to load the resource into an instance variable 
  # and authorize it for every action.
  load_and_authorize_resource
  
  skip_load_and_authorize_resource :only => :welcome
  
  def welcome
    
  end
  
  # GET /users
  def index 
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # This is to avoid routing the user to path /users (POST) created by
  # Devise Gem.
  # POST /users/add
  def add
    @user = User.new(params[:user])
    
    if @user.save
        redirect_to @user, notice: 'User was successfully created.'
    else
        render action: "new"
    end
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  # PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
       redirect_to @user, notice: 'User was successfully updated.'
    else
       render action: "edit"
    end
  end
  
  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url
  end
  
end
