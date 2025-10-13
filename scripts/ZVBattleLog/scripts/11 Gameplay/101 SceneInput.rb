module ZVBattleLog
  module SceneInput
    def update_inputs
      if Input.trigger?(:A)
        action_a
      elsif Input.trigger?(:B)
        action_b
      elsif index_changed(:@turn, :LEFT, :RIGHT, latest_turn, earliest_turn)
        update_turn
      elsif index_changed(:@entry_index, :UP, :DOWN, max_entry_index)
        update_entries
      elsif Mouse.wheel != 0
        @entry_index = (@entry_index - Mouse.wheel) % (max_entry_index + 1)
        Mouse.wheel = 0
        update_entries
      end
    end

    def update_mouse(moved)
      update_mouse_ctrl_buttons(@base_ui.ctrl, mouse_actions)
    end

    private

    def show_full_message
      @mode = :info
      @full_message.show
    end

    def hide_full_message
      @mode = :summary
      @full_message.hide
    end

    def update_entries
      @scroll_bar.max_index = max_entry_index
      @scroll_bar.index = @entry_index
      @log_page.update_log_messages
      @full_message.update_message
    end

    def update_turn
      @turn_window.update_turn
      @entry_index = 0
      update_entries
    end

    # Action performed when the player presses the A button
    def action_a
      play_decision_se

      case @mode
      when :summary then show_full_message
      when :info then hide_full_message
      end
    end

    # Action performed when the player presses the B button
    def action_b
      play_cancel_se

      case @mode
      when :summary then self.running = false
      when :info then hide_full_message
      end
    end

    # Action performed when the player presses the [<] button with the mouse
    def mouse_left_arrow
      play_decision_se
      @turn -= 1
      @turn = latest_turn if @turn < earliest_turn
      update_turn
    end

    # Action performed when the player presses the [>] button with the mouse
    def mouse_right_arrow
      play_decision_se
      @turn += 1
      @turn = earliest_turn if @turn > latest_turn
      update_turn
    end

    def mouse_actions = %i[action_a mouse_left_arrow mouse_right_arrow action_b]
  end
end
