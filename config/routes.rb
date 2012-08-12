PagesApiApp::Application.routes.draw do
  namespace :api do
    resources :pages do
      member do
        post 'publish'
        # FUTURE: post 'unpublish' 
        match 'total_words'
      end
      
      collection do
        match 'published'
        match 'unpublished'
      end
    end
  end
end
