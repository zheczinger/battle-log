module ZVBattleLog
  module SceneGraphics
    def create_graphics
      super
      create_base_ui
      create_log_ui
      create_scroll_bar
      create_full_message
      create_frame
      Graphics.sort_z
    end

    def update_graphics
      @base_ui.update_background_animation
      @log_page.update_icon_visibilities
      @full_message.update_visibility
    end

    private

    def create_base_ui
      @base_ui = UI::GenericBase.new(@viewport, button_texts, button_keys)
    end

    def create_log_ui
      @turn_window = ZVBattleLogUI::TurnWindow.new(@viewport, self)
      @turn_window.update_turn
      @log_page = ZVBattleLogUI::LogPage.new(@viewport, self)
      @log_page.update_log_messages
    end

    def create_scroll_bar
      config = Configs.zv_battle_log
      @scroll_bar = ZVBattleLogUI::ScrollBar.new(
        @viewport, [310, 40],
        height: 160,
        background: config.interface_path('scroll_bar'),
        button: config.interface_path('scroll_cursor'),
      )
      @scroll_bar.max_index = max_entry_index
    end

    def create_full_message
      @full_message = ZVBattleLogUI::FullMessage.new(@viewport, self)
      @full_message.hide
    end

    def create_frame
      config = Configs.zv_battle_log
      filename = config.interface_path("frame_#{$options.language}")
      filename = config.interface_path('frame_en') unless RPG::Cache.interface_exist?(filename)
      @frame = Sprite.new(@viewport)
      @frame.set_bitmap(filename, :interface).set_z(32)
    end

    def button_texts
      base_text_id = 2
      return Array.new(4) { |i| text_get(Configs.zv_battle_log.csv_id, base_text_id + i) }
    end

    def button_keys = %i[A LEFT RIGHT B]
  end
end
