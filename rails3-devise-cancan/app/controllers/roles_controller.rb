class RolesController < ApplicationController
  before_filter :authenticate_user!
  
  # Provided by CanCan
  # Automatically authorize all actions in a RESTful style resource controller. 
  # It will use a before filter to load the resource into an instance variable 
  # and authorize it for every action.
  load_and_authorize_resource
  
  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
  end

  def assign
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])
    
    if @role.save
        redirect_to @role, notice: 'Role was successfully created.'
    else
        render action: "new"
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = Role.find(params[:id])
    
    if @role.update_attributes(params[:role])
       redirect_to @role, notice: 'Role was successfully updated.'
    else
       render action: "edit"
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    redirect_to roles_url
  end
end
