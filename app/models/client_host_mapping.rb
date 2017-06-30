class ClientHostMapping < ActiveRecord::Base
  belongs_to :client
  belongs_to :host
  belongs_to :item

  validates :host_id , presence: true
  validates :client_id , presence: true
  validates :item_id , presence: true
  validates :quantity , presence: true
  validates :status , presence: true
end
