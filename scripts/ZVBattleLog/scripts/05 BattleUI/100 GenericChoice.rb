module BattleUI
  class GenericChoice
    module ZVBattleLogGenericChoice
      # Check if the player is validating their choice
      def validating?
        return true if Input.trigger?(Configs.zv_battle_log.open_button)

        return super
      end
    end
    prepend ZVBattleLogGenericChoice
  end
end
