Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'host_sign_up' => "host_api#sign_up"
      get 'host_sign_in' => "host_api#sign_in"
      post 'host_add_item' => "host_api_logged_in#add_item"
      post 'host_update_item' => "host_api_logged_in#update_item"
      get 'host_get_item' => "host_api_logged_in#get_item"
      post 'host_delete_item' => "host_api_logged_in#delete_item"
      post 'client_sign_up' => "client_api#sign_up"
      get 'client_sign_in' => "client_api#sign_in"
      get 'get_all_host' => "client_api_logged_in#get_all_host"
      get 'host_get_all_items' => "host_api_logged_in#get_all_items"
    end
  end

end
