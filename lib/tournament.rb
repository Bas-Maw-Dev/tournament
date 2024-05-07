# frozen_string_literal: true

class Tournament
  def initialize
    @teams = Hash.new { |h, k| h[k] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }
  end

  def tally(standings)
    header = <<~HEADER
      Team                           | MP |  W |  D |  L |  P
    HEADER
    return header unless standings.length > 20

    @standings = standings.split(';')
    @teams[@standings[0]] ||= { mp: 0, w: 0, d: 0, l: 0, p: 0 }
    @teams[@standings[1]] ||= { mp: 0, w: 0, d: 0, l: 0, p: 0 }
    sort_function(@standings)
    header + make_table
  end
end

def sort_function(standings)
  team_one = standings[0]
  team_two = standings[1]
  result = standings[2].strip

  update_results(team_one, result)

  case result
  when 'win'
    update_results(team_two, 'loss')
  when 'loss'
    update_results(team_two, 'win')
  when 'draw'
    update_results(team_two, 'draw')
  else
    raise 'Incorrect result entered'
  end
end

def update_results(team, result)
  case result
  when 'win'
    @teams[team][:w] += 1
    @teams[team][:mp] += 1
    @teams[team][:p] += 3
  when 'loss'
    @teams[team][:l] += 1
    @teams[team][:mp] += 1
  else
    raise 'Team or result incorrect format'
  end
end

def make_table
  table = ''.dup
  @teams.each do |team, stats|
    table <<= "#{team.ljust(31)}| #{stats[:mp].to_s.rjust(2)} | #{stats[:w].to_s.rjust(2)} | #{stats[:d].to_s.rjust(2)} | #{stats[:l].to_s.rjust(2)} | #{stats[:p].to_s.rjust(2)}\n"
  end
  table
end
