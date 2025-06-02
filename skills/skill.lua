--[[
  list of skills in game
]]

general_attack=skill:new({
  name="attack",
  sprx=0,
  spry=32,
  isFriendly=false,
  effect="%TO_HIT_CHANCE% \f5CHANCE TO DO \f8%DMG_RANGE% \f5DAMAGE",
  targets={true,true,true,true}, 
  onAction=function(characters, actorIndex,targetIndex)
    sfx(0)
    characters[targetIndex].current_hp -= flr(rnd(4))+1
  end
})

general_shift=skill:new({
  name="shift position",
  sprx=0,
  spry=32,
  isFriendly=true,
  targets={true,true,true,true}, 
  effect="SWAP PLACES WITH FRIENDLY CHARACTER",
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

general_defend=skill:new({
  name="defend self",
  sprx=0,
  spry=32,
  isFriendly=true,
  targets={true,true,true,true},
  effect="%TO_BLOCK_CHANCE% TO\nBLOCK %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

scav_bte=skill:new({
  name="snipe",
  sprx=0,
  spry=32,
  isFriendly=false,
  targets={false,false,true,true}, 
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

scav_patch=skill:new({
  name="patch em up",
  sprx=0,
  spry=48,
  isFriendly=true,
  targets={true,true,true,true}, 
  effect="%TO_HIT_CHANCE% TO HEAL %DMG_RANGE%",
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

merc_takedown=skill:new({
  name="takedown",
  sprx=16,
  spry=32,
  isFriendly=false,
  targets={false,true,true,false},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

merc_grenade=skill:new({
  name="mk1 frag",
  sprx=16,
  spry=48,
  isFriendly=false,
  targets={true,true,true,true},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

hacker_fragment=skill:new({
  name="defrag",
  sprx=32,
  spry=32,
  isFriendly=false,
  targets={false,true,true,false},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

hacker_move=skill:new({
  name="rewire",
  sprx=32,
  spry=48,
  isFriendly=false,
  targets={true,true,true,true},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

chemist_vapour=skill:new({
  name="diffusion",
  sprx=48,
  spry=32,
  isFriendly=true,
  targets={false,true,true,false},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

chemist_vivisection=skill:new({
  name="vivisection",
  sprx=48,
  spry=48,
  isFriendly=false,
  targets={true,true,true,true},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

ganger_howl=skill:new({
  name="wild howl",
  sprx=64,
  spry=32,
  isFriendly=true,
  targets={false,true,true,false},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

ganger_slash=skill:new({
  name="gouging slash",
  sprx=64,
  spry=48,
  isFriendly=false,
  targets={true,true,true,true},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

drone_defend=skill:new({
  name="mode:defend",
  sprx=80,
  spry=32,
  isFriendly=true,
  targets={false,true,true,false},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})

drone_eliminate_threat=skill:new({
  name="mode:nutralize",
  sprx=80,
  spry=48,
  isFriendly=false,
  targets={true,true,true,true},
  effect="%TO_HIT_CHANCE% TO DO %DMG_RANGE%", 
  onAction=function(characters)
    for i=1,#characters do 
      -- roll for damage
    end
  end
})