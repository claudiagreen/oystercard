class Oystercard
  DEFAULT_BALANCE = 5
  MAXIMUM = 90
  MINIMUM = 1
  MINIMUM_FARE = 2

  attr_reader :balance, :entry_station

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
  end

  def top_up(amount)
    raise "cannot exceed maximum amount £#{MAXIMUM}" if @balance + amount > 90
    @balance += amount
  end

  def in_journey?
    !!@entry_station #!= nil
  end

  def touch_in(entry_station)
    raise 'insufficient funds.' if @balance < MINIMUM
    @entry_station = entry_station

  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
    # in_journey?
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
