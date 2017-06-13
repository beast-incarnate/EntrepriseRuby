
module Api
	module V1
		class ClientApiController < ::ApiController
		

			def sign_up
			
				name = params["name"]
				email = params["email"]
				password = params["password"]
				contact = params["contact"]
				access_token = SecureRandom.hex(10)

				client1 = Client.find_by_email(email)

				if client1
					return response_data({},"Email already used" , 200)
				else

					check = Client.create(name: name , email: email , password: password , contact: contact , access_token: access_token).valid?

					if check
						client = Client.find_by_email(email)
						data = Hash.new
						data["access_token"] = client.access_token
						return response_data(data,"Successfully signed up",200)
					else
						return response_data({},"Error",200)
					end

				end

			end

			def sign_in

				email = params["email"]
				password = params["password"]

				client = Client.find_by_email(email)

				if client

					if client.password.eql?password
						data = Hash.new
						data["access_token"] = client.access_token
						return response_data(data,"Successfully signed in",200)
					else
						return response_data({},"Invalid Password",200)
					end
				else
					return response_data({},"Invalid Email",200)
				end

			end




		end
	end
end