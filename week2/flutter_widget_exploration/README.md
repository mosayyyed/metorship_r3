# Flutter Widget Exploration

A simple Flutter educational app with 3 main challenges to explore different widgets and interactions.

## App Structure

```
lib/
├── main.dart                              # App entry point
└── presentation/                          # Single presentation layer
    ├── main_navigation_screen.dart        # Bottom navigation
    ├── screens/                           # All app screens
    │   ├── tasks_screen.dart              # Tasks with Dismissible & ReorderableListView
    │   ├── physics_screen.dart            # Color matching drag & drop game  
    │   └── animation_screen.dart          # Loading dots animation
    └── widgets/                           # Reusable UI components
        ├── draggable_ball_widget.dart     # Physics game ball widget
        ├── drop_target_widget.dart        # Physics game drop target
        └── loading_dots_animation.dart    # Animation dots widget
```

## Features

### 1. Tasks Challenge (`screens/tasks_screen.dart`)
- ✅ **Task Model**: Simple inline class with id, title, isCompleted
- ✅ **ReorderableListView**: Drag to reorder tasks
- ✅ **Dismissible**: Swipe to delete with confirmation
- ✅ **Checkbox**: Toggle completion with strikethrough effect
- ✅ **Progress Counter**: Shows total/completed/remaining
- ✅ **State Management**: Simple setState with List<Task>

### 2. Physics Challenge (`screens/physics_screen.dart`)  
- ✅ **DragBall & DropContainer Models**: Inline color/name classes
- ✅ **Draggable Widget**: Custom ball widget for drag operations
- ✅ **DragTarget Widget**: Custom drop target with visual feedback
- ✅ **Animation Feedback**: Success/failure messages with animations
- ✅ **Game Logic**: Color matching validation and completion tracking
- ✅ **Reset Functionality**: Clear game state

### 3. Animation Challenge (`screens/animation_screen.dart`)
- ✅ **LoadingDotsAnimation Widget**: Custom sequential animation
- ✅ **Multiple AnimationControllers**: Independent dot animations
- ✅ **Play/Pause Controls**: Toggle animation state
- ✅ **Safe Animation Handling**: Proper dispose and mounted checks

## Architecture

**Clean Presentation Layer**
- Single `presentation/` folder structure
- `screens/` for main app screens
- `widgets/` for reusable UI components  
- Models defined inline in screens where needed
- Direct state management with StatefulWidget + setState
- No complex layers, repositories, or data sources
- Focus on widget implementation and UI interactions

## Key Learning Points

1. **Widget Mastery**: ReorderableListView, Dismissible, Draggable/DragTarget
2. **State Management**: Clean setState patterns for UI state
3. **Custom Animations**: AnimationController, Tween, CurvedAnimation
4. **Navigation**: BottomNavigationBar with IndexedStack  
5. **User Interactions**: Drag & drop, swipe gestures, confirmations
6. **Widget Architecture**: Separating screens from reusable widgets

## Running the App

```bash
flutter run
```

## Running Tests

```bash  
flutter test
```

All tests pass successfully with the clean presentation structure.
