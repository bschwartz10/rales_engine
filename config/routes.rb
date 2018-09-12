Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/:id/items', to: 'items#index', as: 'items'
        get '/:id/invoices', to: 'invoices#index', as: 'invoices'
        get '/most_revenue', to: 'most_revenue#index', as: 'most_revenue'
        get '/most_items', to: 'most_items#index', as: 'most_items'
        get '/revenue', to: 'revenue#show', as: 'revenue'
        get '/:id/revenue', to: 'single_merchant_revenue#show', as: 'single_merchant_revenue'
        get '/:id/favorite_customer', to: 'favorite_customer#show', as: 'favorite_customer'
      end
      namespace :customers do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/:id/invoices', to: 'invoices#index', as: 'invoices'
        get '/:id/transactions', to: 'transactions#index', as: 'transactions'
        get '/:id/favorite_merchant', to: 'favorite_merchant#show', as: 'favorite_merchant'
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
        get '/most_revenue', to: 'most_revenue#index', as: 'most_revenue'
        get '/most_items', to: 'most_items#index', as: 'most_items'
        get '/:id/best_day', to: 'best_day#show', as: 'best_day'
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
