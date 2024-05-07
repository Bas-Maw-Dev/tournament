# frozen_string_literal: true

require_relative '../lib/tournament'

RSpec.describe Tournament do
  subject(:tournament) { described_class.new }

  describe 'tournamen results' do
    it 'returns a header for the tournament' do
      input = <<~INPUT
      INPUT

      expected = <<~TALLY
        Team                           | MP |  W |  D |  L |  P
      TALLY

      expect(tournament.tally(input)).to eq(expected)
    end

    it 'records wins correctly' do
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

    it 'records different team wins correctly' do
      input = <<~INPUT
        Blithering Badgers;Allegoric Alaskans;win
      INPUT

      expected = <<~TALLY
        Team                           | MP |  W |  D |  L |  P
        Blithering Badgers             |  1 |  1 |  0 |  0 |  3
        Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0
      TALLY

      expect(tournament.tally(input)).to eq(expected)
    end
  end
end