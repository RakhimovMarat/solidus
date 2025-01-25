Rails.application.routes.draw do
  mount SolidusAdmin::Engine, at: "/admin", constraints: ->(req) {
    req.cookies["solidus_admin"] != "false" &&
    req.params["solidus_admin"] != "false"
  }
  mount SolidusPaypalCommercePlatform::Engine, at: "/solidus_paypal_commerce_platform"
  scope(path: "/") { draw :storefront }
  mount Spree::Core::Engine, at: "/"
  get "up" => "rails/health#show", as: :rails_health_check
end
