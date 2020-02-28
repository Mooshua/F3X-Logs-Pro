# F3X-Logs-Pro
Repository documenting the F3X Logs Pro library (https://www.roblox.com/library/4737196519/F3X-Logs-Pro)

# Getting Started
F3X Logs pro works with just one line of code:
```lua
require(4737196519)
```
This will initialize the module and will automatically start logging any F3X tools used by users.

## Using the logs
Say `/console` in chat or use the shortcut Shift + F9.

# Methods
The F3X Logs module also has a few methods you can call for granular control.

```lua
local Logs = require(4737196519)

Logs:NewTools(parent)
```
## Logs:NewTools( instance:parent )
This creates new F3X tools and puts them in `parent`.
Returns the tools themselves.

```lua
local Logs = require(4737196519)

Logs:InitTools(tools)
```
## Logs:InitTools( instance:tools )
Initializes the tools for logging. Returns nil. All actions performed with those specific tools will be logged.

# Properties
The module has several properties you can use for fine control over the operation.

### Logs.Tool
Logs.Tool is the default F3X tool used for creating F3X tools. Do not set to nil.
This is gotten automatically, and is the latest version.

### Logs.Client
Logs.Client is a LocalScript that is given to every player to print the logs.

### Logs.Link
The RemoteEvent used for broadcasting formatted signals. Changing will not effect anything.

### Logs.Raw
The RemoteEvent used for broadcasting the raw table signals.

### Logs.AllToolsConnections
Don't mess with this.

### More documentation coming soon.
