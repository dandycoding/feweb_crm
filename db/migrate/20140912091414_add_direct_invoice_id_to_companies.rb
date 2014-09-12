class AddDirectInvoiceIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :direct_invoice_id, :integer
  end
end
