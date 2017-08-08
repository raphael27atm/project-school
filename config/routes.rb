Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, 
    path: 'auth', 
    path_names: { 
      sign_in: 'login', 
      sign_out: 'logout', 
      password: 'secret', 
      confirmation: 'verification', 
      registration: 'register', 
      sign_up: 'cmon_let_me_in' 
    }
  root to: 'dashboard#index'  

  resources :units, path: "unidades"
  resources :students, path: "estudantes"
  resources :teachers, path: "professores"
  resources :responsibles, path: "responsaveis"
  resources :teams, path: "turmas" do 
    post :matriculations
    patch :cancel_matriculation
  end
end
