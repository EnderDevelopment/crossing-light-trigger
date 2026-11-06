# Roblox Crossing Light Trigger Script

Crossing Light Trigger is a Roblox script that activates a crossing light when a part named `train` touches it. It detects contact with parts inside `CrossingLight` instances in `Workspace` and sets the matching light’s `on` BoolValue to `true`.

## Install

1. In Roblox Studio, add a server `Script` to `ServerScriptService`.
2. Copy the contents of `CrossingLightController.server.lua` into the Script.
3. Add a `BasePart` named `train` directly under `Workspace`.
4. Add each crossing light under `Workspace` as an instance named `CrossingLight`. Put its light parts and a `BoolValue` named `on` inside it.

## Use

Start the game with the server Script enabled. When `train` touches a part inside a `CrossingLight`, that light’s `on` value is set to `true`. The script enables `CanTouch` on the train and crossing-light parts, so they can register touch events even when `CanCollide` is false. The value is not reset by this script.

---

More Roblox script projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/e1928a7f-1473-4ded-bec6-3db9989a9fd2?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=e1928a7f-1473-4ded-bec6-3db9989a9fd2
