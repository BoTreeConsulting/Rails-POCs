class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
   begin
    @user = User.new(params[:user])    
    @user.save! #to save the file, using carrierwave
    respond_to {
	  |format| format.html { redirect_to @user, :notice => 'User was successfully created.' } 
	}
	return
   rescue Exception=>e
    respond_to {
	 |format| format.html { render :action => 'new', :notice=>'Error while storing the user: '+e.message }
	} 
	return
	else
	  redirect_to (:action=>'new')
	  return
   end  
  end

  def download_resume
    @user = User.find(params[:id])
    send_file "#{@user.resume.path}", :x_sendfile=> true
    return
  end
end
