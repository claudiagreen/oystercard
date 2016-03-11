require 'journeylog'
require 'journey'


describe JourneyLog do

  subject(:journeylog){described_class.new(journey_class)}
  let(:journey){ double :journey }
  let(:station){ double :station }
  let(:journey_class){double :journey_class, new: journey}

  describe '#start' do
    it 'starts a journey' do
      expect(journey_class).to receive(:new)
      journeylog.start(station)
    end
  end

  describe '#finish' do
    it 'finishes a journey' do
      journeylog.start(station)
      journeylog.finish(station)
      expect(journeylog).to be_a(Journey)
    end
  end



end
