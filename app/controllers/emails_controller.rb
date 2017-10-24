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
    
    flash[:notice] = "Successfully destroyed email...from 'belongs_to' (child) object"
    # 12/8/16 DH: Just playing with a bit of rails...
    #flash.keep
    
    # 13/8/16 DH: Flash gets deleted by the time 'ContactsController::show' is called 
    # (prob due to association set resolution, and certainly by 'Contact.find(params[:id])')
    # 14/8/16 DH: Now storing flash in Contacts table
    @email.contact.flash = flash.to_hash.to_s
    @email.contact.save!

    redirect_to @email.contact
    #id = @email.contact.id
    #redirect_to contact_url id
  end
  
  private
  def email_params    
    params.require(:email).permit(:contact_id, :email, :label)
  end
  
end
