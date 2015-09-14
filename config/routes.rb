Rails.application.routes.draw do

  devise_for :admins

  namespace :answer_regist do
      resource :corrects
  end

  root 'welcome#index'

end
