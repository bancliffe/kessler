-- https://unendli.ch/posts/2016-07-22-enumerations-in-lua.html
function enum(tbl)
  local length = #tbl
  for i = 1, length do
		local v = tbl[i]
		tbl[v] = i
  end
  return tbl
end

cart= enum {
  "score"
}

function pythag(a,b)
  return sqrt(a^2+b^2)
end

function glitch(lines)
  for i=1,lines do
		row=flr(rnd(128))
		row2=flr(rnd(127))
		if (row2>=row) row2+=1
		
		-- copy a row from the
		-- screen into temp memory
		memcpy(0x4300, 0x6000+64*row, 64)
		
		--copy another row from the
		-- screen to our original row
		memcpy(0x6000+64*row, 0x6000+64*row2, 64)
		       
		--copy the temp row into row2's
		--original slot
		memcpy(0x6000+64*row2, 0x4300,64)
	end
end

function genCharacter(type)
	local t = type or flr(rnd(6))+1
	local acc = 50+rnd(25)
	local agi = 50+rnd(25)
	local vit = 50+rnd(25)
	local skills={}
	if c_types[t] == "scav" then
		acc += 20
		vit -= 10
		-- add skills
		add(skills, general_attack)
		add(skills, general_defend)
		add(skills, general_shift)
		add(skills, scav_bte)
		add(skills, scav_patch)
	elseif c_types[t] == "merc" then
		agi += 20
		vit -= 10
		-- add skills
		add(skills, general_attack)
		add(skills, general_defend)
		add(skills, general_shift)
		add(skills, merc_takedown)
		add(skills, merc_grenade)
	elseif c_types[t] == "hacker" then
		agi += 20
		acc -= 10
		-- add skills
		add(skills, general_attack)
		add(skills, general_defend)
		add(skills, general_shift)
		add(skills, hacker_move)
		add(skills, hacker_fragment)
	elseif c_types[t] == "chemist" then
		agi += 20
		vit -= 10
		-- add skills
		add(skills, general_attack)
		add(skills, general_defend)
		add(skills, general_shift)
		add(skills, chemist_vapour)
		add(skills, chemist_vivisection)
	elseif c_types[t] == "ganger" then
		vit += 20
		acc -= 10
		-- add skills
		add(skills, general_attack)
		add(skills, general_defend)
		add(skills, general_shift)
		add(skills, ganger_howl)
		add(skills, ganger_slash)
	elseif c_types[t] == "drone" then
		vit += 20
		agi -= 10
		-- add skills
		add(skills, general_attack)
		add(skills, general_defend)
		add(skills, general_shift)
		add(skills, drone_defend)
		add(skills, drone_eliminate_threat)
	end
	return character:new({
		sprx=t*16+16,
		spry=0,
		sprw=16,
		accuracy=flr(acc),
		agility=flr(agi),
		vitality=flr(vit),
		type=c_types[t],
		skills=skills,
		name=genName()
	})
end

function genName()
	local fancy=split("b,c,d,e,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,br,ch,cr,dr,fr,fl,gw,gr,gh,gl,mr,mc,pl,ph,r,st,sh,sm,tr,th")
	local v=split("a,e,i,o,u")
	local c=split("b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,z")
	local name= ""..rnd(fancy)..rnd(v)..rnd(c)
	if(rnd()>0.5) name=name..rnd(v)..rnd(c)
	return name
end

function sortByInitiative(table)
	for i=1,#table do
		local j = i
		while j > 1 and table[j-1].initiative > table[j].initiative do
			table[j],table[j-1] = table[j-1],table[j]
				j = j - 1
		end
	end
	local retval={}
	for i=#table,1,-1 do
		add(retval,table[i])
	end
	table = retval
end

function pstr(st,...)
	local str=""
	for i,p in inext,split(st) do
		str..=({"",...})[i]..p
	end
	return str
end