class Client < ActiveRecord::Base

	validates :name , presence: true
	validates :email , presence: true
	validates :password , presence: true
	validates :access_token , presence: true
	validates :contact , presence: true

end
