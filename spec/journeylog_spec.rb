require 'journeylog'
require 'journey'


describe JourneyLog do

  subject(:journeylog) {described_class.new(journey_class)}
  let(:journey_class){double :journey_class, new: journey}
  let(:journey){ double :journey }
  let(:entry_station){double(:station)}
  let(:exit_station){double(:station)}

  it {is_expected.to respond_to(:start).with(1).argument}
  it {is_expected.to respond_to(:finish).with(1).argument}

  describe "#start" do
    it "starts a new journey" do
      expect(journey_class).to receive(:new).with(entry_station)
      journeylog.start(entry_station)
    end
  end

  describe "#finish" do
    it "adds an exit station to the Journey" do
      journeylog.start(entry_station)
      journeylog.finish(exit_station)
      expect(journeylog).to receive(:complete?).and_return true
    end
  end

end
