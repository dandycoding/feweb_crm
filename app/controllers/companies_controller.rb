class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.order(:name).all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to edit_company_path(@company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  def company_params
    params[:company].permit(:name, :email, :description, :direct_invoice_id)
  end

end