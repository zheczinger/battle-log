module Battle
  class Scene
    module ZVBattleLogSceneChoice
      private

      def player_action_choice_internal(choice, *_args, **_kwargs)
        return zv_react_history if choice == :zv_history

        return super
      end

      # Method that shows the battle log
      def zv_react_history
        visual.zv_show_history_choice
        @next_update = :player_action_choice
      end
    end
    prepend ZVBattleLogSceneChoice
  end
end
