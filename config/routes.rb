Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  get 'admin' => 'static_pages#admin'

  resources :groups
  resources :users
  resources :students
  resources :teachers
  resources :testimonials
  post 'assign_to_group' => 'students#assign_to_group' # Could have been 'patch', but default in the controller method is 'post', so I left the method as default and changed this route to 'post'. Doesn't NEED to be patch.
  post 'remove_from_group' => 'students#remove_from_group'
  post 'unassign_teacher' => 'groups#unassign_teacher'
  post 'assign_as_student' => 'teachers#assign_as_student'
  post 'assign_as_teacher' => 'students#assign_as_teacher'
  post 'add_student' => 'groups#add_student'
  post 'remove_student_from_group' => 'groups#remove_student_from_group'
  

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
