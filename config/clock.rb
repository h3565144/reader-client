require 'clockwork'
module Clockwork
  every(1.hour, 'synchronize with server') { `rake synchronize:all` }
end
