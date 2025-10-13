module ZVBattleLogUI
  # UI element that show the full contents of a log message
  class FullMessage < UI::SpriteStack
    include BattleUI::HideShow

    # @param viewport [Viewport]
    # @param scene [ZVBattleLog::Scene]
    def initialize(viewport, scene)
      super(viewport)
      create_sprites
      create_text
      @scene = scene
      @animation_handler = Yuki::Animation::Handler.new
      self.visible = false
      update_message
    end

    # Update the current log message to show
    def update_message
      visibility = visible
      log_entry = @scene.data[@scene.turn][@scene.entry_index]
      self.data = log_entry
      @text.load_color(log_entry&.message_color || color_id)
      self.visible = visibility
    end

    # Update the visibility of the log message
    def update_visibility
      animation_handler.update
    end

    private

    # For the BattleUI::HideShow module
    # @return [Yuki::Animation::Handler]
    attr_reader :animation_handler

    # Create background or other sprites (if needed for the full message)
    def create_sprites
      add_background(background_filename)
      add_sprite(*box_position, box_filename)
    end

    # Create drawable text for the full message
    def create_text
      @text = with_font(font_id) do
        add_text(*text_position, *text_dimensions, :message, color: color_id, type: UI::SymMultilineText)
      end
    end

    def box_filename = Configs.zv_battle_log.interface_path('info_box')
    def box_position = [0, 56]
    def background_filename = Configs.zv_battle_log.interface_path('info_background')

    def text_position
      x, y = *box_position
      return [x + 13, y + 18]
    end

    def text_dimensions = [284, 16]
    def color_id = 0
    def font_id = 0
  end
end
