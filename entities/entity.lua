global=_ENV

class=setmetatable({
	new=function(self,tbl)
		tbl=tbl or {}
		setmetatable(tbl,{__index=self})
	 return tbl
	end,
},{__index=_ENV})

entity=class:new({x=64,y=64})
skill=class:new({
  name="NOTSET",
  spr=0,
  isFriendly=false,
  targets={false,false,false,false}, 
  onAction=0
})