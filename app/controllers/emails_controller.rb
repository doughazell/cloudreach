class EmailsController < ApplicationController
  def create

    @email = Email.create(email_params)
    
    #flash[:notice] = "Email added to #{@email.contact.first_name} #{@email.contact.last_name}"
    
    respond_to do |format|
	    format.html { redirect_to @email.contact }
	    format.js
    end
  end
  
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    flash[:notice] = "Successfully destroyed email."
    redirect_to @email.contact
  end
  
  private
  def email_params    
    params.require(:email).permit(:contact_id, :email, :label)
  end
  
end
