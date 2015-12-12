module Elevator
  class RunLoop
    def tick(shaft_state)
      next_shaft_state = shaft_state.dup
      next_instruction = InstructionResolver.new.next_instruction(next_shaft_state)
      next_step = next_instruction.next_step(next_shaft_state)
      next_step.apply(next_shaft_state)
      remove_fulfilled_instructions(shaft_state)
      next_shaft_state
    end

    private
    def remove_fulfilled_instructions(shaft_state)
      shaft_state.instructions.reject! { |i| i.is_fulfilled?(shaft_state) }
    end
  end
end
