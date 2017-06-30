module Api
	module V1
		class HostApiLoggedInController < ::ApiController
				
			before_action :authenticate_user , except: [:authenticate_user]

			def authenticate_user

				access_token = params["access_token"]

				@current_api_host = Host.find_by_access_token(access_token)

				unless @current_api_host
					return response_data({},"Not authorised",200,[])
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
					return response_data(data,"Found the host",200,[])
				else
					return response_data({},"No Host Found",200,[])
				end

			end

			def add_item

				name = params["name"]
				price = params["price"]
				amount = params["amount"]

				find_item = Item.find_by_name(name)

				if find_item
					host_access_token = Host.find(find_item.host_id).access_token
					if params["access_token"].eql?host_access_token
						return response_data({},"Item already Present",200,[])
					end
				end
					item = @current_api_host.items.create(name: name , price: price  , amount: amount).valid?

					if item
						added_item = Item.find_by_name(name)
						return response_data(added_item,"Successfully added item",200,[])
					else
						return response_data({},"Not added item",200,[])
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
					return response_data(item,"Successfully updated item",200,[])
				 else
					return response_data({},"Item Not Found",200,[])
				 end
				else
					return response_data({},"Error",200,[])
				end
			end

			def get_item

					id = params["id"]
					item = Item.find(id)
				if item
					return response_data(item,"Successfully found" , 200,[])
				else
					return response_data({},"Not Found" , 200,[])
				end

			end

			def delete_item

				id = params["id"]
				item = Item.find(id)
				if item
					item.destroy
					return response_data({},"Successfully deleted",200,[])
				else
					return response_data({},"Not Found",200,[])
				end

			end

			def get_all_items
					return response_data({},"Get all items",200,@current_api_host.items.all)

			end

			def create_client_host_mapping

					client_id = params["client_id"]
					item_id = params["item_id"]
					qunatity = params["qunatity"]
					status = params["status"]

					@item = Item.find(item_id)
					unless params["access_token"].eql?Host.find(@item.host_id).access_token
						return response_data({},"Unaithorised",200,[])
					end

					mapping = @current_api_host.ClientHostMapping.where(:client_id => client_id , :item_id => item_id).first

				unless mapping

					check = @current_api_host.client_host_mappings.create(client_id: client_id , item_id: item_id , qunatity: qunatity , status: status).valid?

					if check
						return response_data({},"Mapping successfully created",200,[])
					else
						return response_data({},"Invalid entries",200,[])
					end
				else
					return response_data({},"Mapping exists",200,[])
				end
			end

			def get_mappings_host
				@mappings = ClientHostMapping.where(:host_id => @current_api_host.id)
				return response_data({},"Client mappings",200,@mappings)
			end

			def update_mapping_status
				id = params["id"]
				client_id = params["client_id"]
				item_id = params["item_id"]
				quantity = params["qunatity"]
				status = params["status"]

				mapping = ClientHostMapping.find(id)

				if(client!=nil&&item!=nil&&quantity!=nil&&status!=nil)
					
					if mapping
						mapping.client_id = client_id
						mapping.item_id = item_id
						mapping.quantity = quantity
						mapping.status = status
						return response_data({},"Successfully updated",200,[])
					else
						return response_data({},"Mapping not found",200,[])
					end

				else
					return response_data({},"Invalid entries",200,[])
				end

			end

			def delete_mapping
				id = params["id"]
				mapping = ClientHostMapping.find(id)
				if mapping
					mapping.destroy
					return response_data({},"Successfully deleted",200,[])
				else
					return response_data({},"Mapping not found",200,[])
				end
			end

		end
	end
end