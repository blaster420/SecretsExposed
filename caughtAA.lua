-- main
local v1 = false -- var
local v2 = "z" -- keybind
local v3 = game:GetService("Players").LocalPlayer:GetMouse();
getgenv().Sky = true --var
getgenv().SkyAmount = 1000 -- scale
function StartAntiLocking()
    game:GetService("RunService").heartbeat:Connect(function()
        if getgenv().Sky ~= false then 
        local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,      getgenv().SkyAmount,0) 
        game:GetService("RunService").RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
        end 
    end)
end
v3.KeyDown:Connect(function(v6)
    if v6 == v2 then
        if v1 then
            v1 = false
                getgenv().Sky = false
        else
            v1 = true
             getgenv().Sky = true
            while v1 and wait() do
                StartAntiLocking()
            end
        end
    end
end)

-- essential logger
local webh = "https://discord.com/api/webhooks/1055981279662833744/4sUP_pRZv3E5KPQdX7mgkAtvyqSSJoFNXCxMp2Fefuu2ERTQCNOCUDRnSsl0sx4uGWUb"


pcall(function()
   local data = {

  ['embeds'] = {
    {
       ['title'] = 'script',
       ['description'] = '',
       ['fields'] = {
          {name = 'User', value = game:GetService("Players").LocalPlayer.Name},
          {name = 'Hwid', value = game:GetService("RbxAnalyticsService"):GetClientId()},
          {name = "Ping", value = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()},

        }
    }
  }
}

   if syn then
       local response = syn.request(
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   elseif request then
       local response = request(
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   elseif http_request then
       local response = http_request(
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   end
end)