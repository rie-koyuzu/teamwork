Rails.application.routes.draw do
  namespace :member do
    get 'profiles/show'
    get 'profiles/edit'
  end
  namespace :member do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'bookmarks/index'
  end
  namespace :admin do
    get 'trainings/index'
    get 'trainings/show'
    get 'trainings/edit'
  end
  namespace :admin do
    get 'training_genres/index'
    get 'training_genres/edit'
  end
  namespace :admin do
    get 'log_genres/index'
    get 'log_genres/edit'
  end
  namespace :admin do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
  end
  namespace :admin do
    get 'logs/index'
    get 'logs/new'
    get 'logs/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :member do
    get 'bookmarks/index'
  end
  namespace :member do
    get 'training/index'
    get 'training/show'
    get 'training/edit'
  end
# メンバー用
# URL /customers/sign_in ...
devise_for :members,skip: [:passwords], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
}


# 店長用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
