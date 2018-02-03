# frozen_string_literal: true

root                             to: 'page#home'
get  '/home'                   , to: 'page#home'
post '/auth/:provider/callback', to: 'session#create'
get  '/auth/:provider/callback', to: 'session#create'
