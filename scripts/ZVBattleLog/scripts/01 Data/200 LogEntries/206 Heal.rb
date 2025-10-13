module ZVBattleLog
  # Record health being restored
  class HealLogEntry < DamageLogEntry
    private

    # @return [Hash{Symbol => Integer}]
    def text_ids
      return { percent: 25, points: 28, both: 31 }
    end
  end
end
