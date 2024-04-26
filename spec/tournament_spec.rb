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
    tournament = Tournament.new
    it 'returns a header for the tournament' do
      input = <<~INPUT

      INPUT

      expected = <<~TALLY
        Team                           | MP |  W |  D |  L |  P\n
      TALLY

      expect(tournament.tally(input)).to eq(expected)
    end
  end
end
