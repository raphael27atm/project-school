Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, 
    path: 'auth', 
    path_names: { 
      sign_in: 'login', 
      sign_out: 'logout'
    }
  root to: 'dashboard#index'  

  resources :schools, path: "escolas"
  resources :users, path: "usuarios" 
  resources :units, path: "unidades"
  resources :students, path: "estudantes"
  resources :teachers, path: "professores"
  resources :responsibles, path: "responsaveis"
  resources :teams, path: "turmas" do 
    resources :matriculations, only: [:new, :create, :destroy]
  end
end
