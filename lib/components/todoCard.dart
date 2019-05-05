import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  TodoCard(
      {Key key,
      this.task,
      this.toggleIsCompleted,
      this.isCompleted,
      this.delete})
      : super(key: key);

  final String task;
  final VoidCallback toggleIsCompleted;
  final bool isCompleted;
  final VoidCallback delete;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toggleIsCompleted();
      },
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            task,
            style: TextStyle(
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Icon(!isCompleted
                ? Icons.radio_button_unchecked
                : Icons.radio_button_checked),
          ),
          trailing: InkWell(
            onTap: () {
              delete();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey)),
              ),
              width: 60,
              height: double.infinity,
              child: Icon(Icons.delete),
            ),
          ),
        ),
      ),
    );
  }
}
