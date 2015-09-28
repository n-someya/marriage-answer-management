Rails.application.routes.draw do

  devise_for :admins

  namespace :answer_regist do
      resource :corrects
  end
  get 'reset', to: 'reset#index'
  delete 'reset', to: 'reset#delete'
  root 'welcome#index'

end
