Rails.application.routes.draw do
   # Définir la route racine
  root 'horses#index'
  
  get "horses/index"
  get "horses/new"
  get "horses/edit"
  # Ressources pour les stables avec toutes les actions RESTful
  resources :stables
  resources :horses

  # Route pour vérifier l'état de l'application (health check)
  get "up" => "rails/health#show", as: :rails_health_check

  # Routes pour les fichiers PWA
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Définit la route de la racine de l'application
  # Assurez-vous de définir une page d'accueil appropriée si nécessaire
  # root "posts#index"
  
  # Mount ActionCable server
  mount ActionCable.server => '/cable'
end
