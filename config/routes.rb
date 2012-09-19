Printer::Application.routes.draw do
  root to: "main#index"
  match '/search' => 'main#search', as: :search
  match '/:code' => 'main#show', as: :code
end
