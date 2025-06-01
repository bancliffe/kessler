function init_menu()
  menu_items={}
  if (dget(cart.score)>0) add(menu_items,"continue")
  add(menu_items,"new game")
  add(menu_items,"save")
  add(menu_items,"options")
  sel=1
  lines=1
  doGlitch=false
  music(8)
end

function update_menu()
  if btnp(⬆️) then sel-=1 sfx(1) doGlitch=true end
  if btnp(⬇️) then sel+=1 sfx(1) doGlitch=true end
  if (sel < 1) sel=1
  if (sel >= #menu_items) sel=#menu_items

  if btnp(❎) then
    sfx(1)
    if menu_items[sel]=="save" then
      dset(cart.score,100)
    elseif menu_items[sel]=="new game" then
      init_combat()
    end
  end
  
  -- ⬅️➡️❎🅾️
end

function draw_menu()
  cls(0)  
  for i=1,#menu_items do
    local strw=print(menu_items[i],0,-50)
    if sel==i then
      print(menu_items[i],127-strw, 64+(i*8),12)
    else
      print(menu_items[i],127-strw, 64+(i*8),1)
    end
  end
  if doGlitch then glitch(2) doGlitch=false end
end