
# AutoScrollIntro Flutter Package

The **AutoScrollIntro** Flutter package provides a versatile and animated onboarding screen widget tailored for Flutter applications. This package streamlines the creation of captivating introduction screens by seamlessly integrating automatic scrolling, background images, dynamic text animations, and a customizable avatar. Developers can effortlessly incorporate this package to elevate user onboarding experiences, crafting visually captivating and interactive introductory interfaces.

## Key Features

- **Automatic Scrolling:** Achieve an engaging user experience with built-in automatic scrolling, guiding users through your content effortlessly.

- **Background Images:** Present a visually appealing backdrop using customizable background images, enhancing the overall aesthetic of the introduction.

- **Animated Text Elements:** Integrate animated text effects to dynamically reveal titles and descriptions, captivating user attention and enhancing visual appeal.

- **Customizable Avatar:** Enhance personalization with a customizable avatar, offering an interactive touch to the introduction screen.

- **Tailored Customization:** Fine-tune the onboarding screen's appearance and behavior to seamlessly match your app's branding and design.

## Usage

1. Install the package:

   ```yaml
   dependencies:
     auto_scroll_intro: ^1.0.0
   ```

2. Import the package:

   ```dart
   import 'package:auto_scroll_intro/auto_scroll_intro.dart';
   ```

3. Incorporate the `AutoScrollIntro` widget within your app's structure, providing the required parameters for background images, titles, descriptions, and more.

4. Customize properties, including text styles, avatar settings, background colors, and scrolling duration to align with your app's design.

## Example

```dart
AutoScrollIntro(
  imageList: [...],
  title: 'Welcome to MyApp',
  description: 'Explore the features that MyApp offers.',
  avatar: 'assets/avatar.png',
  // ... other customizable properties
)
```

## Contributions

Contributions are welcome! If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request on the [GitHub repository](https://github.com/anjaneykumar7/auto_scroll_intro).

## License

This package is licensed under the [MIT License](LICENSE).

---

Let your users embark on a captivating journey with the **AutoScrollIntro** package. Enhance your app's onboarding process effortlessly and leave a memorable first impression.
```