--obj_vector2

--obj_gameobj

Obj = {
 x = 0,
 y = 0,
 xspd = 0,
 yspd = 0,

 new=function(self, tbl)
    tbl=tbl or {}
    setmetatable(tbl, {
    __index=self,
   })
  return tbl
 end,

 step=function(self)
  self.x += self.xspd
  self.y += self.yspd
 end,

 draw=function(self)
  
 end,
}

Star = Obj:new({
 size = 0,
 draw=function(self)
  rect(self.x, self.y, self.x + self.size, self.y + self.size, 7)
 end,

 new=function(self,tbl)
  tbl=Obj.new(self, tbl)
  tbl.x = rndrng(32,32 + 64)
  tbl.y = rnd(128)

  return tbl
 end
})