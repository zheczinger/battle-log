module BattleUI
  class PlayerChoice
    module ZVBattleLogPlayerChoice
      private

      def validate(...)
        return super unless zv_trigger_choice_history?

        bounce_button
        zv_choice_history
        play_decision_se
      end

      # Does the player want to view the battle log?
      # @return [Boolean]
      def zv_trigger_choice_history?
        return Input.trigger?(Configs.zv_battle_log.open_button)
      end
    end
    prepend ZVBattleLogPlayerChoice
  end
end
