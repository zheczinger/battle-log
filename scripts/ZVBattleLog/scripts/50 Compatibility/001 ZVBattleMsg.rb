# zhec's Modernized Battle Messages
# https://github.com/zheczinger/psdk-modernized-battle-messages
module Battle
  class Scene
    module ZVBattleLogSupportingZVBattleMsg
      def zv_log_message(message)
        @zv_log << ZVBattleLog::MessageLogEntry.new(message)
      end

      private

      def zv_display_message_logged?
        return @zv_display_message_logged || false
      end
    end
    prepend ZVBattleLogSupportingZVBattleMsg
  end
end
