class Agent < ApplicationRecord
  has_many :uploaded_seller_transactions, class_name: "UploadedTransaction", foreign_key: :listing_agent_id
  has_many :uploaded_buyer_transactions, class_name: "UploadedTransaction", foreign_key: :selling_agent_id

  #split all_transactions into 2: 
  #1. no land or mobile home property type transactions
  #2. land or mobile home property type ONLY transactions
  #Append in controller/agent.rb
  #order by selling price DESC using .order()
  def noland_nomobile_transactions
    UploadedTransaction.where("(listing_agent_id = ? OR selling_agent_id = ?) AND property_type <> ? AND property_type <> ?", id, id, "land", "mobile_home").order("selling_date DESC")
  end

  def land_mobile_transactions
    UploadedTransaction.where("(listing_agent_id = ? OR selling_agent_id = ?) AND property_type = ? OR property_type = ?", id, id, "land", "mobile_home").order("selling_date DESC")
  end

  def recent_transactions
    all_transactions.where("selling_date > ?", 6.months.ago)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
