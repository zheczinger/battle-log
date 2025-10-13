module Configs
  module Project
    class ZVBattleLog
      HP_MEASUREMENTS = %i[percent exact both]

      # ID of the plugin's CSV file
      # @return [Integer]
      attr_accessor :csv_id

      # Name of the folder in `graphics/interface/` where the battle log's UI assets are located
      # @return [String]
      attr_accessor :prefix

      # How health lost or restored is reported in the battle log
      #   :percent = Percentage of max health
      #   :points  = Exact HP quantity
      #   :both    = Both percentage and exact HP quantity
      # @return [Symbol]
      attr_reader :hp_measurement

      # Button to press during the player choice menu to open the battle log
      # @return [Symbol]
      attr_reader :open_button

      # Color ID of the supplemental messages added by the plugin
      # @return [Integer]
      attr_accessor :bonus_message_color

      # Set how health lost or restored is reported in the battle log
      # @param value [String, Symbol]
      #   percent = Percentage of max health
      #   points  = Exact HP quantity
      #   both    = Both percentage and exact HP quantity
      def hp_measurement=(value)
        v = value.to_sym
        raise 'Invalid hp_measurement choice' unless HP_MEASUREMENTS.include?(v)

        @hp_measurement = v
      end

      # Set name of button to press during the player choice menu to open the battle log
      # @param value [String, Symbol]
      def open_button=(value)
        @open_button = value.to_sym
      end

      # Relative path to a graphics file for this plugin starting from graphics/interface/
      # @param filename [String]
      # @return [String]
      def interface_path(filename)
        return File.join(prefix, filename)
      end

      def initialize
        self.csv_id = 93_207
        self.prefix = 'zv-battle-log'
        self.hp_measurement = :percent
        self.open_button = :L
        self.bonus_message_color = 1
      end
    end
  end

  # @!method self.zv_battle_log
  # @return [Configs::Project::ZVBattleLog]
  register(:zv_battle_log, File.join('plugins', 'zv_battle_log_config'), :json, false, Project::ZVBattleLog)
end
