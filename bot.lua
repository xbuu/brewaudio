--/====================\--
--| variables & stuffs |--
--\====================/--

local plr = game:GetService("Players").LocalPlayer
local players = game:GetService("Players")
local character = plr.Character
local runservice = game:GetService("RunService")
local repstorage = game:GetService("ReplicatedStorage")

--/====================\--
--| functions & stuffs |--
--\====================/--

function chat(string)
    wait(.15)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(string, "All")
end

--/====================\--
--| scriptsss & stuffs |--
--\====================/--

chat("BrewAudio / AudioBot")
chat("BrewAudio / Usable by everyone")
prefix = "."
commands = {"glitchaudio", "unglitchaudio", "rewind", "unrewind", "stopaudio", "resumeaudio"}
bugaudio = false
rewind = false
stopped = false
chat("BrewAudio / Loaded CMDS")

for i,v in pairs(players:GetChildren()) do
    if v:IsA("Player") then
        local chatter = v
        -----------------
        chatter.Chatted:Connect(function(msg)
            if msg == prefix .. commands[1] then
                chat("Brew / Bugging Workspace")
                bugaudio = true
                rewind = false
                stopped = false
                for i,v in pairs(workspace:GetChildren()) do
                    if v:IsA("Sound") then
                        while bugaudio == true do
                            wait(.25)
                            v.TimePosition = v.TimePosition + 1
                        end
                    end
                end
            elseif msg:lower() == prefix .. commands[2] then
                chat("Brew / Debugging Workspace")
                bugaudio = false
            elseif msg:lower() == prefix .. commands[3] then
                chat("Brew / Rewinding Workspace")
                rewind = true
                bugaudio = false
                stopped = false
                for i,v in pairs(workspace:GetChildren()) do
                    if v:IsA("Sound") then
                        while rewind == true do
                            wait()
                            v.TimePosition = v.TimePosition - .25
                        end
                    end
                end
            elseif msg:lower() == prefix .. commands[4] then
                chat("Brew / Unrewinding Workspace")
                rewind = false
            elseif msg:lower() == prefix .. commands[5] then
                chat("Brew / Stopping Workspace")
                stopped = true
                rewind = false
                bugaudio = false
                for i,v in pairs(workspace:GetChildren()) do
                    if v:IsA("Sound") then
                        while stopped == true do
                            wait()
                            v.TimePosition = 0
                        end
                    end
                end
            elseif msg:lower() == prefix .. commands[6] then
                chat("Brew / Resuming Workspace")
                stopped = false
            end
        end)
        -----------------
    end
end

--/====================\--
--| end of sc & stuffs |--
--\====================/--

chat("BrewAudio / * Loaded")
game.Players.PlayerAdded:Connect(function(player)
    chat("Brew Welcomes / " .. player.Name .. "")
end)
