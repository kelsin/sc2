class Character < ActiveRecord::Base
  has_many :videos
  has_many :matches

  def bnet_name
    "#{name}##{code}"
  end

  def games
    self.wins + self.losses
  end

  def ratio
    (self.wins.to_f / self.games.to_f * 100.0).round
  end

  def load
    raise "Need bnet profile url to load from sc2ranks" if self.bnet_profile_url.nil?
    sc2ranks = Sc2ranks.new('sc2.kelsin.net')
    char = sc2ranks.character(self.bnet_profile_url)

    self.region = char.region
    self.name = char.name
    self.bnet_id = char.bnet_id

    self.portrait_id = char.portrait.icon_id
    self.portrait_row = char.portrait.row
    self.portrait_col = char.portrait.column

    team = char.team(1)

    self.race = team.fav_race
    self.random = team.is_random?

    self.division = team.division
    self.rank = team.division_rank
    self.region_rank = team.region_rank
    self.world_rank = team.world_rank

    self.league = team.league
    self.points = team.points
    self.wins = team.wins
    self.losses = team.losses

    self.save
  end
end
