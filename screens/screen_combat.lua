function init_combat()
  characters={}
  for i=1,4 do
    local c = genCharacter()
    c.x=i*16-16
    c.y=24
    add(characters, c)
  end

  for i=1,4 do
    local enemy = enemy:new({
      name="baddie"..i,
      type="fleshbeast",
      x=i*16-16+64,
      y=24,
      sprx=80,
      spry=16,
      sprw=16,
      sprh=16,
      sprdeadx=48,
      sprdeady=24,
      sprdeadw=16,
      sprdaedh=8,
      skills={}
    })
    add(enemy.skills,general_attack)
    add(characters,enemy)
  end

  --Roll Initiatives and order array by result
  rollInitiative(characters)
  selectedchar=1
  selectedAction=-1
  targetchar=-1
  _update=update_combat_chooseAction
  _draw=draw_combat

  round=1

  -- play battle music
  music(8)
end

function update_combat_ChooseTarget()
  if btnp(⬅️) then targetchar-=1 end
  if btnp(➡️) then targetchar+=1 end
  targetchar=min(max(targetchar,1),#characters)
  if btnp(❎) then 
    _update=update_combat_executeAction
  end
end

function update_combat_chooseAction()
  if btnp(⬆️) then selectedAction-=1 end
  if btnp(⬇️) then selectedAction+=1 end
  selectedAction=min(max(selectedAction,1),#characters[selectedchar].skills)
  if btnp(❎) then 
    --get target
    targetchar=1
    _update=update_combat_ChooseTarget
  end
  if btnp(🅾️) then 
  end
end

function update_combat_executeAction()
    -- character table, actor,target
    characters[selectedchar].skills[selectedAction].onAction(characters,selectedchar,targetchar)
    selectedchar+=1
    if selectedchar>#characters then
      endOfRound()
    end
    targetchar=-1
    _update=update_combat_chooseAction
end

function draw_combat()
  cls(1)
  map()
  rectfill(0,48,127,127,0)
  rect(0,48,127,127,7)  

  -- Draw Characters
  for c in all(characters) do 
    c:draw()
  end
  if targetchar > 0 then 
    --draw target details
    drawTargetDetails()
    --draw hit chances and effects
  else
    drawCharacterDetails()
    drawSkillDetails()
  end
end

function drawTargetDetails()
  -- draw selected char details
  local c = characters[selectedchar]
  pal(8,11)
  sspr(16,24,16,8,c.x,c.y+12,16,8,false,false) --selection cursor
  sspr(16,24,16,8,c.x,c.y-8,16,8,false,true) --selection cursor
  pal()

  local target = characters[targetchar]
  sspr(16,24,16,8,target.x,target.y+12,16,8,false,false) --selection cursor
  sspr(16,24,16,8,target.x,target.y-8,16,8,false,true) --selection cursor

  -- Character Stats
  print(target.name,2,50,7)
  print(target.type,2,56,5)
  print("\f3ACC \t"..target.accuracy,2,64,6)
  print("\f3AGI \t"..target.agility,2,70,6)
  print("\f3VIT \t"..target.vitality,2,76,6)

  print("\f1PHYS\t"..target.res_phys,2,84,6)
  print("\f1ENER\t"..target.res_energy,2,90,6)
  print("\f1CHEM\t"..target.res_chem,2,96,6)

  print("HP", 64,50,6)
  local strw = print(target.current_hp.."/"..target.max_hp,-0,-20)
  print(target.current_hp.."/"..target.max_hp, 126-strw, 50,8)

  -- Character Skills
  for i=1,#c.skills do
    print(c.skills[i].name, 64, 64+((i-1)*8),5)
  end
end

function drawCharacterDetails()
  -- draw selected char details
  local c = characters[selectedchar]
  sspr(16,24,16,8,c.x,c.y+12,16,8,false,false) --selection cursor
  sspr(16,24,16,8,c.x,c.y-8,16,8,false,true) --selection cursor

  -- Character Stats
  print(c.name,2,50,7)
  print(c.type,2,56,5)
  print("\f3ACC \t"..c.accuracy,2,64,6)
  print("\f3AGI \t"..c.agility,2,70,6)
  print("\f3VIT \t"..c.vitality,2,76,6)

  print("\f1PHYS\t"..c.res_phys,2,84,6)
  print("\f1ENER\t"..c.res_energy,2,90,6)
  print("\f1CHEM\t"..c.res_chem,2,96,6)

  print("HP", 64,50,6)
  local strw = print(c.current_hp.."/"..c.max_hp,-0,-20)
  print(c.current_hp.."/"..c.max_hp, 126-strw, 50,8)

  -- Character Skills
  for i=1,#c.skills do
    local color=(i==selectedAction) and 6 or 5
    print(c.skills[i].name, 64, 64+((i-1)*8),color)
  end
  if (selectedAction>0) print("◆",56,64+((selectedAction-1)*8),6)
end

function drawSkillDetails()
  print("EFFECT", 2, 106,6)
  v1,v2 = "78%","2-5"
  local s = pstr(", \f5CHANCE TO DO \f8,\f5 DAMAGE",v1,v2)
  print(s,2,114,10)
end

function rollInitiative(characters)
  for c in all(characters) do 
    c.initiative = rnd(20) + c.agility
  end
  sortByInitiative(characters)
end

function endOfRound()
  rollInitiative(characters)
  selectedchar=1
  for c in all(characters) do 
    c.hasActed=false;
  end

  -- update dots?
  round+=1
end