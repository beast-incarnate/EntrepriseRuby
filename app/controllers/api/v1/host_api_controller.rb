module Api
	module V1
		class HostApiController < ::ApiController

			def sign_up

				name = params["name"]
				address = params["address"]
				contact = params["contact"]
				email = params["email"]
				password = params["password"]
				access_token = SecureRandom.hex(10)

				host = Host.find_by_email(email)

				if host
					return response_data({},"Email already present" , 200,[])
				else

					@host2 = Host.create(name: name , email: email , address: address , contact: contact , password: password ,  access_token:  access_token ).valid?

					if @host2
						host = Host.find_by_email(email)
						data = Hash.new
						data["access_token"] = access_token
						data["name"] = name
						data["address"] = address
						data["email"] = email
						data["contact"] = contact
						data["id"] = host.id
						return response_data(data,"Successfully signed up" , 200,[])
					else
						return response_data(data,"Error",200,[])
					end
				end

			end

			def sign_in

				email = params["email"]
				password = params["password"]

				host = Host.find_by_email(email)

				if host
					if host.password.eql?password
						data = Hash.new
						data["access_token"] = host.access_token
						data["id"] = host.id
						return response_data(data,"Successfully signed in" ,200,[])
					else
						return response_data({},"Invalid password" , 200,[])
					end
				else
					return response_data({},"Invalid email" , 200,[])
				end

			end

			def authenticate_user

				access_token = params["access_token"]

				@current_api_host = Host.find_by_access_token(access_token)

				unless @current_api_host
					return response_data({},"Not authorised",200,[])
				end

			end

		end

	end
end
