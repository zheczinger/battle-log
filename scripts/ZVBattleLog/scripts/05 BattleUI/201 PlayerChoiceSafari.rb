module BattleUI
  class PlayerChoiceSafari
    module ZVBattleLogPlayerChoiceSafari
      private

      def validate(...)
        return super unless zv_trigger_choice_history?

        bounce_button
        zv_choice_history
        play_decision_se
      end
    end
    prepend ZVBattleLogPlayerChoiceSafari
  end
end
