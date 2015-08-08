class AddressesController < ApplicationController
  def index

    @address = Address.find()
  end
  
  def show
    @address = Address.find(params[:id])
  end

  # 'new_address' GET
  def new
    @address = Address.new
  end

  # POST
  def create
    #puts
    #puts "#{self.class.to_s}##{__method__.to_s}"
    #puts
    @address = Address.create(address_params)
    
    #flash[:notice] = "Address added to #{@address.contact.first_name} #{@address.contact.last_name}"
    
    respond_to do |format|
	    format.html {redirect_to @address.contact }
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
