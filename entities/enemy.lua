--[[
  should have priority of what they want to do (damage players, heal squad,etc) that is updated at the start of their turn and before they choose which action to take.  
  
    Only need 1 or 2 skills on base guys
]]--

enemy=entity:new({
  name="UNDEFINED",
  type=" UNDEFINED",
  accuracy=50,
  agility=50,
  vitality=50,
  res_phys=20,
  res_energy=20,
  res_chem=20,
  sprx=0,
  spry=0,
  sprw=16,
  sprh=16,
  sprdeadx=0,
  sprdeady=0,
  sprdeadw=16,
  sprdaedh=8,
  skills={},
  current_hp=10,
  max_hp=10,

  update=function(_ENV)
  end,

  draw=function(_ENV)
    palt(0,false)
    palt(11,true)
    if current_hp > 0 then
      sspr(sprx,spry,sprw,sprh,x,y,sprw,sprh)
    else
      sspr(sprdeadx,sprdeady,sprdeadw,sprdaedh,x,y+8,sprdeadw,sprdaedh)
    end
    pal()
  end
})