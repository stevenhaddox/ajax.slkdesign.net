AjaxSlkdesignNet::Application.routes.draw do
  match '/pages/*id', :to => 'pages#show', :as => :page, :format => :json #:constraints => { :path => /.+?/ }
  root :to => 'high_voltage/pages#show', :id => 'home'
end
