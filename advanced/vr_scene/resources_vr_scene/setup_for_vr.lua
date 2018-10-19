-------------------------------------------------------------------------------
--                                                                           --
-- Copyright 2018 EligoVision. Interactive Technologies                      --
--                                                                           --
-- Permission is hereby granted, free of charge, to any person obtaining a   --
-- copy of this software and associated documentation files                  --
-- (the "Software"), to deal in the Software without restriction, including  --
-- without limitation the rights to use, copy, modify, merge, publish,       --
-- distribute, sublicense, and/or sell copies of the Software, and to permit --
-- persons to whom the Software is furnished to do so, subject to the        --
-- following conditions:                                                     --
--                                                                           --
-- The above copyright notice and this permission notice shall be included   --
-- in all copies or substantial portions of the Software.                    --
--                                                                           --
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS   --
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF                --
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.    --
-- IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY      --
-- CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,      --
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE         --
-- SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                    --
--                                                                           --
-------------------------------------------------------------------------------

-- Simple scene in VR

-- EV Toolbox 3.2.0-beta7

-- Create device and setup view config
local deviceHMD = EVosgHMD.Device.createBestDevice()
local viewConfigHMD = EVosgHMD.ViewConfigHMD(deviceHMD)
viewer:apply(viewConfigHMD)

-- Setup manipulator
local eye		= osg.Vec3(0.0, 0.0, 0.0)
local center	= osg.Vec3(0.0, 1.0, 0.0)
local up		= osg.Vec3(0.0, 0.0, 1.0)

local cameraManipulatorHMD = deviceHMD:createCameraManipulator()
cameraManipulatorHMD:setHomePosition(eye, center, up, false)
viewer:setCameraManipulator(cameraManipulatorHMD)
cameraManipulatorHMD:home(0.0)


local scene = reactorController:getReactorByName("Scene")
scene:subscribeEvent("onScreenClick", function()
	cameraManipulatorHMD:home(0.0)
end)



