# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tours#index'
  resources :cities, param: :sputnik_id, only: %i[index]
  resources :tours, param: :sputnik_id, only: %i[index show]
end
