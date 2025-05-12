import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/provider/create_event_provider.dart';
import 'package:todo_app/screens/home/create_event.dart';

class EventItem extends StatelessWidget {
  TaskModel model;
   EventItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateEventProvider>(context, listen: false);
    return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Stack(children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset("assets/images/${model.category}.png")),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${model.title}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          provider.setModelID(model.id);
                          provider.editPage = true;
                          Navigator.pushNamed(context, CreateEvent.routeName);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(Icons.edit),
                        ),
                      ),
                      InkWell(
                        onTap: () => FirebaseManager.deleteEvent(model.id),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(Icons.delete),
                        ),
                      ),
                      Icon(
                        Icons.favorite_border_outlined,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8, top: 3),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${convertToFullDateTime(model.date).split(",")[1].trim().substring(0,3)}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                      Text(
                        "${convertToFullDateTime(model.date).split(",")[1].trim().substring(3,6)}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                )
              ],
            )
          ]),
        );

}
  }




String convertToFullDateTime(int timestamp) {
  // Convert microseconds to milliseconds if needed
  if (timestamp > 10000000000000) {
    timestamp = (timestamp / 1000).round();
  }

  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Format: Saturday, 10 May 2025 - 17:46:17
  String formatted = DateFormat('EEEE, d MMMM y - HH:mm:ss').format(dateTime);

  return formatted;
}


