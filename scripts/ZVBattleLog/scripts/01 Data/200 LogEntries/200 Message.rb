module ZVBattleLog
  # Record a plain message
  class MessageLogEntry < LogEntryBase
    # Create a new log entry with a plain message
    # @param msg [String]
    def initialize(msg)
      super()
      @message = msg
    end

    # Message to display to the player in the log
    # @return [String]
    def message
      return @message
    end
  end
end
