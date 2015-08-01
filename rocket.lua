local on=false
local activekey = 'r'
local smokeSmall = Instance.new("Part",workspace)
smokeSmall.FormFactor='Custom'
smokeSmall.Shape='Ball'
smokeSmall.Size=Vector3.new(2,2,2)
smokeSmall.Transparency=0.2
smokeSmall.TopSurface='Smooth'
smokeSmall.Parent=game.Lighting
smokeSmall.Anchored=true
smokeSmall.CanCollide=false
smokeSmall=smokeSmall:clone()

rocket=Instance.new("Part",workspace)
rocket.Name='Rocket'
rocket.Size=Vector3.new(1,1,2)
rocket.CanCollide=false
rocket.Anchored=true
rocket.BrickColor=BrickColor.Black()
game.Debris:AddItem(rocket,1)
rocket=rocket:clone()

local plr=game.Players.LocalPlayer

local mouse=plr:GetMouse()

local char=plr.Character
arm=char["Right Arm"]
arm2=char['Right Arm']:clone()
arm2.Name='ArmR'
arm2.Size=Vector3.new(1,1,2)
arm2.Transparency=1
arm2.CanCollide=false
arm2.Anchored=true
arm2.Parent=char
launch=rocket:clone()
launch.BrickColor=BrickColor.new()
launch.Transparency=1
launch.Parent=char
coroutine.wrap(function()
  while wait() do
    arm2.CFrame=arm.CFrame*CFrame.new(0,0,-1)
    launch.CFrame=arm2.CFrame*CFrame.new(0,0,-3)
    end
  end)()
local equip=function(bool)
if bool then
  arm.Transparency=1
  arm2.Transparency=0
  launch.Transparency=0
else
   arm.Transparency=0
  arm2.Transparency=1
  launch.Transparency=1
  end
end

mouse.KeyDown:connect(function(k)
if k==activekey then
  on=not on
equip(on)
end
end)

check=function(R)
chars={}
for i,v in pairs(Workspace:children()) do
if v:findFirstChild'Humanoid' and v:findFirstChild'Torso' and v~=char then
chars[#chars+1]=v
end
end
for i,v in pairs(chars) do
if (v.Torso.Position-R.Position).magnitude<5 then
v.Torso:breakJoints()
end
end
end

collide=function(a)
  return a.Touched:wait()
  end

Fire=function(pos)
local rock=rocket:clone()
rock.Anchored=true
rock.Parent=workspace
rock.CFrame=arm2.CFrame*CFrame.new(0,0,-5)
mag=(pos-rock.CFrame.p).magnitude
print(mag)
game.Debris:AddItem(rock,mag/5)
rock.CFrame=CFrame.new(rock.Position,pos)
local w=coroutine.wrap(function()
for i=1,mag,2 do
wait(0)
rock.CFrame=rock.CFrame*CFrame.new(0,0,-2)
ss=smokeSmall:clone()
ss.Parent=workspace
game.Debris:AddItem(ss,mag-i)
ss.CFrame=rock.CFrame*CFrame.new(math.random(-2,3),0,-2)
check(rock)
end
Frame=rock.CFrame
ss=smokeSmall:clone()
ss.Size=Vector3.new(5,5,5)
for i=5,20,2 do
  ss=ss:clone()
  ss.Parent=workspace
  ss.Size=Vector3.new(i,i,i)
  ss.CFrame=Frame*CFrame.new(0,0,-(i*2))
    game.Debris:AddItem(ss,0.7)
  end
end)()
w()
wait(2)
end

mouse.Button1Down:connect(function()
  print(on)
if on then Fire(mouse.Hit.p) end
end)
