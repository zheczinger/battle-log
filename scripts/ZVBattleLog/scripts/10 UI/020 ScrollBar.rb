module ZVBattleLogUI
  class ScrollBar < UI::SpriteStack
    # Current index of the scrollbar
    # @return [Integer]
    attr_reader :index

    # Number of possible indexes
    # @return [Integer]
    attr_reader :max_index

    # Create a new scrollbar
    # @param viewport [Viewport]
    # @param position [Array<Integer>] Top-left position for the scrollbar
    # @param height [Integer] Number of pixel the scrollbar use to move the button
    # @param background [String] Filename of the scrollbar's background
    # @param button [String] Filename of the scrollbar's button
    # @param button_offset [Array<Integer>] Offset of the button from the top of the scrollbar
    def initialize(viewport, position, height:, background:, button:, button_offset: [-1, 0])
      super(viewport, *position)
      @index = 0
      @max_index = 1
      @height = height
      @button_offset = button_offset
      init_sprites(background, button)
    end

    # Set the current index of the scrollbar
    # @param value [Integer] the new index
    def index=(value)
      @index = value.clamp(0, @max_index)
      @button.y = (y + @button_offset[1]) + @height * @index / @max_index
    end

    # Set the number of possible index
    # @param value [Integer] the new max index
    def max_index=(value)
      @max_index = value <= 0 ? 1 : value
      self.index = 0
    end

    private

    # Create the sprites
    # @param background [String] Filename of the background sprite
    # @param button [String] Filename of the button sprite
    def init_sprites(background, button)
      add_background(background)
      @button = add_sprite(@button_offset[0], 0, button)
    end
  end
end
