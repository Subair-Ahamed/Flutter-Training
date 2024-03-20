import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class Task {
  final int id;
  final String title;
  final bool done;

  Task({required this.id, required this.title, required this.done});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      done: json['done'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.yellow[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> _tasks = [];
  late TextEditingController _taskController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController();
    _fetchTasks();
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  Future<void> _fetchTasks() async {
    final response = await http.get(Uri.parse('http://localhost:8090/tasks'));
    if (response.statusCode == 200) {
      setState(() {
        _tasks = (json.decode(response.body) as List)
            .map((data) => Task.fromJson(data))
            .toList();
      });
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<void> _createTask(String title) async {
    final response = await http.post(
      Uri.parse('http://localhost:8090/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'done': false,
      }),
    );
    if (response.statusCode == 200) {
      _fetchTasks();
    } else {
      throw Exception('Failed to create task');
    }
  }

  Future<void> _toggleTask(int id) async {
    final response =
        await http.put(Uri.parse('http://localhost:8090/tasks/$id'));
    if (response.statusCode == 200) {
      _fetchTasks();
    } else {
      throw Exception('Failed to update task');
    }
  }

  Future<void> _deleteTask(int id) async {
    final response =
        await http.delete(Uri.parse('http://localhost:8090/tasks/$id'));
    if (response.statusCode == 200) {
      setState(() {
        _tasks.removeWhere((task) => task.id == id);
      });
    } else {
      throw Exception('Failed to delete task');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'TODO App',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.white),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/255379/pexels-photo-255379.jpeg?cs=srgb&dl=pexels-miguel-%C3%A1-padri%C3%B1%C3%A1n-255379.jpg&fm=jpg'), // Replace with your image URL
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Add Task',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 600,
                      child: TextField(
                        controller: _taskController,
                        decoration: InputDecoration(
                          labelText: 'Enter Task',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0), // Adjust the radius as needed
                          ),
                          filled: true,
                          fillColor: Colors.white60,
                          prefixIcon: Icon(Icons.task),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _createTask(_taskController.text);
                  _taskController.clear();
                },
                child: Text('Add Task'),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ReorderableListView.builder(
                  itemCount: _tasks.length,
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final Task item = _tasks.removeAt(oldIndex);
                      _tasks.insert(newIndex, item);
                    });
                  },
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return GestureDetector(
                      onTap: () {
                        _toggleTask(task.id);
                      },
                      key: ValueKey(task.id),
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: ListTile(
                          title: Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              decoration: task.done
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          leading: Checkbox(
                            value: task.done,
                            onChanged: (bool? value) {
                              _toggleTask(task.id);
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteTask(task.id);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
