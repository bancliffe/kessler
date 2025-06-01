character=entity:new({
  -- x,y defined in entity.lua
  name="notset",
  type=c_types.scav,
  initiative=0,
  accuracy=50,
  agility=50,
  vitality=50,
  res_phys=20,
  res_energy=20,
  res_chem=20,
  skills={},
  sprx=0,
  spry=0,
  sprw=16,
  hasActed=false,
  current_hp=10,
  max_hp=10,

  update=function(_ENV)
  end,

  draw=function(_ENV)
    palt(0,false)
    palt(14,true)
    sspr(sprx,spry,sprw,sprw,x,y,sprw,sprw)
    pal()
  end
})

