module Battle
  class Visual
    module ZVBattleLogShowStuff
      def show_hp_animations(targets, hps, *_args, **_kwargs, &_block)
        targets.each_with_index do |target, index|
          hp = hps[index]
          next unless hp

          klass = hp <= 0 ? ZVBattleLog::DamageLogEntry : ZVBattleLog::HealLogEntry
          @scene.zv_log << klass.new(target, hp.abs)
        end

        return super
      end

      def show_ability(target, *args, **kwargs)
        return unless super

        @scene.zv_log << ZVBattleLog::AbilityLogEntry.new(target)
      end

      def show_item(target, *args, **kwargs)
        return unless super

        @scene.zv_log << ZVBattleLog::ItemLogEntry.new(target)
      end
    end
    prepend ZVBattleLogShowStuff
  end
end
