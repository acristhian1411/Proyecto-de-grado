Rails.application.routes.draw do
  resources :clientes
  resources :barrios
  resources :ciudades
  get 'stock/index'
  get 'home/inicio'
  root 'home#inicio'
  devise_for :users
  resources :sucursales
  resources :productos
  resources :proveedores
  resources :marcas
  resources :sub_categories
  resources :categories
  get 'sucursales/subCateg_lst', as: 'subCateg_lst'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
