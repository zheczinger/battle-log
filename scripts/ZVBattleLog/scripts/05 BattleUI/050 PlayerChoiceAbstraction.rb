module BattleUI
  module PlayerChoiceAbstraction
    module ZVBattleLogPlayerChoiceAbstraction
      private

      # Set the choice as wanting to view the battle log
      # @return [Boolean] if the operation was a success
      def zv_choice_history
        @result = :zv_history
        return true
      end
    end
    prepend ZVBattleLogPlayerChoiceAbstraction
  end
end
