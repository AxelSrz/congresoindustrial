Rails.application.routes.draw do
  get 'visit/new'

  get 'workshop/new'

  post ':controller(/:action(/:id))(.:format)'
  root :to => 'sessions#login'
  get "login", :to => "sessions#login"
  get "logout", :to => "sessions#logout"
  get "home", :to => "sessions#home"
  get "inicio", :to => "sessions#attendee_home"
  get "nuevo_administrador", :to => "admins#new"
  post "nuevo_administrador", :to => "admins#create"
  get "lista_asistentes", :to => "atendees#lista_asistentes"
  get "no_confirmados", :to => "atendees#no_confirmados"
  get "profile", :to => "sessions#profile"
  get "setting", :to => "sessions#setting"
  get "herramientas", :to => "sessions#herramientas"
  get "lista_visitas", :to => "visits#lista_visitas"
  get "nueva_visita", :to => "visits#new"
  post "nueva_visita", :to => "visits#create"
  get "visita_regitrada", :to => "visits#success"
  get "lista_talleres", :to => "workshops#lista_talleres"
  get "nuevo_taller", :to => "workshops#new"
  post "nuevo_taller", :to => "workshops#create"
  get "taller_registrado", :to => "workshops#success"
  get "registro_asistentes", :to => "atendees#new"
  post "registro_asistentes", :to => "atendees#create"
  get "agregar_vot", :to => "admins#add_vow"
  get "login_asistente", :to => "sessions#login_atendee"
  get "confirmacion_registro", :to => "atendees#signup_atendee"
  get "seleccion_visita", :to => "atendees#select_visit"
  get "seleccion_taller", :to => "atendees#select_workshop"
  get "registro_exitoso", :to => "atendees#registration_success"
  get "detalle_visita/:id", :to => "visits#detalle_visita", as: "detalle_visita"
  get "detalle_taller/:id", :to => "workshops#detalle_taller", as: "detalle_taller"
  put "detalle_visita/abrir_lugares_visitas", :to => "visits#abrir_lugares_visitas", as: "abrir_lugares_visitas"
  put "detalle_taller/abrir_lugares_talleres", :to => "workshops#abrir_lugares_talleres", as: "abrir_lugares_talleres"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
