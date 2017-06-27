class ClientHostMapping < ActiveRecord::Base
  belongs_to :client
  belongs_to :host
  belongs_to :item

  validates :host_id , presence: true
  validates :client_id , presenece: true
  validates :item_id , presenece: true
  validates :quantity , presenece: true
  validates :status , presenece: true

end
