import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final bool isCompleted;

  const Task({required this.id, required this.title, this.isCompleted = false});

  Task copyWith({String? id, String? title, bool? isCompleted}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(id: '1', title: 'Learn Flutter Basics'),
    Task(id: '2', title: 'Practice Widgets'),
    Task(id: '3', title: 'Build Your First App'),
    Task(id: '4', title: 'Understand State Management'),
    Task(id: '5', title: 'Explore Animations'),
  ];

  void _toggleTaskCompletion(String id) {
    setState(() {
      final index = tasks.indexWhere((task) => task.id == id);
      if (index != -1) {
        tasks[index] = tasks[index].copyWith(
          isCompleted: !tasks[index].isCompleted,
        );
      }
    });
  }

  void _deleteTask(String id) {
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

  void _reorderTasks(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Task item = tasks.removeAt(oldIndex);
      tasks.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final completedTasks = tasks.where((task) => task.isCompleted).length;
    final totalTasks = tasks.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks Challenge'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total: $totalTasks'),
                Text('Completed: $completedTasks'),
                Text('Remaining: ${totalTasks - completedTasks}'),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: tasks.isEmpty
                ? Center(
                    child: Text(
                      'No tasks yet!',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                : ReorderableListView(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    onReorder: _reorderTasks,
                    children: tasks.map((task) {
                      return Dismissible(
                        key: ValueKey(task.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          color: Colors.red,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        confirmDismiss: (direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete Task'),
                                content: Text(
                                  'Are you sure you want to delete "${task.title}"?',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onDismissed: (direction) {
                          _deleteTask(task.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Task "${task.title}" deleted'),
                            ),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: ListTile(
                            leading: Checkbox(
                              value: task.isCompleted,
                              onChanged: (_) => _toggleTaskCompletion(task.id),
                            ),
                            title: Text(
                              task.title,
                              style: TextStyle(
                                decoration: task.isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: task.isCompleted ? Colors.grey : null,
                              ),
                            ),
                            trailing: Icon(Icons.drag_handle),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
