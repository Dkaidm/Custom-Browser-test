# Watte Sigma Browser

## Project Overview
Watte Sigma is a high-performance web browser built with Godot Engine and Chromium Embedded Framework (CEF). It focuses on resource efficiency, customization, and optimal performance while providing a modern browsing experience.

## Core Features

### Performance Optimization
- Frame rate control (60 FPS default)
- JavaScript heap size limitation (128MB)
- Aggressive memory management
- Image and media optimization
- Efficient resource utilization

### Search Engine Support
- Multiple search engine options:
  - Google
  - Bing
  - Naver

### Memory Management
- Tab limit enforcement (max 20 tabs)
- Automatic inactive tab cleanup (30-minute timeout)
- Smart cache management
- Memory usage tracking

### Cache System
- Configurable cache size (50MB default)
- Automatic cache cleanup (24-hour interval)
- Managed cache directory
- Persistent cache settings

### Browser Customization
- JavaScript enable/disable
- WebGL enable/disable
- Plugin management
- Frame rate control
- Memory limit settings
- Cache configuration
- Tab behavior settings

### Image and Media Handling
- Image size limits (2MB max)
- Automatic image scaling
- Media autoplay controls
- Responsive image fitting

## Technical Details

### Technology Stack
- Engine: Godot
- Browser Engine: Chromium Embedded Framework (CEF)
- Language: GDScript
- Platform: Windows

### Key Components
- **CEF.gd**: Core browser initialization and management
- **Settings.gd**: Configuration and settings management
- **TabManager.gd**: Tab lifecycle and memory management
- **SearchBar.gd**: Search engine integration

### Performance Features
- Disabled unnecessary features:
  - Media streaming
  - Speech input
  - Databases
  - Java
  - Plugins
- Optimized initialization parameters
- Resource-aware tab management
- Smart cache handling

### Configuration Options
```gdscript
browser_settings = {
    "enable_javascript": true,
    "enable_webgl": true,
    "enable_plugins": false,
    "enable_java": false,
    "frame_rate": 60,
    "memory_limit": 128,
    "cache_enabled": true,
    "cache_size": 50,  # MB
    "auto_clear_cache": true,
    "clear_cache_interval": 24,  # hours
    "image_optimization": true,
    "media_autoplay": false,
    "max_tabs": 20,
    "inactive_tab_timeout": 30  # minutes
}
```

## Future Improvements
- Advanced memory optimization
- Enhanced tab management
- More granular performance settings
- Security feature improvements
- Additional search engine integration
- Custom user scripts support

## Security Considerations
- Sandboxed browser instances
- Limited plugin access
- Controlled JavaScript execution
- Memory access restrictions
- Cache security measures
