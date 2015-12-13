require 'delegate'

module Elevator
  class FloorNavigator
    def initialize(floors)
      @floors = floors
    end

    def floor_above(floor)
      next_floor_index = floors.index(floor) + 1
      floors[next_floor_index]
    end

    def floor_below(floor)
      next_floor_index = floors.index(floor) - 1
      floors[next_floor_index]
    end

    private
    attr_reader :floors
  end
end
