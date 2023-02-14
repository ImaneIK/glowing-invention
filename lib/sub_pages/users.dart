import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserConf extends StatefulWidget {
  const UserConf({Key? key}) : super(key: key);

  @override
  State<UserConf> createState() => _UserConfState();
}

class _UserConfState extends State<UserConf> {
  late int val = 1;

  Future<void> _showAddModal(BuildContext context) async {
    final taskController = TextEditingController();
    bool _status = false;

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: taskController,
                decoration: const InputDecoration(
                  labelText: 'Task',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Status'),
                  BottomSheetSwitch(
                    switchValue: false,
                    valueChanged: (value) {
                      _status = value;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  setState(() {
                    TodoItem.todoItems.add(
                        TodoItem(title: taskController.text, status: _status));
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showEditModal(
      BuildContext context, TodoItem todoItem, int index) async {
    final taskController =
        TextEditingController(text: TodoItem.todoItems[index].title);
    bool _status = TodoItem.todoItems[index].status;
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: taskController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                onChanged: (value) {
                  todoItem.title = value;
                },
              ),
              const SizedBox(height: 20),
              BottomSheetSwitch(
                switchValue: _status,
                valueChanged: (value) {
                  _status = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Save changes'),
                onPressed: () {
                  setState(() {
                    TodoItem.todoItems[index] =
                        TodoItem(title: taskController.text, status: _status);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteTask(int index) {
    setState(() {
      if (TodoItem.todoItems.length > 1) {
        TodoItem.todoItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    const PopupMenuItem(value: 0, child: Text("List view")),
                    const PopupMenuItem(value: 1, child: Text("Grid view"))
                  ],
              onSelected: (int value) {
                setState(() {
                  if (value == 0) {
                    val = 0;
                  } else {
                    val = 1;
                  }
                });
              }),
        ],
      ),

      body: whichView(),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            _showAddModal(context);
          });
        },
      ),
    );
  }

  Widget whichView() {
    if (val == 0) {
      return listViewWidget();
    } else {
      return gridViewWidget();
    }
  }

  Widget listViewWidget() {
    return ListView.builder(
      itemCount: TodoItem.todoItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(TodoItem.todoItems[index].title),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _deleteTask(index);
              });
            },
          ),
          subtitle: Text(TodoItem.todoItems[index].status ? 'Admin' : 'Guest'),
          onTap: () {
            _showEditModal(context, TodoItem.todoItems[index], index);
          },
        );
      },
    );
  }

  Widget gridViewWidget() {
    return Container(
        alignment: Alignment.topCenter,
        height: 487,
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(0),
          children: List.generate(TodoItem.todoItems.length, (index) {
            return TodoItem.todoItems[index].title != null
                ? gridCard(TodoItem.todoItems[index], index)
                : Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 50),
                    margin: index % 2 == 0
                        ? const EdgeInsets.fromLTRB(15, 7.5, 7.5, 7.5)
                        : const EdgeInsets.fromLTRB(7.5, 7.5, 15, 7.5),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  );
          }),
        ));
  }

  Widget gridCard(TodoItem model, int index) {
    return InkWell(
      onTap: () {
        _showEditModal(context, TodoItem.todoItems[index], index);
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: index % 2 == 0
            ? const EdgeInsets.fromLTRB(10, 7.5, 7.5, 7.5)
            : const EdgeInsets.fromLTRB(7, 7.5, 15, 7.5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: TodoItem.todoItems[index].status
                    ? [
                        const Color.fromRGBO(222, 248, 255, 0.95),
                        const Color.fromRGBO(222, 248, 255, 0.4)
                      ]
                    : [
                        const Color.fromRGBO(222, 248, 255, 0.5),
                        const Color.fromRGBO(222, 248, 255, 0.1)
                      ]),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 0, child: Text("Delete User")),
                ],
                onSelected: (int value) {
                  setState(() {
                    _deleteTask(index);
                  });
                },
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            Text(
              TodoItem.todoItems[index].title,
              style: TextStyle(
                  color: TodoItem.todoItems[index].status
                      ? Colors.deepPurple
                      : const Color(0xff302e45),
                  fontSize: 19,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              TodoItem.todoItems[index].status ? 'Admin' : 'Guest',
              style: TextStyle(
                  color: TodoItem.todoItems[index].status
                      ? Colors.deepPurple
                      : const Color(0xffa3a3a3),
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoItem {
  late final String title;
  late bool status;

  TodoItem({required this.title, required this.status});

  static List<TodoItem> todoItems = [
    TodoItem(
      title: 'Salma Rafik',
      status: true,
    ),
    TodoItem(
      title: 'Haitam bannach',
      status: false,
    ),
    TodoItem(title: 'Anas El mountassir', status: false),
  ];
}

class BottomSheetSwitch extends StatefulWidget {
  BottomSheetSwitch({required this.switchValue, required this.valueChanged});

  final bool switchValue;
  final ValueChanged valueChanged;

  @override
  _BottomSheetSwitch createState() => _BottomSheetSwitch();
}

class _BottomSheetSwitch extends State<BottomSheetSwitch> {
  late bool _switchValue;

  @override
  void initState() {
    _switchValue = widget.switchValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: _switchValue,
        onChanged: (bool value) {
          setState(() {
            _switchValue = value;
            widget.valueChanged(value);
          });
        });
  }
}
