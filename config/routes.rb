Rails.application.routes.draw do
  root 'tasks#index'
  get 'tasks/:id' => 'tasks#get'
  post 'tasks/create' => 'tasks#create'
  post 'tasks/:id/edit' => 'tasks#edit'
  delete 'tasks/:id/delete' => 'tasks#delete'
  post 'tasks/batch_delete' => 'tasks#batch_delete'
  patch 'tasks/:id/toggle' => 'tasks#toggle'

  get 'sign_in' => 'sign#sign_in'
  get 'sign_up' => 'sign#sign_up'
  get 'success_sign_up' => 'sign#success'
  get 'log_out' => 'sign#log_out'
  post 'create' => 'sign#create'
  post 'authorise' => 'sign#authorise'
  get 'confirm/:token' => 'sign#confirm', as: 'confirm_path'
end