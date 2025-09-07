# Foe - Flutter Word Guessing Game

A Flutter word guessing game where teams compete by describing words without using forbidden terms.

## Description

Foe is an interactive word guessing game where players are divided into teams and must guess words based on descriptions provided by their teammates. The game includes different rounds with varying rules and a timer-based scoring system.

## Features

- **Team-based gameplay**: Support for 2-3 teams
- **Configurable settings**: 
  - Number of teams (2-3)
  - Number of words (30-60)
  - Round time (30-60 seconds)
- **Multiple game rounds**: Different gameplay modes for variety
- **Audio feedback**: Sound effects for correct/incorrect answers and victory
- **Statistics tracking**: Points tracking across rounds
- **Animated UI**: Smooth fade animations throughout the app

## Requirements

- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.12.0)
- Android/iOS device or emulator

## Installation

1. **Install Flutter**: Follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install)

2. **Clone the repository**:
   ```bash
   git clone https://github.com/dijad/Foe.git
   cd Foe
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

## Game Rules

### Round 1: Description
- Teams must guess the word based on verbal descriptions
- No similar words, translations, or spelling allowed
- Each wrong guess subtracts 5 seconds from the timer

### Round 2: Gestures/Mime
- Teams must guess based on gestures and movements
- No verbal communication allowed

### Round 3: One Word
- Teams can only use one word to help their teammates guess

## Technical Details

### Fixed Issues (Latest Update)
- ✅ Updated simple_animations package from v1.3.3 to v5.0.2
- ✅ Fixed deprecated AppBar brightness property across all views
- ✅ Fixed critical random number generation bug in word selection
- ✅ Implemented null safety compliance throughout the codebase
- ✅ Updated Flutter SDK requirement to support modern features
- ✅ Fixed constructor declarations and parameter passing
- ✅ Added proper error handling and null checks

### Dependencies
- `simple_animations: ^5.0.2` - For UI animations
- `circular_countdown_timer: ^0.2.0` - Timer functionality
- `numberpicker: ^2.1.1` - Settings configuration
- `just_audio: ^0.7.4` - Sound effects
- `stepo: ^1.0.0` - Additional UI components

### Project Structure
```
lib/
├── animation/          # Animation components
├── backend/           # Game logic and data models
├── utilities/         # Helper classes and utilities
├── view/             # UI screens and components
└── main.dart         # App entry point
```

## Development Notes

- The app uses a linked list structure for team management
- Word selection uses a random algorithm with duplication prevention
- All audio assets are included in the `assets/sounds/` directory
- Custom fonts (Lobster, Roboto) are included for consistent styling

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Assets Credits

- Fonts: Lobster, Roboto
- Images: Custom game-themed illustrations
- Sounds: Game audio effects for interactions
