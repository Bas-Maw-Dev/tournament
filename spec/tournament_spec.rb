# frozen_string_literal: true

class Tournament
  def initialize; end

  def tally(standings)
    header = "Team                           | MP |  W |  D |  L |  P\n"
    header + standings
  end
end

RSpec.describe Tournament do
  describe 'A tournamnet exists' do
    tournament = described_class.new
    it 'returns a header for the tournament' do
      input = <<~INPUT

      INPUT

      expected = <<~TALLY
        Team                           | MP |  W |  D |  L |  P\n
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
        Team                           | MP |  W |  D |  L |  P\n
        Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3\n
        Blithering Badgers             |  1 |  0 |  0 |  1 |  3\n
      TALLY
      expect(tournament.tally(input)).to eq(expected)
    end

  end
end
