import 'package:flutter/material.dart';
import 'package:flutter_widget_exploration/presentation/screens/animation_screen.dart';
import 'package:flutter_widget_exploration/presentation/screens/physics_screen.dart';
import 'package:flutter_widget_exploration/presentation/screens/tasks_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const TasksScreen(),
    const PhysicsScreen(),
    const AnimationScreen(),
  ];

  final List<NavigationItem> _navigationItems = const [
    NavigationItem(
      icon: Icons.task_alt,
      label: 'Tasks',
      description: 'Interactive task management with drag & drop',
    ),
    NavigationItem(
      icon: Icons.scatter_plot,
      label: 'Physics',
      description: 'Drag and drop physics simulation',
    ),
    NavigationItem(
      icon: Icons.animation,
      label: 'Animation',
      description: 'Advanced animation sequences',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: _navigationItems
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                activeIcon: Icon(item.icon, size: 28),
                label: item.label,
                tooltip: item.description,
              ),
            )
            .toList(),
      ),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String label;
  final String description;

  const NavigationItem({
    required this.icon,
    required this.label,
    required this.description,
  });
}
