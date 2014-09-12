class Company < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  has_many :contacts


  def invoices
    if self.direct_invoice_id.present?
      Invoice.find(:all, params: { filters: { company_id: self.direct_invoice_id }, api_key: Invoice::API_KEY })
    else
      []
    end
  end

end
