# Godot Preview

**A project that shows how to render high-quality "offline" videos with Godot.**

## Example output

[![Preview](https://thumbs.gfycat.com/MemorableUncommonCrownofthornsstarfish-small.gif)](https://gfycat.com/memorableuncommoncrownofthornsstarfish)

*Click for higher quality.*

## Installation

**This demo currently requires
[Godot 3.1](https://godotengine.org/)
or later.**

- Clone this repository.
- Import this project in Godot.

## Usage

When run *outside of the editor*, frames will be rendered and saved to
PNG images in the `out/` directory located in the project data directory.
These can be combined into a video using [FFmpeg](https://ffmpeg.org/)
by running the following command while in the `out/` directory:

```bash
ffmpeg -r 60 -f image2 -s 2560x1440 -i %d.png -vcodec libx264 -crf 15 video.mp4
```

```bash
ffmpeg -i %d.png video.mp4
```

## Visual diff

```
npm install --global reg-cli
reg-cli.cmd .\out\ .\expected\ .\diff\ -R report.html -J report.json
```

## License

Copyright © 2019 Hugo Locurcio and contributors

- Unless otherwise specified, files in this repository are licensed under
  the MIT license; see [LICENSE.md](LICENSE.md) for more information.
- The Suzanne model was taken from the
  [glTF samples repository](https://github.com/KhronosGroup/glTF-Sample-Models/tree/master/2.0/Suzanne).
- https://hdrihaven.com/hdri/?c=studio&h=studio_small_03
