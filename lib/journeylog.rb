require_relative 'journey'

class JourneyLog

  def initialize(journey_class = Journey)
     @journey_class = journey_class
    #  @journeys = []
   end

  def start(entry_station)
    @current_journey = @journey_class.new(entry_station)
  end

  def finish(exit_station)
    @current_journey = @journey_class.new(exit_station)
    # @journeys << @current_journey
  end

  private

  def current_journey
    @current_journey == nil ? @current_journey = @journey_class.new : @current_journey
  end

end
