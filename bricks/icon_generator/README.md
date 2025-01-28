# Icon Generator Brick 🎨

A Mason brick to help you generate app icons and splash screen for your Flutter project.

## Installation 🚀

Add the brick to your project using Mason CLI:

```bash
mason add icon_generator --path ../../bricks/icon_generator
```

## Setup ⚙️

1. Run the following command to fetch dependencies:

   ```bash
   mason get
   ```

2. Make sure to add your desired icon assets to the project before proceeding.

## Usage 🔨

Generate your icons by running:

```bash
mason make icon_generator
```

## Icon Specifications 📐

### App Icon Requirements

- Dimensions: 1024px × 1024px
- Format: JPG

### Splash Icon Requirements

The app icon without an icon background should follow these specifications:

- Dimensions: 1152×1152 pixels
- Must fit within a circle 768 pixels in diameter
- Important design elements should be placed within a circular area with a 768-pixel diameter at the center of the 1152×1152 canvas

## Important Notes 📝

- **Prerequisites**: Ensure all required assets are placed in your project before running the brick

## Troubleshooting 🔧

If you encounter any issues:

1. Verify that all paths are correct
2. Ensure Mason CLI is properly installed
3. Check that your assets meet the required specifications

## Contributing 🤝

Feel free to submit issues and enhancement requests!
