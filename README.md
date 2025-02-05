# Bussin Wattesigma

<img style="width: 128px; height: 128px" src="Website\static\favicon.png" />



https://github.com/user-attachments/assets/192a330c-4102-4b84-b50d-1f1698d87fa7



The ultimate web browser, built with a game engine.

https://wattesigma.com

## About

Bussin Wattesigma is a web browser built with the Godot Engine and powered by the Chromium Embedded Framework (CEF). It revolutionises the web browsing experience by allowing you to use **shaders** and a bunch of other stuff that is supposed to "entertain" you.

## Setup and Installation

### Pre-built
Please download **Bussin Wattesigma** from the [Releases](https://github.com/face-hh/wattesigma/releases) tab.

### Compiling
#### 🪟 Windows
You will need:
- [Godot Engine](https://godotengine.org/) (version 4.x or later)
- [CEF (Chromium Embedded Framework)]([https://github.com/face-hh/wattesigma/releases](https://github.com/Lecrapouille/gdcef/releases/tag/v0.12.1-godot4)) (`cef_artifacts`)

### Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/face-hh/wattesigma.git
   ```

2. Open the project in Godot Engine.

3. Configure CEF:
   - Download the `cef_artifacts` file off the [Releases](https://github.com/Lecrapouille/gdcef/releases/tag/v0.12.1-godot4) from the `gdcef` repository.
   - Extract the contents to the project root. You should have the folders `cef_artifacts, Website, Assets, Shaders, ...`

4. Run the project from the Godot editor or export it for your target platform.
#### 🐧 Linux
Written by mxjeonsgw

**First** download the Godot 4 engine release for Linux, it's in a .tar.gz file, and its contents are just the executable, uncompress it wherever you want but somewhere reachable, maybe in /opt/Godot if you will, but you can do it in the desktop as well.

**Second** git clone the wattesigma project (you can add --depth=1 to the command line to not download all the commit history bundled, but you can open the GitHub repo page and download everything as a zip, it doesn't matter)

**Third** search for Linux's GDCEF artifacts (the ones I used are Lecrapouille/gdcef, download the last release (it's called "gdcef-artifacts-godot_4-linux_x86_64.tar.gz))

**Fourth** Uncompress the artifacts, copying (or moving) the `cef_artifacts` folder inside the wattesigma folder at the root of the folder specifically.

**Fifth** Open Godot, and import the wattesigma folder.

**Sixth** Go to Project/Export... and try to export it for Linux/X11, it'll fail at first because it misses the export templates, just do it, the pop up has the download button, it'll download the whole 1GB thing and install it by itself, just reach a coffee or touch some grass.

**Seventh** Go to Project/Export... again, and export it to Linux/X11, it will finally export, dropping a file named around "CEFgd.x86_64" in the folder's root, run it and there you go.

## Considerations
- You can't pull out the binary outside the project folder, it depends on everything there, assets, libraries and the artifacts, just move the entire folder wherever you want, but the whole project folder, otherwise it won't run adequately.
- When you run it, it might cry about Vulkan incompatibility if your Linux kernel hates your computer, just dismiss it, it will run nonetheless, it defaults to opengl3 I think, but it works.
  
## Usage

- Launch the Bussin Wattesigma browser
- If run for the first time, you'll be greeted with a welcome page.
- Press `CTRL` + `I` for all the available shortcuts.
- Press `CTRL` + `L` and enter a URL in the address bar.
- Press `CTRL` + `S` to change some settings.

## Contributing

We welcome contributions to Bussin Wattesigma! Please keep the following in mind:

- Open an issue before starting work on major changes or new features, as it may create conflicts with existing pull requests, or the rewrite you wish to do isn't needed.
- Follow the existing code style and conventions.
- Write clear, concise commit messages.
- Update documentation as needed.

## License

This project is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE.md) file for details.

## Acknowledgments

- The Godot Engine community
- The [gdcef](https://github.com/Lecrapouille/gdcef) project contributors

Created with skibidi by facedev
