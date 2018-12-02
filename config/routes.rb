Rails.application.routes.draw do
  root 'sign#sign_in'
  get 'sign_up' => 'sign#sign_up'
  post 'create' => 'sign#create'
  get 'confirm' => 'sign#confirm'
  
  get 'list' => 'list#todolist'
end