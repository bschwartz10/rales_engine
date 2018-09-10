Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/:id/items', to: 'items#index', as: 'items'
        get '/:id/invoices', to: 'invoices#index', as: 'invoices'
      end
      namespace :customers do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/:id/invoices', to: 'invoices#index', as: 'invoices'
        get '/:id/transactions', to: 'transactions#index', as: 'transactions'
      end
      namespace :transactions do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/:id/invoice', to: 'invoices#show', as: 'invoice'
      end
      namespace :invoices do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/:id/transactions', to: 'transactions#index', as: 'transactions'
        get '/:id/invoice_items', to: 'invoice_items#index', as: 'invoice_items'
        get '/:id/items', to: 'items#index', as: 'items'
        get '/:id/customer', to: 'customers#show', as: 'customer'
        get '/:id/merchant', to: 'merchants#show', as: 'merchant'
      end
      namespace :items do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/:id/invoice_items', to: 'invoice_items#index', as: 'invoice_items'
        get '/:id/merchant', to: 'merchants#show', as: 'merchant'
      end
      namespace :invoice_items do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/:id/invoice', to: 'invoices#show', as: 'invoice'
        get '/:id/item', to: 'items#show', as: 'item'
      end
      resources :merchants,            only: [:index, :show]
      resources :customers,            only: [:index, :show]
      resources :transactions,         only: [:index, :show]
      resources :invoices,             only: [:index, :show]
      resources :items,                only: [:index, :show]
      resources :invoice_items,        only: [:index, :show]
    end
  end
end
