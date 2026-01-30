Rails.application.routes.draw do
  root to: 'search#form'

  get "/search", to: "search#form"
  get "/search/results", to: "search#results"
  get "/search/validate", to: "search#validate"

  get "/pages/privacy-policy", to: redirect("https://www.gov.uk/government/publications/privacy-information-education-providers-workforce-including-teachers/privacy-information-education-providers-workforce-including-teachers#using-your-data-to-use-our-websites")
  get "/pages/cookies", to: "pages#cookies_policy"
  get "/pages/accessibility", to: "pages#accessibility"
  get "/pages/terms", to: "pages#terms"
  get "/healthcheck", to: "pages#healthcheck"

  scope via: :all do
    get '/404', to: 'errors#not_found'
    get '/422', to: 'errors#unprocessable_entity'
    get '/429', to: 'errors#too_many_requests'
    get '/500', to: 'errors#internal_server_error'
  end

  resource :cookie_preferences do
    member do
      post "hide"
    end
  end
end
