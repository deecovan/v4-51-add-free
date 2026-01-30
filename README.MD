# v4-51-add-free GitHub repo 

## 25.30.1 Begin Squares 
- Create LightTimer in DarkSky environment scene
- 1x1x200m with 3 materials seems
- Create proto 200m Height0 track
- Exported first group 
- Built first 2m base

## 25.29.1 Start Cource selector with Loader
- Pre-test Cowls cars on AirBag track 
  - Looks like similar timings
- Add AirBag and AirBack to loader
- Continue loader branch

## 25.29.1 Start Implement Settings 
- Added OnBoard cameras with C key switcher
- Updated Cowl cabine to use cameras
- Updated Cowl wheels to use Kamber and Toe
- Finished polishing Cowl Back
  - Cowl Back and Base tested, seems similar in time
- Added 4 Rams to Cowl Base
  - Tested for 1:09
  - Synchronized settings:
    - Curves
    - Wheels and rams
- Added Engine Mass and Inertia
- Applied Custom Forces to the CENTERS
- Tested similar Cowls: 1:05 both

## 25.28.1 New GearBox
- @NEW engine's gearbox coefficients applied to curve's values
  - Changed linear_velocity to local_velocity.z
  - @NEW s_scale_rpm to use new scaled values and curves
  - Calculated scale_RPM
  - Fixed Sixth Gear
  - Tested Cowl Base new GearBox
  - Cowl Back modified according to new gearbox

## 25.27.1
- Tested AirBag track 
- Update Horsa setup 1:00 RCR lap 
- Added New SkyMaps
- Added two Cowls (constructor) Base and Back versions
  - Base and Back versions
- Updated Cowl parts to begin Constructor
- Updated Cowls for 0.55 RCR

## 25.25.1
- New track U0 
- Horsa rebalanced for 3:30

## 25.20.1
- New Ran sounds
- Horsa Updated Scripts and Sounds
- Added Cup track
- Fixed REVERSING in Fanta and Horsa
- Horsa improved:
  - Collisions from boxes
  - Bounce 0.5 Rought
- Tab area updated: 
  - Added collision_timer to awoid doubles

## 25.19.1
- New Fanta values
- Added New SkyBoxes
- Added Kenney Industrial, Commercial and Suburban
- Placed Builds, Trees, Fences

## 25.19.1
- @TODO 
  - Fix Braking errors
  - Add OnTop and Glass fixed cameras
  - Add digital Gears and Speed
  - Try FakeWheels to get wheel Alpha

## 25.1.11 GearBox values
- Engine sound ready 
- Improved Tachometer
- Added Racing Wheel
- Added GearBox: 
  - Speed Map for Gears
  - Curve with ratios from gears
- Normalized Curve, Max.Speed, Gears 
- Added Brake and Accelerate pedals
- Added body rotation 
- Added Alpha Angle and Velocity 
  - Used linear_velocity transform.basis
- Finished with Alpha

- Implemented GearBox values
  - Indicator first
  - Sound second
  * Gearbox Physics maybe later

## Fixed Fanta for stability
- Changed COM
- Changed Gimbal speed
- Changed Steer Return speed

## 25.1.10 Improve Gimbal 
- Remove FOV changes
- Fix Initial on Minimum

## 25.1.7 Start Corner Cuts
- 30 min each as minimum
- 0.01 - 0.06 cm works good
- 2m width works good

## Add Car loader on Spa Short
1. Add Tab and TabArea on Spa Short
  - Use Collision Layer 2!
2. Test Cars 
  - Normalize but leave differences
  - All cars near 74.00 medium
  - Tested Cars beat 74.00
  - Spa Long on keyboard CHERO 3.59.53
- Add Car Loader
- Modify Tab to use sectors

## 26.1.5 Improve Spa Long and Chero 6600
- Update physics
  - Remove squared linear friction
  - lower Steering higher Coasting
- Improve Spa Short
  - Use chanks
  - Apply All 6600's cars 

## 26.1.1 bad day
- Add Alt-Control 
- Modify controls 
- Drop engine on braking starts
- Change redundant lerp to move_tovard
- Add Additional Forces: bodyLinearFric
- Test Alt-Control
- Checkout Horsa script
- Chero tested on Spa Long 
  - looks good

## 25.12.30 Steering by Mouse was bad idea
- Or i cant implement it to be well usable

## 25.12.30 New track Spa Full (Short and Long)
- Short 2400m
- Long 7700m
- Less banana's height
- Colored banana

## 25.12.30 New car Chero 6600 (need to work more)
- Bad faces, maybe need to rotate verticles normals
- Bad angles, somewhere looks loke damaged body
- Without glasses and radiator
- Godot cant use generated collision, why?

## 25.12.29 Horsa 6600 tuned for Spa 
- Placed to all tracks
- Physics, Drag and Air tuned for Spa

## 25.12.28 New car Horsa 6600
- Body in Red color
- Front and Rear Wheels
- Update UI and Loader overlays
- Update Gimbal
- Fix Fanta 6600 in Spa
  - Copy to Horsa
  - @FIXED ZC's AeroDrag force rotating
- Tag F6600-copy

## Fanta 6600 AeroDrag
- To deploy: ZC's AeroDrag
- Also try to use cY like cX
  - Testing Using AerDyn Force

## Fanta 6600 update 
- New Body
- New Wheels
  - Also for F3300
- New parameters
  - \_ready and \_process from F3300
  - New parameters for 1t\*1g

## Continue Loader
- Preload and instatiate scenes
* Select car

## Add One track without loader
- Add Thor track
- Change structure
- Test with Razval/Skhozhd

## New skies with Sun
- Add Sun into Sunlight 

## Add Menus and Buttons
- Check signals, names, labels
- Test sequences

## Try Chunk Terrain with HeightMapShape3D

## Next add one Scene with one Car
- Minimal (table) scene
- One Fanta500
- Dashboard
  - Move car Dashboard and log into the Vehicle
  - Leave track info UI into the scene

## Add Blank with Loader and Theme
- Create own Theme
- Free fonts
- Light colors, prefered white BG