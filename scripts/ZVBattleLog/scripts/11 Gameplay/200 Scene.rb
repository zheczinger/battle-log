module ZVBattleLog
  class Scene < GamePlay::BaseCleanUpdate::FrameBalanced
    include SceneInput
    include SceneGraphics

    # Battle log data
    # @return [ZVBattleLog::LogBook]
    attr_reader :data

    # Selected turn
    # @return [Integer]
    attr_reader :turn

    # Selected entry for that turn
    # @return [Integer]
    attr_reader :entry_index

    # @param data [ZVBattleLog::LogBook]
    def initialize(data)
      super()
      @data        = data
      @turn        = latest_turn
      @entry_index = 0
      @mode        = :summary
      Mouse.wheel  = 0
    end

    # Latest reachable turn in the log
    # @return [Integer]
    def latest_turn
      return $game_temp.battle_turn
    end

    # Earliest reachable turn in the log
    # @return [Integer]
    def earliest_turn
      return 0
    end

    # @return [Integer]
    def max_entry_index
      return [0, data[turn].length - 1].max
    end
  end
end

GamePlay.zv_battle_history_class = ZVBattleLog::Scene
