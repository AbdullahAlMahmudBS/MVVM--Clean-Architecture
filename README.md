# Flutter MVVM Project

A Flutter application showcasing the Model-View-ViewModel (MVVM) architecture along with clean architecture principles.

## Project Structure

The project follows a structured architecture to maintain separation of concerns:

```
lib/
├── core/           # Core functionality and utilities
├── data/           # Data layer implementation
├── domain/         # Business logic and entities
├── presentation/   # UI components and view models
└── main.dart       # Entry point
```

### Core

Contains essential utilities and base classes that are used throughout the application:

- **di/**: Dependency injection setup using GetIt
- **constants/**: Application-wide constants
- **network/**: Network-related functionality including error handling
- **utils/**: General utility classes
- **theme/**: Theme-related configurations
- **routing/**: Application routing
- **base/**: Base classes for implementation consistency
- **services/**: Application services
- **widgets/**: Reusable widgets

### Data

Handles data operations and external sources:

- **datasources/**: Implements data retrieval from various sources
- **repositories/**: Repository implementations
- **models/**: Data models for serialization/deserialization
- **api/**: API endpoints

### Domain

Contains business logic and entities:

- **repositories/**: Repository interfaces
- **usecases/**: Business logic implementation
- **entities/**: Domain models

### Presentation

User interface components:

- **screens/**: Application screens
  - **splash/**: Splash screen
  - **products/**: Product-related screens
    - **product_details/**: Product details screen with ViewModel
    - **products_list/**: Product listing screen with ViewModel

## Architecture Overview

This project implements MVVM architecture with Clean Architecture principles:

1. **View Layer**: UI components (screens, widgets)
2. **ViewModel Layer**: Manages UI state and business logic
3. **Domain Layer**: Contains business logic and rules
4. **Data Layer**: Manages data operations and sources

## Key Features

- Clean separation of concerns with MVVM architecture
- Dependency injection using GetIt
- Navigation service for routing
- Base classes for consistency
- Error handling
- Product listing and detailed view

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)

### Installation

1. Clone the repository
   ```
   git clone https://github.com/yourusername/flutter_mvvm_prac_1_eu.git
   ```

2. Navigate to the project directory
   ```
   cd flutter_mvvm_prac_1_eu
   ```

3. Install dependencies
   ```
   flutter pub get
   ```

4. Run the app
   ```
   flutter run
   ```

## Dependencies

The project uses the following major dependencies:

- **dio**: For HTTP requests
- **get_it**: For dependency injection
- **flutter_bloc** or **provider**: For state management (based on implementation)

Check `pubspec.yaml` for a complete list of dependencies.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
