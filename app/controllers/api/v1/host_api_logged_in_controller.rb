module Api
	module V1
		class HostApiLoggedInController < ::ApiController
				
			before_action :authenticate_user , except: [:authenticate_user]

			def authenticate_user

				access_token = params["access_token"]

				@current_api_host = Host.find_by_access_token(access_token)

				unless @current_api_host
					return response_data({},"Not authorised",200)
				end

			end

			def get_host

				access_token = params["access_token"]

				host = Host.find_by_access_token(access_token)

				if host
					data = Hash.new
					data["email"] = host.email
					data["address"] = host.address
					data["name"] = name
					data["contact"] = contact
					return response_data(data,"Found the host",200)
				else
					return response_data({},"No Host Found",200)
				end

			end

			def add_item

				name = params["name"]
				price = params["price"]
				amount = params["amount"]

				find_item = Item.find_by_name(name)

				if find_item
					return response_data({},"Item already Present",200)

				else
					
					item = @current_api_host.items.create(name: name , price: price  , amount: amount).valid?

					if item
						added_item = Item.find_by_name(name).id
						return response_data(added_item,"Successfully added item",200)
					else
						return response_data({},"Not added item",200)
					end
				end
			end
			def update_item

				id = params["id"]
				name = params["name"]
				price = params["price"]
				amount = params["amount"]



				item = @current_api_host.items.find(id)

				if(name!=nil&&price!=nil&&amount!=nil)

				 if item
					item.name = name
					item.price = price
					item.amount = amount
					item.save
					return response_data(item,"Successfully updated item",200)
				 else
					return response_data({},"Item Not Found",200)
				 end
				else
					return response_data({},"Error",200)
				end
			end

			def get_item

					id = params["id"]
					item = Item.find(id)
				if item
					return response_data(item,"Successfully found" , 200)
				else
					return response_data({},"Not Found" , 200)
				end

			end

			def delete_item

				id = params["id"]
				item = Item.find(id)
				if item
					item.destroy
					return response_data({},"Successfully deleted",200)
				else
					return response_data({},"Not Found",200)
				end

			end

			def get_all_items

					data = Hash.new
					data["items"] = @current_api_host.items.all
					return response_data(data,"Get all items",200)

			end

		end
	end
end