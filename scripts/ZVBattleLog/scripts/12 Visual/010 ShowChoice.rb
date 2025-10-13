module Battle
  class Visual
    module ZVBattleLogShowChoice
      # Method that shows the battle log
      def zv_show_history_choice
        GamePlay.zv_open_battle_history(@scene.zv_log)
      end
    end
    prepend ZVBattleLogShowChoice
  end
end
