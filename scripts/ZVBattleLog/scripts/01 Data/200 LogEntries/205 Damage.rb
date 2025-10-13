module ZVBattleLog
  # Record damage being taken
  class DamageLogEntry < LogEntryBase
    include BattlerLogEntryMixin

    # Create a log entry for damage taken
    # @param battler [PFM::PokemonBattler] Damaged battler
    # @param hp_damage [Integer] Amount of damage
    def initialize(battler, hp_damage)
      super(battler)
      @hp_change = hp_damage
      @max_hp = battler.max_hp
    end

    private

    # @return [Hash{Symbol => Integer}]
    def text_ids
      return { percent: 16, points: 19, both: 22 }
    end

    # Base text ID (before considering which side the battler is on)
    # @return [Integer]
    def base_text_id
      return text_ids[Configs.zv_battle_log.hp_measurement]
    end

    # Text replacements to make other than the battler's name
    # @return [Hash{String => String}]
    def text_replacecents
      hp_rate = (@hp_change.to_f / @max_hp * 100).round
      return { PFM::Text::NUM3[0] => hp_rate.to_s, PFM::Text::NUM3[1] => @hp_change.to_s }
    end
  end
end
