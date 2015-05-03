class AddressesController < ApplicationController
  def index

    @address = Address.find()
  end
  
  def show
    @address = Address.find(params[:id])
  end
  
  def new
    @address = Address.new
  end
  
  def create
    @address = Address.create(address_params)
    
    #flash[:notice] = "Email added to #{@email.contact.first_name} #{@email.contact.last_name}"
    
    respond_to do |format|
	    format.html { redirect_to @address.contact }
	    format.js
    end

  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(address_params)
      flash[:notice] = "Successfully updated address."
      redirect_to @address.contact
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "Successfully destroyed address."
    redirect_to @address.contact
  end
  
  private
  def address_params    
    params.require(:address).permit(:contact_id, :first_line, :other_lines, :town, :postcode)
  end
end
