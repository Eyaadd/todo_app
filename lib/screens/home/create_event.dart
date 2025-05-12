import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/create_event_provider.dart';
import 'package:todo_app/widgets/category_event_item.dart';

import '../../firebase/firebase_manager.dart';

class CreateEvent extends StatelessWidget {
  static const String routeName = "CreateEventScreen";

  CreateEvent({super.key});

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateEventProvider>(context, listen: false);
    return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: Text(
              "Create Event",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/${provider.eventCategories[provider.selectedCategory]}.png",
                        height: 220,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                provider.changeCategory(index);
                              },
                              child: CategoryEventItem(
                                  text: provider.eventCategories[index],
                                  isSelected:
                                      provider.selectedCategory == index));
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount: provider.eventCategories.length),
                  ),
                  SizedBox(
                    height: 43,
                  ),
                  TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).focusColor),
                        prefixIcon: Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).focusColor, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).focusColor, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).focusColor, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      )),
                  SizedBox(
                    height: 43,
                  ),
                  TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).focusColor),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).focusColor, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).focusColor, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).focusColor, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            weight: 10,
                          ),
                          const SizedBox(
                            width: 2.5,
                          ),
                          Text(
                            "Event Date",
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                          );
                          if (date != null) {
                            provider.changeDate(date);
                          }
                        },
                        child: Text(
                            provider.selectedDate.toString().substring(0, 10),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColor)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_sharp,
                            weight: 10,
                          ),
                          const SizedBox(
                            width: 2.5,
                          ),
                          Text(
                            "Event Time",
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (time != null) {
                            provider.changeTime(time);
                          }
                        },
                        child: Text(
                            provider.selectedTime.toString().substring(10, 15),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColor)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ));
                          },
                        );
                        TaskModel model = TaskModel(
                            title: titleController.text,
                            category: provider.selectedCategoryName,
                            description: descriptionController.text,
                            date: provider.selectedDate.microsecondsSinceEpoch,
                            time: provider.selectedTime.hour);
                        if(provider.editPage){
                          TaskModel model2 = TaskModel(
                              title: titleController.text,
                              category: provider.selectedCategoryName,
                              description: descriptionController.text,
                              date: provider.selectedDate.microsecondsSinceEpoch,
                              time: provider.selectedTime.hour,
                              id: provider.modelID
                          );
                          FirebaseManager.updateEvent(model2).then((value) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            provider.editPage = false;
                          },);
                        }else{
                          FirebaseManager.addEvent(model).then(
                            (value) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          );
                        }
                      },
                      child: Text("Add Event",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
