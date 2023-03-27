Rails.application.routes.draw do

  root to: "member/homes#top"

# メンバー用
devise_for :members,skip: [:passwords], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
}

namespace :member do
  get 'members/:id/show' => 'members#show'
  get 'members/edit' => 'members#edit'
  patch 'members/update' => 'members#update'
  patch 'members/withdraw' => 'members#withdraw', as: 'members_withdraw'
  get 'trainings/:member_id/index' =>'trainings#index', as:'member_trainings'
  resources :trainings, only: [:show, :edit, :update] do
    resources :training_comments, only: [:create, :update, :destroy]
  end
  resources :logs, only: [:index, :new, :create, :show, :destroy] do
    resource :likes, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  end
  get 'bookmarks/index'
  get 'search' => 'logs#search'
  end

# 店長用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
   root :to => 'admins/top#top'
   resources :members, only: [:index, :show, :edit, :update]
   resources :trainings, only: [:index, :new, :show, :edit, :update, :create, :destroy]
   resources :training_genres, only: [:index, :create, :edit, :update, :destroy]
   resources :logs, only: [:index, :new, :create, :show, :destroy]
   resources :log_genres, only: [:index, :create, :edit, :update, :destroy]
   resource :likes, only: [:create, :destroy]
   get 'bookmarks/index'
   get 'search' => 'members#search'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end