module CharactersHelper
  def link_to_sc2ranks(character)
    link_to character.name, "http://sc2ranks.com/char/#{character.region}/#{character.bnet_id}/#{character.name}"
  end
end
