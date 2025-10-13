module ZVBattleLogUI
  # Displayed page of (truncated) log entries
  class LogPage < UI::SpriteStack
    POSITION = [3, 36]

    # Create a log page UI
    # @param viewport [Viewport]
    # @param scene [ZVBattleLog::Scene]
    def initialize(viewport, scene)
      super(viewport, *position)
      create_background
      @scene = scene
      @truncated_messages = max_messages.times.map { |i| LogMessage.new(viewport, i) }
      @lowest_shown_index = 0
    end

    # Update the visibility of sprites on each log message
    def update_icon_visibilities
      @truncated_messages.each(&:update_icon_visibility)
    end

    # Update the displayed list
    def update_log_messages
      log_entries = @scene.data[@scene.turn]
      update_lowest_shown_index(@scene.entry_index, log_entries)

      @truncated_messages.each_with_index do |message, i|
        i += @lowest_shown_index
        log_entry = log_entries[i]

        message.visible = !log_entry.nil?
        message.selected = i == @scene.entry_index
        message.text = log_entry
        message.update_icon_visibility if message.visible
      end
    end

    private

    # Update the lowest index shown in the log page based on the entry index
    # @param entry_index [Integer]
    # @param entries [Array<ZVBattleLog::LogEntryBase>]
    def update_lowest_shown_index(entry_index, entries)
      span_diff = max_messages - 1
      prev_span = ->(index) { [index - span_diff, 0].max }
      next_span = ->(index) { [index + span_diff, [0, entries.length - 1].max].min }

      if entries.length <= max_messages
        @lowest_shown_index = 0
      elsif @lowest_shown_index > entry_index
        @lowest_shown_index = [entry_index, prev_span.call(entry_index)].min
      elsif next_span.call(@lowest_shown_index) < entry_index
        @lowest_shown_index = prev_span.call(entry_index)
      end
    end

    def create_background
      add_background(background_filename)
    end

    # Number of (truncated) log messages that can be displayed at a time
    # @return [Integer]
    def max_messages = 10

    # Position of the page
    # @return [Array<Integer>]
    def position = POSITION

    # @return [String]
    def background_filename = Configs.zv_battle_log.interface_path('log_page')
  end
end
