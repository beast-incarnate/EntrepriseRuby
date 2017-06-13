class Item < ActiveRecord::Base
  belongs_to :host

  validates :name , presence: true
  validates :price , presence: true
  validates :amount , presence: true
  validates :host_id , presence: true

end
