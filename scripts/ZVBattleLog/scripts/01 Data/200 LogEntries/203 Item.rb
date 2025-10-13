module ZVBattleLog
  # Record an item splashed on screen
  class ItemLogEntry < LogEntryBase
    include BattlerLogEntryMixin

    # Create a log entry for a shown item
    # @param battler [PFM::PokemonBattler] User of the shown item
    def initialize(battler)
      super
      @item_symbol = battler.battle_item_db_symbol
    end

    private

    # Base text ID (before considering which side the battler is on)
    # @return [Integer]
    def base_text_id
      return 10
    end

    # Text replacements to make other than the battler's name
    # @return [Hash{String => String}]
    def text_replacecents
      return { PFM::Text::ITEM2[1] => data_item(@item_symbol).name }
    end
  end
end
