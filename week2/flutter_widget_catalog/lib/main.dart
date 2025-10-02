import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const WidgetCatalogHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WidgetInfo {
  final String title;
  final String description;
  final IconData icon;
  final Widget page;

  WidgetInfo({
    required this.title,
    required this.description,
    required this.icon,
    required this.page,
  });
}

class WidgetCatalogHome extends StatelessWidget {
  const WidgetCatalogHome({super.key});

  static final List<WidgetInfo> widgets = [
    WidgetInfo(
      title: 'Autocomplete',
      description: 'Text input with automatic suggestions',
      icon: Icons.search,
      page: const AutocompleteDemo(),
    ),
    WidgetInfo(
      title: 'Interactive Viewer',
      description: 'Zoom and pan content interactively',
      icon: Icons.zoom_in,
      page: const InteractiveViewerDemo(),
    ),
    WidgetInfo(
      title: 'Absorb Pointer',
      description: 'Prevents interaction with widgets behind it',
      icon: Icons.block,
      page: const AbsorbPointerDemo(),
    ),
    WidgetInfo(
      title: 'Semantics',
      description: 'Hidden widget for accessibility features',
      icon: Icons.accessibility,
      page: const SemanticsDemo(),
    ),
    WidgetInfo(
      title: 'Custom Paint',
      description: 'Draw custom shapes and digital art',
      icon: Icons.brush,
      page: const CustomPaintDemo(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Widget Catalog',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: widgets.length,
          itemBuilder: (context, index) {
            final widget = widgets[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widget.page),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// Demo Pages
class AutocompleteDemo extends StatefulWidget {
  const AutocompleteDemo({super.key});

  @override
  State<AutocompleteDemo> createState() => _AutocompleteDemoState();
}

class _AutocompleteDemoState extends State<AutocompleteDemo> {
  final List<String> options = [
    'Apple',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
    'Watermelon',
    'Grapes',
    'Mango',
    'Peach',
    'Cherry',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autocomplete Demo'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.blue),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Start typing a fruit name to see suggestions appear',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Search for fruits:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return options.where((String option) {
                  return option.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  );
                });
              },
              onSelected: (String selection) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('✅ Selected: $selection'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              fieldViewBuilder: (context, controller, focusNode, onSubmitted) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Type fruit name...',
                    hintText: 'e.g., Apple, Banana',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Available Options:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: options.map((fruit) {
                return Chip(
                  label: Text(fruit),
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                );
              }).toList(),
            ),
            const Spacer(),
            const Card(
              color: Colors.lightBlue,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Autocomplete:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Autocomplete widget provides text input with automatic suggestions. It\'s commonly used in search fields, forms, and anywhere you want to help users complete their input quickly.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class AbsorbPointerDemo extends StatefulWidget {
  const AbsorbPointerDemo({super.key});

  @override
  State<AbsorbPointerDemo> createState() => _AbsorbPointerDemoState();
}

class _AbsorbPointerDemoState extends State<AbsorbPointerDemo> {
  bool isAbsorbing = true;
  int tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absorb Pointer Demo'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.touch_app, size: 30),
                        const SizedBox(height: 8),
                        Text(
                          'Taps: $tapCount',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          isAbsorbing ? Icons.block : Icons.check_circle,
                          size: 30,
                          color: isAbsorbing ? Colors.red : Colors.green,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          isAbsorbing ? 'PROTECTED' : 'OPEN',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isAbsorbing ? Colors.red : Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isAbsorbing 
                  ? '🚫 Try tapping any button - they are all blocked!'
                  : '✅ Try tapping the buttons - they should work normally',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              isAbsorbing
                  ? 'AbsorbPointer is covering the entire area'
                  : 'AbsorbPointer is disabled - touches go through',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: AbsorbPointer(
                  absorbing: isAbsorbing,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: isAbsorbing
                          ? Colors.red.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        // Buttons that will be affected by AbsorbPointer
                        Positioned(
                          top: 20,
                          left: 20,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[100],
                              elevation: isAbsorbing ? 0 : 2,
                            ),
                            onPressed: () {
                              setState(() {
                                tapCount++;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('🔵 Button 1 pressed!'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Text('🔵 Button 1'),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[100],
                              elevation: isAbsorbing ? 0 : 2,
                            ),
                            onPressed: () {
                              setState(() {
                                tapCount++;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('🟢 Button 2 pressed!'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Text('🟢 Button 2'),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange[100],
                              elevation: isAbsorbing ? 0 : 2,
                            ),
                            onPressed: () {
                              setState(() {
                                tapCount++;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('🟠 Button 3 pressed!'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Text('🟠 Button 3'),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple[100],
                              elevation: isAbsorbing ? 0 : 2,
                            ),
                            onPressed: () {
                              setState(() {
                                tapCount++;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('🟣 Button 4 pressed!'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Text('🟣 Button 4'),
                          ),
                        ),
                        // Center indicator
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: isAbsorbing
                                  ? Colors.red.withOpacity(0.8)
                                  : Colors.green.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isAbsorbing ? Colors.red : Colors.green,
                                width: 3,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isAbsorbing ? Icons.block : Icons.touch_app,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  isAbsorbing ? 'ABSORBING' : 'ALLOWING',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  isAbsorbing
                                      ? 'All touches blocked'
                                      : 'All touches allowed',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Visual overlay when absorbing
                        if (isAbsorbing)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  '❌ TOUCH BLOCKED ❌',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  isAbsorbing = !isAbsorbing;
                });
              },
              icon: Icon(isAbsorbing ? Icons.lock_open : Icons.lock),
              label: Text(isAbsorbing ? 'Disable Protection' : 'Enable Protection'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isAbsorbing ? Colors.green : Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.blue[50],
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'AbsorbPointer blocks touch events from reaching widgets beneath it. Perfect for creating modal overlays, disabling sections of UI, or implementing special interaction modes.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SemanticsDemo extends StatefulWidget {
  const SemanticsDemo({super.key});

  @override
  State<SemanticsDemo> createState() => _SemanticsDemoState();
}

class _SemanticsDemoState extends State<SemanticsDemo> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semantics Demo'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              color: Colors.amber[50],
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.accessibility_new, size: 30, color: Colors.blue),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Accessibility Feature',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Each button has semantic information for screen readers',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Choose your favorite category:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Semantics(
              label: 'Technology category button',
              hint: 'Double tap to select technology as your favorite category',
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedOption == 'Technology' 
                        ? Colors.blue 
                        : Colors.blue[100],
                    foregroundColor: selectedOption == 'Technology' 
                        ? Colors.white 
                        : Colors.blue[800],
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Technology';
                    });
                  },
                  icon: const Icon(Icons.computer, size: 24),
                  label: const Text(
                    'Technology 💻',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Semantics(
              label: 'Sports category button',
              hint: 'Double tap to select sports as your favorite category',
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedOption == 'Sports' 
                        ? Colors.green 
                        : Colors.green[100],
                    foregroundColor: selectedOption == 'Sports' 
                        ? Colors.white 
                        : Colors.green[800],
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Sports';
                    });
                  },
                  icon: const Icon(Icons.sports_soccer, size: 24),
                  label: const Text(
                    'Sports ⚽',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Semantics(
              label: 'Music category button',
              hint: 'Double tap to select music as your favorite category',
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedOption == 'Music' 
                        ? Colors.purple 
                        : Colors.purple[100],
                    foregroundColor: selectedOption == 'Music' 
                        ? Colors.white 
                        : Colors.purple[800],
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Music';
                    });
                  },
                  icon: const Icon(Icons.music_note, size: 24),
                  label: const Text(
                    'Music 🎵',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (selectedOption.isNotEmpty)
              Semantics(
                label: 'Your selection result',
                child: Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle, color: Colors.green, size: 30),
                        const SizedBox(width: 12),
                        Text(
                          'Selected: $selectedOption',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const Spacer(),
            Card(
              color: Colors.indigo[50],
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Semantics Widget:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Semantics widget provides accessibility information to screen readers and other assistive technologies. It adds labels, hints, and descriptions that help users with disabilities navigate and use the app effectively.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class InteractiveViewerDemo extends StatelessWidget {
  const InteractiveViewerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Viewer Demo'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondaryContainer,
            padding: const EdgeInsets.all(16),
            child: const Column(
              children: [
                Icon(Icons.pan_tool, size: 30),
                SizedBox(height: 8),
                Text(
                  '👆 Pinch to zoom • 👆 Drag to pan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Try interacting with the content below',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.3,
                maxScale: 5.0,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[50]!, Colors.purple[50]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Grid background
                      ...List.generate(20, (i) => 
                        Positioned(
                          left: i * 100.0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 1,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      ...List.generate(20, (i) => 
                        Positioned(
                          top: i * 100.0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 1,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      // Content
                      const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.zoom_in, size: 60, color: Colors.blue),
                            SizedBox(height: 20),
                            Text(
                              '🔍 Zoomable Content!',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Pinch to zoom in and out',
                              style: TextStyle(fontSize: 18, color: Colors.purple),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.star, size: 40, color: Colors.orange),
                                    Text('⭐ Item 1', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.favorite, size: 40, color: Colors.red),
                                    Text('❤️ Item 2', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.diamond, size: 40, color: Colors.cyan),
                                    Text('💎 Item 3', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      '📋 Details Panel',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Zoom in to see more details!\nThis content scales with your gestures.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue[50],
            padding: const EdgeInsets.all(16),
            child: const Text(
              'InteractiveViewer enables pan and zoom gestures on any widget. Perfect for images, maps, charts, or any content that benefits from detailed inspection.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPaintDemo extends StatefulWidget {
  const CustomPaintDemo({super.key});

  @override
  State<CustomPaintDemo> createState() => _CustomPaintDemoState();
}

class _CustomPaintDemoState extends State<CustomPaintDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Paint Demo'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.green[50],
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.palette, size: 30, color: Colors.green),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Custom Canvas Drawing',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Drawing shapes, lines, and patterns with code',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[400]!, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomPaint(
                      size: const Size(300, 300),
                      painter: SimplePainter(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 4),
                    const Text('Rectangle', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('Circle', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 3,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 4),
                    const Text('Line', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.orange],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('Gradient', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.purple[50],
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About CustomPaint:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'CustomPaint widget allows you to draw directly on a canvas using code. Perfect for creating charts, graphs, custom icons, games, and artistic visual effects that can\'t be achieved with regular widgets.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Enhanced Painter with multiple visual elements
class SimplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Background gradient
    final gradientPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.purple, Colors.orange, Colors.pink],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawRect(
      Rect.fromLTWH(20, 20, size.width - 40, size.height - 40),
      gradientPaint,
    );

    // Blue border rectangle
    final borderPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(20, 20, size.width - 40, size.height - 40),
        const Radius.circular(12),
      ),
      borderPaint,
    );

    // Central red circle
    final circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      35,
      circlePaint,
    );

    // White circle border
    final circleStroke = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      35,
      circleStroke,
    );

    // Green diagonal line
    final linePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    
    canvas.drawLine(
      Offset(30, 30),
      Offset(size.width - 30, size.height - 30),
      linePaint,
    );

    // Corner decorative circles
    final cornerPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    // Top-right corner
    canvas.drawCircle(Offset(size.width - 40, 40), 15, cornerPaint);
    
    // Bottom-left corner  
    canvas.drawCircle(Offset(40, size.height - 40), 15, cornerPaint);

    // Draw some stars
    _drawStar(canvas, Offset(size.width * 0.25, size.height * 0.25), 20, Colors.white);
    _drawStar(canvas, Offset(size.width * 0.75, size.height * 0.75), 15, Colors.cyan);
  }

  void _drawStar(Canvas canvas, Offset center, double radius, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    const int points = 5;
    final double outerRadius = radius;
    final double innerRadius = radius * 0.4;
    
    for (int i = 0; i < points * 2; i++) {
      final double angle = (i * math.pi / points) - (math.pi / 2);
      final double currentRadius = (i % 2 == 0) ? outerRadius : innerRadius;
      final double x = center.dx + currentRadius * math.cos(angle);
      final double y = center.dy + currentRadius * math.sin(angle);
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
