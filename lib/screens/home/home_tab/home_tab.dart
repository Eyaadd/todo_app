import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/screens/home/home_tab/event_item.dart';

import '../../../models/task_model.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        )),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back ✨",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white, fontSize: 14),
              ),
              Container(
                margin: EdgeInsets.only(left: 2),
                child: Text(
                  "Eyad Yehia",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.sunny, color: Colors.white),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "EN",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          )
        ],
        bottom: AppBar(
          leadingWidth: 0,
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 120,
          centerTitle: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          )),
          title: Row(
            children: [
              Icon(
                Icons.pin_drop_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Cairo , Egypt",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder <QuerySnapshot<TaskModel>>(
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
                itemBuilder: (context, index) => EventItem(model: snapshot.data!.docs[index].data(),),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8,
                ),
                itemCount: snapshot.data?.docs.length ?? 0),
          );
        },
        stream: FirebaseManager.getEvent(),
      ),
    );
  }
}
