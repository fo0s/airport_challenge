# Weekend 1 Aiport challenge... yay!

# Goals
# 1. Have planes land at the Airport
# => Create an airport class **Done
# => Create a plane class. **Done
# => Get them to play nicely together
# => Make use of an array to keep track of whats going on **Done

# 2. Have planes depart the Airport
# => Have plane remove an instance from the airport array
# => Add confirmation

# 3. Prevent bad weather takeoff
# => Make a weather method**Done
# => Use the method as a argument**Done
# =>

# 4. Prevent bad weather landing
# => A reflection of the last condition

# 5. Prevent landing when airport is full
# => How full is "full"?**Done
# => Maybe add a randomiser
# =>

# 6. Throw health and safety the finger and overwrite
#    all common sense. OR Overwrite airport full feature
# => Set default full value, otherwise add a new one.

# 7. Beware the dreaded 'edge case'
# => Safeguard this by having grounded and flying states
# => Assign planes airport statuses (stati? statusseseses?)
# =>

# 8. Make use of test doubles... they are your friend
# =>**Sort of done

# 9. Bonus brownie points
# => Able to handle multiple planes at once... like a proper airport
# => Keep it simple stupid!
# => Be awesome
# !!!!!!!!!!IMPORTANT!!!!!!! REMEMBER TO UN-COMMENT SPEC_HELPER!!!!!!!!
require 'weather_reporter'

class Airport
  def initialize(capacity, weather_reporter)
    @capacity = capacity
    @weather_reporter = weather_reporter
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane; Airport full' if full?
    raise 'Cannot land plane; Weather is stormy!' if stormy?

    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off plane; Weather is stormy!' if stormy?
    raise 'Cannot take off plane; Plane not at this airport.' unless at_airport?(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather_reporter.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end
