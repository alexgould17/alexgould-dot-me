Rails.application.routes.draw do
  # HomeController routes Landing (index) is root, Thanks & Bio (about) with top-level url's.
  root 'home#index'
  get 'bio' => 'home#about'
  get 'thanks' => 'home#thanks'
  get 'css_test' => 'home#csstest'

  # BlogController routes, standard RESTful CRUD routes.
  resources :blogs

  # ProjectsController routes, standard RESTful CRUD routes.
  resources :projects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
