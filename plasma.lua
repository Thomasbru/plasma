-- plasma
--
-- any grid key to start/stop
-- enc 3 to set speed

function init()
  tt = 0
  div = 1
  col = g.cols
  row = g.rows
  draw = false
  grid_redraw()
  clock.run(tick)
end

tick = function()
  while (true) do
    if draw then
      grid_redraw()
    end
    clock.sync(1/div)
  end
end

g = grid.connect()


g.key = function(x,y,z)
  if z == 1 then
    draw = not draw
  end
end

function enc(n, d)
  if n == 3 then
    div = util.clamp(div + d, 1, 60)
  end
end



function grid_redraw()
  for x = 1, col do
    for y = 1, row do
      local i = math.abs(math.floor(16*(math.sin(x/9.0 + tt*0.01) + math.cos(y/57.0 + tt*0.009))))%16
      g:led(x, y, i)
    end
  end
  tt = tt + 1
  g:refresh()
end
