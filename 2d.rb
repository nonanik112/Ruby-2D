require 'ruby2d'

set width: 800
set height: 600

SPEED = 4
background = Image.new("background.png", y: -920)
nonanik = Sprite.new(
    "nona.png",
    width: 256,
  height: 256,
  clip_width: 200,
  y: 194,
  time: 400,
  animations: {
    walk: 1..2,
    climb: 3..4,
    cheer: 5..6
  }
)



on :key_held do |event|
   case event.key
    when 'left'
      nonanik.play animation: :walk, loop: true, flip: :horizontal
      if nonanik.x > 0
        nonanik.x -= SPEED
      else
        if background.x < 0 
        background.x += SPEED
        end
      end
    when 'right'
      nonanik.play animation: :walk, loop: true
      if nonanik.x < (Window.width - nonanik.width)
        nonanik.x += SPEED
      else
        if (background.x - Window.width) > -background.width
        background.x -= SPEED
        end
      end
   end
end
on :key_up do 
  nonanik.stop
end


show
