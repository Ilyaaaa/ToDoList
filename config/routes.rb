Rails.application.routes.draw do
  root 'tasks#index'
  get 'tasks/:id' => 'tasks#get'
  post 'tasks' => 'tasks#get_all'
  post 'tasks/create' => 'tasks#create'
  post 'tasks/:id/edit' => 'tasks#edit'
  delete 'tasks/:id/delete' => 'tasks#delete'


  get 'sign_in' => 'sign#sign_in'
  get 'sign_up' => 'sign#sign_up'
  post 'create' => 'sign#create'
  post 'authorise' => 'sign#authorise'
  get 'confirm' => 'sign#confirm'
end