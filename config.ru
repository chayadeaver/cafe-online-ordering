require './config/environment'

use Rack::MethodOverride
run ApplicationController
use OrdersController
use ItemsController
use UsersController
use SessionsController

use Rack::Session::Cookie,  :key => 'rack.session',
                            :path => '/',
                            :secret => "fa7d81c2a752c06ac41043adeaca68576c030aa1c5045e3fbba0446d71546100e6fae8761fec7867c86f84fe74aa6a32cbb376dff085a6e062391e5b8c00eb70"
