module ZVBattleLog
  # Record an ability splashed on screen
  class AbilityLogEntry < LogEntryBase
    include BattlerLogEntryMixin

    # Create a new log entry for a shown ability
    # @param battler [PFM::PokemonBattler] User of the shown ability
    def initialize(battler)
      super
      @ability_symbol = battler.battle_ability_db_symbol
    end

    private

    # Base text ID (before considering which side the battler is on)
    # @return [Integer]
    def base_text_id
      return 7
    end

    # Text replacements to make other than the battler's name
    # @return [Hash{String => String}]
    def text_replacecents
      return { PFM::Text::ABILITY[1] => data_ability(@ability_symbol).name }
    end
  end
end
