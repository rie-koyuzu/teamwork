Rails.application.routes.draw do

  root to: "member/homes#top"

# メンバー用
devise_for :members,skip: [:passwords], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
}

namespace :member do
  get 'members/show' => 'members#show'
  get 'members/edit' => 'members#edit'
  patch 'members/update' => 'members#update'
  patch 'members/withdraw' => 'members#withdraw', as: 'members_withdraw'
  get 'bookmarks/index'
  resources :trainings, only: [:index, :show, :edit, :update]
  resources :logs, only: [:index, :new, :create, :show]
  post 'goods/:id' => 'goods#create', as: 'create_good'
  delete 'goods/:id' => 'goods#destroy'
  end

# 店長用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
   root :to => 'admins/top#top'
   resources :members, only: [:index, :show, :edit, :update]
   resources :trainings, only: [:index, :show, :edit, :update]
   resources :training_genres, only: [:index, :create, :edit, :update]
   resources :logs, only: [:index, :new, :create, :show, :destroy]
   resources :log_genres, only: [:index, :create, :edit, :update]
   get 'bookmarks/index'
   post 'goods/:id' => 'goods#create', as: 'create_good'
   delete 'goods/:id' => 'goods#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
