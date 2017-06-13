module Api
	module V1
		class ClientApiLoggedInController < ::ApiController

			before_action :authenticate_user , except: [:authenticate_user]

			def authenticate_user

				access_token = params["access_token"]

				@current_client = Client.find_by_access_token(access_token)

				unless @current_client
					return response_data({},"Not authorised",200)
				end


			end


			def get_all_host

				host = Host.select('name,address,id,contact,email')

				if host
					return response_data(host,"All the hosts",200)
				else
					return response_data({},"Error",200)
				end


			end

		end
	end
end
