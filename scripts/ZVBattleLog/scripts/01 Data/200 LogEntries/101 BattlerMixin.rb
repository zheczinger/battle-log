module ZVBattleLog
  # Mixin for a battle log entry involving a battler
  module BattlerLogEntryMixin
    # Create a new log entry involving a battler
    # @param battler [PFM::PokemonBattler]
    def initialize(battler)
      @battler_name = battler.given_name
      @battler_bank = battler.bank
    end

    # Message to display to the player in the log
    # @return [String]
    def message
      text_vars = { PFM::Text::PKNICK[1] => @battler_name }
      text_vars = text_vars.merge(text_replacecents)
      return parse_text(Configs.zv_battle_log.csv_id, text_id, text_vars)
    end

    # Text color ID to use for the whole message
    # @return [Integer]
    def message_color
      return Configs.zv_battle_log.bonus_message_color
    end

    private

    # Base text ID (before considering which side the battler is on)
    # @return [Integer]
    def base_text_id
      return 'This method must be implemented in the subclass'
    end

    # Final text ID (after considering the battler's side)
    # @return [Integer]
    def text_id
      id = base_text_id
      id += ($game_temp.trainer_battle ? 2 : 1) if @battler_bank != 0
      return id
    end

    # Text replacements to make other than the battler's name
    # @return [Hash{String => String}]
    def text_replacecents
      return {}
    end
  end
end
