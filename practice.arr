use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import image as I
import reactors as R

# Store the circle's position
data CircleState:
  | circle-state(circle-x :: Number, circle-y :: Number)
end

# Draw the circle on a white background
fun draw-circle(state :: CircleState) -> I.Image:
  I.place-image(
    I.circle(20, "solid", "purple"),
    state.circle-x,
    state.circle-y,
    I.empty-scene(500, 400))
end
# Move the circle using the arrow keys
fun move-circle(state :: CircleState, key :: String)
    -> CircleState:
  if key == "right":
    circle-state(state.circle-x + 10, state.circle-y)
  else if key == "left":
    circle-state(state.circle-x - 10, state.circle-y)
  else if key == "up":
    circle-state(state.circle-x, state.circle-y - 10)
  else if key == "down":
    circle-state(state.circle-x, state.circle-y + 10)
  else:
    state
  end
where:
  move-circle(circle-state(250, 200), "right")
    is circle-state(260, 200)
  move-circle(circle-state(250, 200), "up")
    is circle-state(250, 190)
  move-circle(circle-state(250, 200), "a")
    is circle-state(250, 200)
end

# Move the circle to the location of a mouse click
fun click-circle(
    state :: CircleState,
    mouse-x :: Number,
    mouse-y :: Number,
    mouse-event :: String) -> CircleState:
  if mouse-event == "button-down":
    circle-state(mouse-x, mouse-y)
  else:
    state
  end
where:
  click-circle(circle-state(250, 200), 100, 150, "button-down")
    is circle-state(100, 150)
  click-circle(circle-state(250, 200), 100, 150, "move")
    is circle-state(250, 200)
end

# Connect the starting state, drawing, and inputs
circle-reactor = reactor:
  init: circle-state(250, 200),
  to-draw: draw-circle,
  on-key: move-circle,
  on-mouse: click-circle
end

# Start the interactive experience
R.interact(circle-reactor)


