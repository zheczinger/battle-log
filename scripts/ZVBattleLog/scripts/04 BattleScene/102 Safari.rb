module Battle
  class Safari
    module ZVBattleLogSafari
      private

      def player_action_choice_internal(choice, *args, **kwargs)
        return zv_react_history if choice == :zv_history

        return super
      end
    end
    prepend ZVBattleLogSafari
  end
end
