module ZVBattleLog
  class LogEntryBase
    # Message to display to the player in the log
    # @return [String]
    def message
      raise 'This method should be implemented in the subclass'
    end

    # Text color ID to use for the whole message
    # @return [Integer]
    def message_color
      return 0
    end
  end
end
