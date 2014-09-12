class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to company_path(@contact.company)
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params[:contact].permit(:name, :email, :company_id)
  end

end