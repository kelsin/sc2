class Character < ActiveRecord::Base
  def bnet_name
    "#{name}##{code}"
  end

  def games
    self.wins + self.losses
  end

  def ratio
    (self.wins.to_f / self.games.to_f).round 2
  end

  def league
    read_attribute(:league).capitalize
  end

  def load
    raise "Need name, code and region to load from sc2ranks" if self.code.nil? and self.region.nil? and self.name.nil?

    sc2ranks = SC2Ranks::API.new('sc2.kelsin.net')
    c = sc2ranks.get_team_info(self.name, self.code, self.region)

    self.bnet_id = c.bnet_id

    self.portrait_id = c.portrait['icon_id']
    self.portrait_row = c.portrait['row']
    self.portrait_col = c.portrait['column']

    t = c.teams.find { |team| team['bracket'] == 1 }

    self.race = t['fav_race']
    self.random = t['is_random']

    self.division = t['division']
    self.rank = t['division_rank']
    self.region_rank = t['region_rank']
    self.world_rank = t['world_rank']

    self.league = t['league']
    self.points = t['points']
    self.wins = t['wins']
    self.losses = t['losses']

    self.save
  end
end
