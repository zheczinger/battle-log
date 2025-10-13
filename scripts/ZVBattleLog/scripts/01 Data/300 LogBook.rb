module ZVBattleLog
  # Class for saving battle log messages
  class LogBook
    # Enable or disable logging
    # @return [Boolean]
    attr_accessor :enable_logging

    # Create an empty log book
    def initialize
      self.enable_logging = true
      @pages = []
    end

    # Save a log entry
    # @param entry [ZVBattleLog::LogEntryBase]
    def <<(entry)
      return unless enable_logging && $scene.is_a?(Battle::Scene)

      turn = $game_temp.battle_turn
      (@pages[turn] ||= []) << entry
    end

    # Access all log entrys for a specific turn
    # @param turn [Integer]
    # @return [Array<ZVBattleLog::LogEntryBase>]
    def [](turn)
      return @pages[turn] || []
    end
  end
end
