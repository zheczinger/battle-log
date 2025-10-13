module GamePlay
  class << self
    module ZVBattleLogGamePlay
      # Get the battle log scene
      # @return [Class<ZVBattleLog::Scene>]
      attr_accessor :zv_battle_history_class

      # Open the battle log UI
      # @param logbook [ZVBattleLog::LogBook]
      def zv_open_battle_history(logbook)
        current_scene.call_scene(zv_battle_history_class, logbook)
      end
    end
    prepend ZVBattleLogGamePlay
  end
end
