module Battle
  class Scene
    module ZVBattleLogScene
      # Battle log for this battle
      # @return [ZVBattleLog::LogBook]
      attr_reader :zv_log

      def initialize(...)
        super
        @zv_log = ZVBattleLog::LogBook.new
      end

      def display_message(message, start = 1, *choices, **_kwargs, &_block)
        @zv_display_message_logged = true
        @zv_log << ZVBattleLog::MessageLogEntry.new(message)
        choice_index = super
        @zv_log << ZVBattleLog::MessageLogEntry.new(choices[choice_index]) if choice_index
        return choice_index
      ensure
        @zv_display_message_logged = false
      end
    end
    prepend ZVBattleLogScene
  end
end
