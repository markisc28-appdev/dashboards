Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", {:controller => "exra", :action => "home"})
  get("/forex", {:controller => "exra", :action => "get_rates"})
  get("forex/:firstrate", {:controller => "exra", :action => "exchange_rates"})
  get("forex/:firstrate/:secondrate", {:controller => "exra", :action => "exchange"})
end
