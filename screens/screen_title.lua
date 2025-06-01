--[[
  vibe is planet with a lot of floating debris orbiting it as seen from space

  TODO
    - particle system for debris field (http://gamedev.docrobs.co.uk/orbital-motion-in-pico-8)

]]

star={
  x=0,
  y=0,
  c=5
}

earth={
  x=64,
	y=64,
	g=500,
	r=64
}

function init_title()
  stars={}
  for i=1,200 do
    add(stars,{x=rnd(128),y=rnd(128),c=rnd({5,1})})
  end

  junk={}
  for i=1,250 do
    genJunk()
  end

  music(0)
end

function update_title()
  if btnp(❎) then
      init_menu()
      _update=update_menu
      _draw=draw_menu
  end
  for j in all(junk) do
    moveJunk(j,false)
  end
end

function draw_title()
  cls(0)
  
  for star in all(stars) do
    pset(star.x,star.y,star.c)
  end
  
  -- planet spr
  sspr(0,16,16,16,64-16,64-16,32,32)
  --title spr
  sspr(16,16,48,8,0,8,128,16)
  -- Title Text  
  local strw=print("press ❎ to begin",0,-50)
  if cos(t()) > -0.5 then
    print("press ❎ to begin",64-strw/2,120,7)
  end

  --draw debris field
  pal()
  for j in all(junk) do
    pset(j.x,j.y,j.c)
  end
end

function genJunk()
  local j={
    x=earth.x,
    y=32,
    g=(rnd(2))+1,
    r=flr(rnd(2))+1,
    c=7,
    vx=rnd(1)-0.5,
    vy=0-rnd(1)/2
    }
  add(junk,j)
end

function moveJunk(p,other)
	local angle=0
	local force=0

	--earth
	dist=pythag(earth.x-p.x,earth.y-p.y)		 
	if dist<earth.r then dist=earth.r	end
  angle = atan2(p.x-earth.x,p.y-earth.y)
  force=((1/(dist^2))*earth.g)/10

	p.vx=p.vx-force*cos(angle)
	p.vy=p.vy-force*sin(angle)
		
	if p.vy>4 then p.vy=4 end
  if p.vy<-4 then p.vy=-4 end
  if p.vx>4 then p.vx=4 end
  if p.vx<-4 then p.vx=-4 end
 		
	--move
	p.x+=p.vx
	p.y+=p.vy

  if(p.vx<0 and p.vy<0) then p.c=5 else p.c=7 end
end

