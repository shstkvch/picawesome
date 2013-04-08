Picawesome::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  # See how all your routes lay out with "rake routes"

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }

  post ':pic/vote'   => 'pics#vote'

  get ':stream'      => 'pics#stream', as: :stream, constraints: { stream: /[a-z]\w+/ }
  get ':stream/:pic' => 'pics#show',   as: :pic,    constraints: { stream: /[a-z]\w+/, pic: /\d+/ }

  get ':pic'         => 'redirects#pic', constraints: { pic: /\d+/}

  root to: 'pics#all'
end
