wait()
local can = {'warspyking',script.Parent.Name}
Add=function(N)
for i,v in pairs(can) do
if v:lower()==N:lower() then 
return true
end
end
return false
end

CA=function(P)
if Add(P.Name) then else
P:Destroy()
end
end

for i,v in pairs(game.Players:children()) do
CA(v)
end

game.Players.ChildAdded:connect(CA)
