Rails.application.routes.draw do
  resources :runtests
  resources :patienttests
  resources :patientinfos
  resources :patienthistories
  resources :nurses
  resources :medicalhistories
  resources :labtestsresults
  resources :getinfos
  resources :doctors
  resources :currentmedicals
  resources :analyzeordiagnoses
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html'

  root 'dashboard#index'
  # root 'labtestsresults#index'
end
