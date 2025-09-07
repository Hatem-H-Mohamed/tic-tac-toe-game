# Tic-Tac-Toe Game

A classic Tic-Tac-Toe game built with Flutter. This application provides a simple and visually appealing interface for two players to compete.

## Features

*   **Player Selection:** Choose whether to start as 'X' or 'O' from the home screen.
*   **Game Timer:** A timer tracks the duration of each game.
*   **Turn Indicator:** Clearly displays whose turn it is ('X' or 'O').
*   **Win/Draw Detection:** The game automatically detects winning moves and draw conditions.
*   **End-Game Summary:** A dialog appears at the end of the game, announcing the winner or if it's a draw, and displays the total game time.
*   **Play Again:** Easily restart a new game after one concludes.
*   **Custom UI:** A vibrant gradient background and custom SVG icons for a polished user experience.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Ensure you have the Flutter SDK installed on your machine. For installation instructions, see the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/hatem-h-mohamed/tic-tac-toe-game.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd tic-tac-toe-game
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the application:**
    ```sh
    flutter run
    ```

## Project Structure

The core application logic is located in the `lib/` directory.

```
lib/
├── core/
│   ├── app_assets/
│   │   └── app_assets.dart    # Centralizes asset paths
│   └── theme/
│       └── app_colors.dart    # Defines the application's color palette
├── screens/
│   ├── home_screen.dart       # The initial screen for player selection
│   └── play_screen.dart       # The main game board screen and logic
├── widgets/
│   └── gradient_scaffold.dart # A reusable scaffold with a gradient background
└── main.dart                  # The entry point of the application
```

*   **`main.dart`**: The entry point for the Flutter application.
*   **`core/`**: Contains shared application code, including asset constants and theme colors.
*   **`screens/`**: Holds the primary screens of the application, such as the home screen and the game screen.
*   **`widgets/`**: Contains reusable UI components used across different screens.
