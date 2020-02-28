--[[
--
--  THIS SCRIPT WILL NOT WORK IN ROBLOX!
--  THIS IS ONLY TO DEMONSTRATE AND DISTRIBUTE THE EVENTS HANDLER.
--  NOT DOCUMENTED. This code is used in F3X Logs pro.
--
--]]

local Events = {
		SyncMove = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						CFrame = CFrame
						Part = Part
					}
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "moved"
			Format.Q = #Event
			Format.G = "by"
			local Distance = (Event[1].Part.CFrame.p - Event[1].CFrame.p).Magnitude
			Format.R = tostring(math.floor(Distance) .. " stud".. ((Distance==1 and "") or "s"))
			
			return Format
		end,
		SyncResize = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						CFrame = CFrame
						Part = Part
						Size = Vector3
					}
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "resized"
			Format.Q = #Event
			Format.G = "by"
			local Distance = (Event[1].Part.Size - Event[1].Size).Magnitude
			Format.R = tostring(math.floor(Distance) .. " stud".. ((Distance==1 and "") or "s"))
			
			return Format
		end,
		SyncColor = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Color = Color3
						Part = Part
						UnionColoring = bool
					}
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "painted"
			Format.Q = #Event
			Format.G = nil
			Format.R = BrickColor.new(Event[1].Color).Name
			
			return Format
		end,
		SyncCollision = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						CanCollide = bool
					}
					...
				}
			]]
			
			local cTrue = 0
			local cFalse = 0
			
			for _,part in pairs(Event) do
				if part.CanCollide then
					cTrue = cTrue + 1
				else
					cFalse = cFalse + 1
				end
			end
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "set the collision of"
			Format.Q = #Event
			Format.G = "to"
			Format.R = tostring(cTrue > cFalse)
			
			return Format
		end,
		SyncDecorate = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						DecorationType = Smoke, Fire, Sparkles
						Heat = Number (Fire)
						Size = Number (Smoke, Fire)
						Color = Color3 (All)
						Opacity = 10 (Smoke)
						RiseVelocity = 10 (Smoke)
					}
					...
				}
			]]
			
			local toInclude = {
				["Heat"] = "heat",
				["Size"] = "size",
				["Color"] = "color",
				["Opacity"] = "opacity",
				["RiseVelocity"] = "velocity"
			}
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "changed"
			Format.Q = #Event
			Format.ar = Event[1].DecorationType .. "'s"
			Format.G = " to"
			Format.R = ""
			
			for search,set in pairs(toInclude) do
				if Event[1][search] then
					if search == "Color" then
						
					else
						Format.R = Event[1][search]
						Format.G = set .. " to:"
					end
				end
			end
			
			return Format
		end,
		CreateDecorations = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						DecorationType = Fire, Smoke, Sparkles
					}
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "added"
			Format.Q = #Event
			Format.ar = Event[1].DecorationType .. ((#Event==1 and "") or "s")
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		Remove = function(Client,Event)
			--[[
				Event Structure:
				{
					Instance
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "removed"
			Format.Q = #Event
			Format.ar = Event[1].ClassName .. ((#Event==1 and "") or "s")
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		Clone = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
					
					}
					...
					Parent
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "cloned"
			Format.Q = #Event[1]
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		SetLocked = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part
						...
					
					}
					Bool
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = ((Event[2] and "locked") or "unlocked")
			Format.Q = #Event[1]
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		CreatePart = function(Client,Event)
			--[[
				Event Structure:
				{
					Type(Normal,etc), CFrame, Parent
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "created"
			Format.Q = "1 "..Event[1]
			Format.G = "in"
			Format.R = Event[3].Name
			
			return Format
		end,
		SyncAnchor = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						Anchored = bool
					
					}
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = ((Event[1].Anchored and "anchored") or "unanchored")
			Format.Q = #Event
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		CreateLights = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						LightType = PointLight,SpotLight,SurfaceLight
					
					}
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "created"
			Format.Q = #Event
			Format.ar = Event[1].LightType
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		SyncLighting = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						LightType = PointLight,SpotLight,SurfaceLight
						Brightness,
						Range,
					
					}
					...
				}
			]]
			
			local NOT = { Part = true, LightType = true }
			local CHANGED = nil
			
			for index,set in pairs(Event[1]) do
				if NOT[index] then
				else
					CHANGED = index
				end
			end
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "set the "..CHANGED.." of"
			Format.Q = #Event
			Format.ar = Event[1].LightType .. ((#Event==1 and "") or "s")
			Format.G = "to"
			Format.R = tostring(Event[1][CHANGED])
			
			return Format
		end,
		CreateMeshes = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
					}
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "created"
			Format.Q = #Event
			Format.ar = "mesh" .. ((#Event==1 and "") or "es")
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		SyncMesh = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						ExtraInfo;
					}
					...
				}
			]]
			
			local NOT = { Part = true }
			local CHANGED = nil
			
			for index,set in pairs(Event[1]) do
				if NOT[index] then
				else
					CHANGED = index
				end
			end
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "set the "..CHANGED.." of"
			Format.Q = #Event
			Format.ar = "mesh" .. ((#Event==1 and "") or "es")
			Format.G = "to"
			Format.R = tostring(Event[1][CHANGED])
			
			return Format
		end,
		SyncMaterial = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						ExtraInfo;
					}
					...
				}
			]]
			
			local NOT = { Part = true }
			local CHANGED = nil
			
			for index,set in pairs(Event[1]) do
				if NOT[index] then
				else
					CHANGED = index
				end
			end
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "set the "..CHANGED.." of"
			Format.Q = #Event
			Format.G = "to"
			Format.R = tostring((typeof(Event[1][CHANGED]) == "EnumItem" and Event[1][CHANGED].Name) or Event[1][CHANGED])
			
			return Format
		end,
		SyncSurface = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						Surfaces = {
							Surface = SurfaceType
						}	
					}
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "changed the surface of"
			Format.Q = #Event
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		SyncRotate = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						CFrame = CFrame
					}
					...
				}
			]]
			
			local CX,CY,CZ = Event[1].Part.CFrame:ToEulerAnglesXYZ()
			local DX,DY,DZ = Event[1].CFrame:ToEulerAnglesXYZ()
			
			local NX,NY,NZ = math.abs(CX-DX),math.abs(CY-DY),math.abs(CZ-DZ)
			
			local Total = math.floor(math.deg(math.max(NX,NY,NZ)))
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "rotated"
			Format.Q = #Event
			Format.G = "by"
			Format.R = Total+1 .. " degree"..((Total==1 and "") or "s")
			
			return Format
		end,
		CreateTextures = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						Face = Face
						TextureType = Decal,Texture
					}
					...
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "created"
			Format.Q = #Event
			Format.ar = Event[1].TextureType..((#Event==1 and "") or "s")
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		SyncTexture = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part = Part
						Face = Face
						TextureType = Decal,Texture
						ExtraInfo;
					}
					...
				}
			]]
			
			local NOT = { Part = true, Face = true, TextureType = true }
			local CHANGED = nil
			
			for index,set in pairs(Event[1]) do
				if NOT[index] then
				else
					CHANGED = index
				end
			end
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "set the "..CHANGED.." of"
			Format.Q = #Event
			Format.ar = Event[1].TextureType..((#Event==1 and "") or "s")
			Format.G = "to"
			Format.R = tostring((typeof(Event[1][CHANGED]) == "EnumItem" and Event[1][CHANGED].Name) or Event[1][CHANGED])
			
			return Format
		end,
		CreateWelds = function(Client,Event) 
			--[[
				Event Structure:
				{
					{
						Part
						...
					}
					Part
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "created"
			Format.Q = #Event[1]
			Format.ar = "weld"..((#Event==1 and "") or "s")
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
		RemoveWelds = function(Client,Event)
			--[[
				Event Structure:
				{
					{
						Part
						...
					}
				}
			]]
			
			local Format = {}
			Format.P = Client.Name
			
			Format.A = "removed"
			Format.Q = #Event
			Format.ar = "weld"..((#Event==1 and "") or "s")
			Format.G = ""
			Format.R = ""
			
			return Format
		end,
}
