# frozen_string_literal: true

require_relative '../lib/tournament'

RSpec.describe Tournament do
  describe 'A tournament exists' do
    tournament = described_class.new
    it 'returns a header for the tournament' do
      input = <<~INPUT

      INPUT

      expected = <<~TALLY
        Team                           | MP |  W |  D |  L |  P
      TALLY

      expect(tournament.tally(input)).to eq(expected)
    end
  end

  describe 'Tournaments are recorded correctly' do
    tournament = described_class.new
    # rubocop:disable RSpec/ExampleLength
    it 'wins are worth 3 points' do 
      input = <<~INPUT
        Allegoric Alaskans;Blithering Badgers;win
      INPUT
      expected = <<~TALLY
        Team                           | MP |  W |  D |  L |  P
        Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
        Blithering Badgers             |  1 |  0 |  0 |  1 |  0
      TALLY
      expect(tournament.tally(input)).to eq(expected)
    end

  end
end
