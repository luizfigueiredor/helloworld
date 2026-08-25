import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color primaryRed = Color(0xFFB71C1C);

enum FilterType { all, pending, completed }

class Task {
  String title;
  String time;
  bool done;
  bool priority;

  Task({
    required this.title,
    required this.time,
    this.done = false,
    this.priority = false,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        colorSchemeSeed: primaryRed,
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  FilterType filter = FilterType.all;

  final List<Task> tasks = [
    Task(
      title: "Estudar Flutter",
      time: "10:00",
      priority: true,
    ),
    Task(
      title: "Reunião",
      time: "14:00",
    ),
    Task(
      title: "Enviar relatório",
      time: "16:00",
    ),
  ];

  List<Task> get filteredTasks {
    switch (filter) {
      case FilterType.pending:
        return tasks.where((e) => !e.done).toList();

      case FilterType.completed:
        return tasks.where((e) => e.done).toList();

      case FilterType.all:
        return tasks;
    }
  }

  int get completedTasks =>
      tasks.where((e) => e.done).length;

  int get priorityTasks =>
      tasks.where((e) => e.priority).length;

  void addTask() {
    final titleController = TextEditingController();
    final timeController = TextEditingController();

    bool priority = false;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Nova tarefa"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Título",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: timeController,
                    decoration: const InputDecoration(
                      labelText: "Horário",
                    ),
                  ),
                  CheckboxListTile(
                    value: priority,
                    title: const Text("Prioridade"),
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setDialogState(() {
                        priority = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty) {
                      return;
                    }

                    setState(() {
                      tasks.add(
                        Task(
                          title: titleController.text,
                          time: timeController.text,
                          priority: priority,
                        ),
                      );
                    });

                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 50,
        bottom: 18,
      ),
      color: primaryRed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildFilterButton(
    String text,
    FilterType type,
  ) {
    final selected = filter == type;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            filter = type;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: selected
                ? primaryRed
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTaskCard(Task task) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Container(
          width: 6,
          decoration: BoxDecoration(
            color: task.priority
                ? Colors.orange
                : primaryRed,
            borderRadius:
                BorderRadius.circular(10),
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.done
                ? TextDecoration.lineThrough
                : null,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(task.time),
        trailing: Checkbox(
          value: task.done,
          activeColor: primaryRed,
          onChanged: (value) {
            setState(() {
              task.done = value ?? false;
            });
          },
        ),
      ),
    );
  }

  Widget tasksPage() {
    return Column(
      children: [
        buildHeader("Minhas Tarefas"),

        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: Row(
            children: [
              buildFilterButton(
                "Todas",
                FilterType.all,
              ),
              buildFilterButton(
                "Pendentes",
                FilterType.pending,
              ),
              buildFilterButton(
                "Concluídas",
                FilterType.completed,
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: filteredTasks.length,
            itemBuilder: (context, index) {
              return buildTaskCard(
                filteredTasks[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget calendarPage() {
    return Column(
      children: [
        buildHeader("Calendário"),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: const [
              Card(
                child: ListTile(
                  leading: Icon(Icons.event),
                  title: Text("Reunião"),
                  subtitle: Text("14:00"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.school),
                  title: Text("Estudar Flutter"),
                  subtitle: Text("10:00"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget prioritiesPage() {
    final priorities =
        tasks.where((e) => e.priority).toList();

    return Column(
      children: [
        buildHeader("Prioridades"),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: priorities.length,
            itemBuilder: (context, index) {
              return buildTaskCard(
                priorities[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget profilePage() {
    return Column(
      children: [
        buildHeader("Perfil"),

        const SizedBox(height: 30),

        const CircleAvatar(
          radius: 45,
          backgroundColor: primaryRed,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 45,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "Usuário",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListTile(
            leading: const Icon(Icons.task),
            title: const Text("Total de tarefas"),
            trailing: Text(
              tasks.length.toString(),
            ),
          ),
        ),

        Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListTile(
            leading: const Icon(
              Icons.check_circle,
            ),
            title: const Text("Concluídas"),
            trailing: Text(
              completedTasks.toString(),
            ),
          ),
        ),

        Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListTile(
            leading: const Icon(Icons.flag),
            title: const Text("Prioridades"),
            trailing: Text(
              priorityTasks.toString(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      tasksPage(),
      calendarPage(),
      prioritiesPage(),
      profilePage(),
    ];

    return Scaffold(
      body: pages[pageIndex],

      floatingActionButton: pageIndex == 0
          ? FloatingActionButton(
              backgroundColor: primaryRed,
              onPressed: addTask,
              child: const Icon(Icons.add),
            )
          : null,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        selectedItemColor: primaryRed,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: "Tarefas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calendário",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: "Prioridades",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}