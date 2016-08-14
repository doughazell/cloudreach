class ContactsController < ApplicationController
  def index

    @contacts = Contact.all
  end
  
  def show
    @contact = Contact.find(params[:id])

    # 14/8/16 DH: Adding association flash transfer mechanism
    # (BEWARE OF CORRUPTED CONTENTS TO '@contact.flash' SINCE USING 'eval'...!!!)
    if ! @contact.flash.empty?
      trnsFlash = eval @contact.flash
      trnsFlash.keys.each do |key|
        flash.now[key] = trnsFlash[key]
      end
      @contact.flash.clear
      @contact.save!
    end
    
    # 26/5/16 DH: Adding in FnordMetric
    FNORD_METRIC.event(@contact.attributes.merge(_type: :view_contact))
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
        
    if @contact.save
      flash[:notice] = "Successfully created contact."
      redirect_to @contact
    else
      render :action => 'new'
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      flash[:notice] = "Successfully updated contact."
      redirect_to @contact
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact"
    redirect_to contacts_url
  end
    
  private
  def contact_params    
    params.require(:contact).permit(:first_name, :last_name)
  end
end
