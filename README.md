# Flutter MVVM Project

A Flutter application showcasing the Model-View-ViewModel (MVVM) architecture along with clean architecture principles. This project demonstrates how to build scalable, maintainable, and testable Flutter applications by separating concerns and following industry best practices.

## Project Description

This application is built using Flutter with a focus on architectural excellence. It implements:

- **Clean Architecture**: Clear separation between presentation, domain, and data layers
- **MVVM Pattern**: Separation between UI and business logic using ViewModels
- **Dependency Injection**: Loose coupling between components using GetIt
- **Repository Pattern**: Abstracts data sources from the rest of the application
- **Use Cases**: Implements business logic in a reusable way
- **Error Handling**: Comprehensive error handling strategy

The application fetches product data from a remote API, displays a list of products, and allows users to view detailed information about each product.

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
  - `injection.dart`: Manages dependency instances
  - `app_injector.dart`: Provides access to the injector
  - `di_setup.dart`: Configures dependency registration

- **constants/**: Application-wide constants
  - `app_constant.dart`: Defines global constants used across the app

- **network/**: Network-related functionality
  - `error_handlers.dart`: Centralized error handling for network requests
  - `exceptions/`: Custom exception classes
  - `request_header.dart`: HTTP header configuration
  - `dio_provider.dart`: Configuration for Dio HTTP client

- **utils/**: General utility classes
  - `custom_dialog.dart`: Reusable dialog implementation

- **theme/**: Theme-related configurations
  - `color_palettes.dart`: App color definitions

- **routing/**: Application routing
  - `route_list.dart`: Defines available routes
  - `app_routes.dart`: Route implementation
  - `route_path.dart`: Route path constants
  - `app_router.dart`: Router configuration

- **base/**: Base classes for implementation consistency
  - `base_page_state.dart`: Base state for pages
  - `base_remote_source.dart`: Base implementation for remote data sources
  - `base_view_model.dart`: Base implementation for view models
  - `base_view.dart`: Base implementation for views
  - `base_response.dart`: Standard response format

- **services/**: Application services
  - `navigator/app_navigation_service.dart`: Navigation service implementation

- **widgets/**: Reusable widgets
  - `loader/app_loader.dart`: Loading indicator widget

### Data

Handles data operations and external sources:

- **datasources/**: Implements data retrieval from various sources
  - `product/`: Product data sources
    - `product_remote_datasource.dart`: Interface for product remote data
    - `product_remote_datasource_impl.dart`: Implementation of product remote data source

- **repositories/**: Repository implementations
  - `product/product_repository_impl.dart`: Implementation of product repository

- **models/**: Data models for serialization/deserialization
  - `product/`: Product-related models
    - `product_model.dart`: Data model for product list items
    - `product_details_model.dart`: Data model for detailed product information

- **api/**: API endpoints
  - `api_endpoints.dart`: Constants for API URLs

### Domain

Contains business logic and entities:

- **repositories/**: Repository interfaces
  - `product/product_repository.dart`: Interface defining product data operations

- **usecases/**: Business logic implementation
  - `product/`: Product-related use cases
    - `get_products_usecase.dart`: Retrieves list of products
    - `get_product_details_usecase.dart`: Retrieves detailed product information

- **entities/**: Domain models
  - `product/`: Product-related entities
    - `product.dart`: Domain entity for products
    - `product_details.dart`: Domain entity for detailed product information

### Presentation

User interface components:

- **screens/**: Application screens
  - **splash/**: Initial loading screen
    - `splash_screen.dart`: Splash screen implementation
  
  - **products/**: Product-related screens
    - **product_details/**: Product details screen
      - `product_details_screen.dart`: UI for product details
      - `view_model/product_details_view_model.dart`: ViewModel for product details
    
    - **products_list/**: Product listing screen
      - `products_viewmodel.dart`: ViewModel for product list
      - `products_list_screen.dart`: UI for product list
      - `widgets/product_item_widget.dart`: Individual product list item

## Architecture Overview

This project implements MVVM architecture with Clean Architecture principles:

1. **View Layer**: UI components (screens, widgets)
   - Responsible only for displaying data and capturing user interactions
   - Observes changes in the ViewModel and updates accordingly
   - No business logic in this layer

2. **ViewModel Layer**: Manages UI state and business logic
   - Acts as a mediator between View and Domain layers
   - Prepares and transforms data for presentation
   - Handles UI-related logic and state management
   - Communicates with Domain layer through Use Cases

3. **Domain Layer**: Contains business logic and rules
   - Pure Dart code with no dependencies on Flutter
   - Contains business entities, use cases, and repository interfaces
   - Represents the core business logic of the application

4. **Data Layer**: Manages data operations and sources
   - Implements repository interfaces from the Domain layer
   - Handles data retrieval, storage, and transformation
   - Communicates with external sources (API, database)

## Data Flow

1. User interacts with the UI
2. UI notifies the ViewModel
3. ViewModel executes appropriate Use Case
4. Use Case works with Repository
5. Repository returns data from the Data Source
6. Information flows back through the chain
7. ViewModel updates its state
8. UI reflects the updated state

## Key Features

- Clean separation of concerns with MVVM architecture
- Dependency injection using GetIt for better testability
- Navigation service for centralized routing
- Base classes for consistency across implementations
- Comprehensive error handling
- API integration for product data
- Product listing and detailed view

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- IDE: VS Code, Android Studio, or IntelliJ IDEA

### Installation

1. Clone the repository
   ```
   git clone https://github.com/AbdullahAlMahmudBS/flutter_mvvm_prac_1_eu.git
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

- **dio**: For HTTP requests and API communication
- **get_it**: For dependency injection and service location
- **provider** or **flutter_bloc**: For state management
- **json_serializable**: For JSON serialization/deserialization
- **equatable**: For equality comparisons

Check `pubspec.yaml` for a complete list of dependencies.

## Testing

The project structure supports different types of tests:

- **Unit Tests**: For testing individual components (ViewModels, Use Cases, etc.)
- **Widget Tests**: For testing UI components
- **Integration Tests**: For testing feature flows

Run tests using:
```
flutter test
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- Flutter team for the amazing framework
- Clean Architecture principles by Robert C. Martin (Uncle Bob)
- MVVM pattern for separation of concerns
