Rails.application.routes.draw do
  root to: 'ip#all'

  get 'all', to: 'ip#all'
  get 'ip', to: 'ip#ip'
  get 'host', to: 'ip#host'
  get 'headers', to: 'ip#headers'

  get 'man', to: 'static#doc'
end
