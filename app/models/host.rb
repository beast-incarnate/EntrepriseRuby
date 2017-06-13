class Host < ActiveRecord::Base

	has_many :items
	validates :name , presence: true
	validates :address , presence: true
	validates :email , presence: true
	validates :contact , presence: true
	validates :password , presence: true
	validates :access_token , presence: true
end
