# 1% Quiz

A Roblox quiz game where players test their knowledge and compete to be in the top 1%.

## Project Structure

```
src/
├── Client/           # Client-side scripts
│   ├── Core/        # Core client systems (EventHandler, Loader)
│   └── ClientModuleDirectory.luau
├── Server/          # Server-side scripts
│   ├── Core/        # Core server systems (EventHandler, Loader, Status, Config)
│   ├── Modules/     # Game logic modules
│   │   └── Round/   # Round management system
│   └── ServerModuleDirectory.luau
└── Shared/          # Shared utilities (Client & Server)
    ├── Data/        # Game data (Questions, etc.)
    └── Utilities/   # Helper modules (Logger, Timer, Queue, Set, etc.)
```

## Key Systems

### Module Directories
- **ClientModuleDirectory** - Central registry for all client modules
- **ServerModuleDirectory** - Central registry for all server modules
- **SharedModuleDirectory** - Central registry for shared utilities

### Server Core
- **ServerStatus** - Tracks server lifecycle states (loading, loaded, shutting_down)
- **ServerConfigurations** - Manages game configuration and settings
- **ServerLoader** - Safely loads and initializes all server modules
- **ValueBinder** - Manages player-specific data binding

### Shared Utilities
- **Logger** - Category-based logging with visibility controls
- **Queue/Set** - Data structure implementations
- **Timer** - Pausable, restartable timer utility
- **StringUtil/VectorUtil** - Formatting and serialization helpers

## Getting Started

### Prerequisites
- [Argon](https://argon.wiki/) - Roblox development tool

### Development Workflow

1. **Build the place** (generates .rbxl file):
   ```bash
   argon build
   ```

2. **Start syncing** with Roblox Studio:
   ```bash
   argon serve
   ```

3. Open Roblox Studio and connect to the Argon server

### Configuration

Before starting the server, configure game settings in your initialization code:

```lua
local ServerConfiguration = require(ServerModuleDirectory.Config)

ServerConfiguration.setupConfig({
    GROUP_ID = 34337368,
    MAX_FORCE = 500,
    IMPULSE_LENGTH = 0.05,
    STEP_LENGTH = 14
})
```

## Development Notes

- All modules include documentation strings at the top
- Module directories auto-validate paths on initialization
- Server uses OOP patterns with metatables for game objects (Round, ValueBinder, etc.)
- Shared utilities are accessible from both client and server contexts
