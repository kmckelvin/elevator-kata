module Elevator
  class InstructionResolver
    def next_instruction(shaft_state)
      if shaft_state.going_up?
        next_instruction = shaft_state.instructions.select { |i|
          i.above_or_on_current_floor?(shaft_state)
        }.min_by { |i|
          i.absolute_distance(shaft_state)
        }
      elsif shaft_state.going_down? && next_instruction.nil?
        next_instruction = shaft_state.instructions.select { |i|
          i.below_or_on_current_floor?(shaft_state)
        }.min_by { |i|
          i.absolute_distance(shaft_state)
        }
      elsif shaft_state.stopped?
        next_instruction = shaft_state.instructions.min_by { |i|
          i.absolute_distance(shaft_state)
        }
      end

      next_instruction || Instructions::Stop.new
    end
  end
end
