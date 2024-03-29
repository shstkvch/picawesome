Picawesome::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  # See how all your routes lay out with "rake routes"

  root to: 'pics#all'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }
  ActiveAdmin.routes(self)

  get 'shortlink'           => redirect('/')
  get 'shortlink/:short'    => 'redirects#shortlink'

  post ':pic/vote'          => 'pics#vote',                  constraints: { pic: /\d+/}

  get ':stream'             => 'pics#stream',   as: :stream, constraints: { stream: /[a-zA-Z]\w+/ }
  get ':stream/:pic'        => 'pics#show',                  constraints: { stream: /[a-zA-Z]\w+/, pic: /\d+/ }
  get ':stream/:pic/:title' => 'pics#show',                  constraints: { stream: /[a-zA-Z]\w+/, pic: /\d+/ }

  get ':pic'                => 'redirects#pic', as: :pic,    constraints: { pic: /\d+/}
end
