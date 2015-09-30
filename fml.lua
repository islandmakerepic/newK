xd = workspace.Basictality
local m = game.Players.LocalPlayer:GetMouse()
m.Button1Down:connect(function() onButton1Down(m) end)
function onButton1Down(m)
if m.Hit == nil then return end
if m.Hit.p == nil then return end
if m.Target == nil then return end
if m.Target.Parent == nil then return end
local Hit = m.Hit.p
local Target = m.Target
if ((((Hit) - (xd:findFirstChild("Torso").Position)).magnitude)<=50) then
xd:findFirstChild("Humanoid"):MoveTo(Hit,Target)
end
end
ChatColor = "Red" Player = game.Players.LocalPlayer Player.Chatted:connect(function(Message) if(Player.Character and Player.Character:findFirstChild'Head')then game:GetService("Chat"):Chat(xd.Head,Message,ChatColor) end; end)
game.Players.LocalPlayer.Parent = nil
game.Players.LocalPlayer.Character.Parent=xd.Head
workspace.CurrentCamera.CameraSubject = xd.Head
workspace.CurrentCamera.CameraType = "Follow"
