local on=false
local activekey = 'r'
local smokeSmall = Instance.new("Part",workspace)
smokeSmall.FormFactor='Custom'
smokeSmall.Shape='Ball'
smokeSmall.Size=Vector3.new(1,1,1)
smokeSmall.Transparency=0.4
smokeSmall.TopSurface='Smooth'
smokeSmall.Parent=game.Lighting
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
coroutine.wrap(function()
  while wait() do
    arm2.CFrame=arm.CFrame*CFrame.new(0,0,-1)
    end
  end)()
local equip=function(bool)
arm.Transparency=bool==true and 1 or 0
arm2.Transparency=arm.Transparency==0 and 1 or 0
launch.Transparency=arm2.Transparency
on=bool
end

mouse.KeyDown:connect(function(k)
if k==activekey then
equip(not on)
on=not on
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

Fire=function(pos)
local rock=rocket:clone()
rock.Anchored=true
rock.CFrame=arm2.CFrame*CFrame.new(0,0,-5)
mag=(pos-rock.CFrame.p)
game.Debris:AddItem(rock,mag/5)
rock.CFrame=CFrame.new(rock.Position,pos)
local w=coroutine.wrap(function()
for i=1,mag do
wait()
rock.CFrame=rock.CFrame*CFrame.new(0,0,-1)
check(rock)
end

end)
w()
wait(2)
end

mouse.Button1Down:connect(function()
if on then Fire(mouse.Hit) end
end)