require './config/environment'

use Rack::MethodOverride
run ApplicationController
use OrdersController
use ItemsController
use UsersController
