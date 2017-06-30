module Api
	module V1
		class ClientApiLoggedInController < ::ApiController

			before_action :authenticate_user , except: [:authenticate_user]

			def authenticate_user
				access_token = params["access_token"]
				@current_client = Client.find_by_access_token(access_token)
				unless @current_client
					return response_data({},"Not authorised",200,[])
				end
			end


			def get_all_host
				host = Host.select('name,address,id,contact,email')
				if host
					return response_data({},"All the hosts",200,host)
				else
					return response_data({},"Error",200,[])
				end
			end

			def get_mappings_client
				@mappings = ClientHostMapping.where(:client_id => @current_client.id)
				return response_data({},"Client mappings",200,@mappings)
			end

		end
	end
end
