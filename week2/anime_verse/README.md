# AnimeVerse 🎌

A modern, pixel-perfect anime streaming UI app built with Flutter following Clean Architecture principles.

## 📋 Task Overview

This is a mini UI-only application that implements the exact design provided while following Clean Architecture principles. The app showcases a beautiful anime streaming interface with multiple screens and smooth animations.

## ✨ Features

- **Home Screen**: Featured anime collection with trending shows
- **Details Screen**: Comprehensive anime information with gradient backgrounds and action buttons
- **Upgrade Plan Screen**: Premium subscription plans with interactive selection
- **Responsive Design**: Pixel-perfect implementation using ScreenUtil
- **Smooth Animations**: Enhanced navigation bar animations with haptic feedback
- **Clean UI**: Modern design with gradients, shadows, and custom widgets

## 📱 Demo

https://github.com/user-attachments/assets/37f247d4-6158-46af-9c2f-a4893c906416

## 🏗️ Architecture Decisions

### Clean Architecture Structure
The app follows Clean Architecture principles with a well-organized folder structure:

```
lib/
├── main.dart
├── anime_verse_app.dart
└── src/
    ├── core/
    │   ├── routing/          # App navigation and routes
    │   ├── theming/          # Theme, colors, and styling
    │   └── widgets/          # Reusable UI components
    └── features/
        ├── details/
        │   └── presentation/
        │       ├── screens/
        │       └── widgets/  # Feature-specific widgets
        ├── home/
        │   └── presentation/
        │       ├── screens/
        │       └── widgets/
        ├── layout/
        │   └── presentation/
        │       ├── screens/
        │       └── widgets/
        └── upgrade_plan/
            └── presentation/
                ├── screens/
                └── widgets/
```

### Key Architectural Decisions

#### 1. **Feature-Based Structure**
- Each feature (home, details, upgrade_plan) is isolated in its own module
- Promotes code reusability and maintainability
- Easy to scale and add new features

#### 2. **Widget Separation**
- Complex screens are broken down into smaller, reusable widgets
- Each widget has a single responsibility
- Examples:
  - `BackgroundSpots` - Handles gradient background elements
  - `AnimeHeader` - Manages poster and logo display
  - `GenreButtons` - Interactive genre selection
  - `PlanOptions` - Subscription plan selection

#### 3. **Responsive Design**
- **ScreenUtil**: Used throughout for responsive dimensions
- Consistent scaling across different device sizes
- Proper use of `.w`, `.h`, and `.sp` extensions

#### 4. **Theme Management**
- Centralized theme configuration in `core/theming/`
- Consistent color schemes and gradients
- Easy to maintain and update visual styles

#### 5. **Clean Code Principles**
- Descriptive naming conventions
- Well-commented code sections
- Consistent formatting and structure
- No unused imports or dependencies

## 📱 Screens Overview

### 1. Home Screen
- **Features**: Anime poster grid, navigation bar, search functionality
- **Widgets**: `AnimePosterCard`, `TopCharactersSection`, `CustomNavBar`
- **Architecture**: Modular widget composition for easy maintenance

### 2. Details Screen
- **Features**: Hero poster, genre tags, statistics, description
- **Widgets**: `AnimeHeader`, `GenreButtons`, `AnimeStats`, `AnimeDescription`
- **Special Effects**: Gradient background spots with shadows

### 3. Upgrade Plan Screen
- **Features**: Subscription plans, pricing, continue button
- **Widgets**: `UpgradeBackground`, `UpgradeHeader`, `PlanOptions`
- **Interactions**: Plan selection with visual feedback

## 🛠️ Technologies & Packages

### Core Dependencies
- **Flutter SDK**: Latest stable version
- **flutter_screenutil**: Responsive design and scaling
- **flutter_svg**: SVG asset rendering
- **go_router**: Navigation and routing management

### Development Approach
- **State Management**: StatelessWidget for UI-only implementation
- **Asset Management**: Organized assets folder with vectors and images
- **Code Organization**: Feature-first architecture with clear separation

## 🎨 Design Implementation

### Pixel-Perfect Approach
- Exact color codes from design specifications
- Precise spacing and dimensions using ScreenUtil
- Custom gradients and shadow effects
- Smooth animations and transitions

### Visual Enhancements
- **Gradient Backgrounds**: Radial gradients for depth
- **Shadow Effects**: Multiple shadow layers for realistic appearance
- **Smooth Scrolling**: BouncingScrollPhysics for iOS-like feel
- **Haptic Feedback**: Enhanced user interaction experience

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- iOS Simulator or Android Emulator

### Installation
1. Clone the repository
```bash
git clone [repository-url]
cd anime_verse
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 📂 Project Structure Details

### Core Components
- **AppTheme**: Centralized styling and color management
- **CustomNavBar**: Enhanced navigation with animations
- **Routing**: Clean navigation structure with go_router

### Widget Architecture
Each screen follows a consistent pattern:
1. **Main Screen**: Entry point with Scaffold structure
2. **Background Components**: Gradient and decorative elements
3. **Content Widgets**: Modular UI components
4. **Action Components**: Buttons and interactive elements

## 🎯 Key Features Implemented

### Navigation Enhancement
- Smooth page transitions
- Haptic feedback integration
- Interactive bottom navigation bar
- Consistent app bar styling

### Responsive Design
- Adaptive layouts for different screen sizes
- Consistent spacing and typography scaling
- Proper asset sizing across devices

### Code Quality
- Clean Architecture principles
- Reusable widget components
- Consistent naming conventions
- Well-documented code structure

## 🔧 Architecture Benefits

1. **Maintainability**: Modular structure makes updates easy
2. **Scalability**: New features can be added without affecting existing code
3. **Testability**: Isolated widgets can be tested independently
4. **Reusability**: Components can be shared across features
5. **Team Collaboration**: Clear structure enables parallel development

## 📋 Deliverables Completed

- ✅ **Pixel-Perfect UI**: Exact match to provided design
- ✅ **Clean Architecture**: Proper folder structure and separation
- ✅ **Clean Code**: Well-organized, commented, and maintainable
- ✅ **README.md**: Comprehensive documentation
- ✅ **Demo Ready**: Fully functional app ready for demonstration

## 🎬 Demo Features

The app demonstrates:
- Smooth navigation between screens
- Interactive UI components
- Responsive design across devices
- Clean, modern interface
- Proper animation and feedback

---

**Built with ❤️ using Flutter and Clean Architecture principles**
