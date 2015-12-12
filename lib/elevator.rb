module Elevator
  module Instructions
  end
end

require_relative 'elevator/actions/abstract_move'
require_relative 'elevator/actions/move_down'
require_relative 'elevator/actions/move_up'
require_relative 'elevator/actions/stop_action'

require_relative 'elevator/instructions/pickup_request'
require_relative 'elevator/instructions/stop'

require_relative 'elevator/elevator'
require_relative 'elevator/floor'
require_relative 'elevator/instruction_resolver'
require_relative 'elevator/run_loop'
require_relative 'elevator/shaft_state'
