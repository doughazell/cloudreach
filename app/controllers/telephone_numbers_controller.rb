class TelephoneNumbersController < ApplicationController
  def create

    @telephone_number = TelephoneNumber.create(number_params)
        
    respond_to do |format|
	    format.html { redirect_to @telephone_number.contact }
	    format.js
    end
  end
  
  def destroy
    @telephone_number = TelephoneNumber.find(params[:id])
    @telephone_number.destroy
    flash[:notice] = "Successfully destroyed number."
    redirect_to @telephone_number.contact
  end
  
  private
  def number_params    
    params.require(:telephone_number).permit(:contact_id, :number, :label)
  end
  
end
