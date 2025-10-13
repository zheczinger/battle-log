module ZVBattleLogUI
  # UI element that displays the turn number
  class TurnWindow < UI::SpriteStack
    # @param viewport [Viewport]
    # @param scene [ZVBattleLog::Scene]
    def initialize(viewport, scene)
      super(viewport, *position)
      create_background
      create_text
      @scene = scene
    end

    # Update the current turn number in the window
    def update_turn
      @text.text = parse_text(
        Configs.zv_battle_log.csv_id, text_id,
        PFM::Text::NUM3[0] => @scene.turn.to_s,
        PFM::Text::NUM3[1] => @scene.latest_turn.to_s
      )
    end

    private

    def create_background
      add_background(background_filename)
    end

    def create_text
      @text = with_font(font_id) do
        add_text(*text_position, *text_dimensions, nil.to_s, _align = 1, color: color_id)
      end
    end

    # @return [Array<Integer>]
    def position = [12, 4]

    # @return [String]
    def background_filename = Configs.zv_battle_log.interface_path('turn')

    # Text ID in the CSV file
    # @return [Integer]
    def text_id = 6

    # @return [Array<Integer>]
    def text_position = [3, 9]

    # @return [Array<Integer>]
    def text_dimensions = [100, 8]

    # @return [Integer]
    def font_id = 0

    # @return [Integer]
    def color_id = 10
  end
end
