import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier {
  List<String> eventCategories = [
    "birthday",
    "bookclub",
    "eating",
    "exhibition",
    "gaming",
    "holiday",
    "meeting",
    "sport",
    "workshop"
  ];

  int selectedCategory = 0;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();


  changeTime(TimeOfDay time){
    selectedTime = time;
    notifyListeners();
  }

  changeDate(DateTime date){
    selectedDate = date;
    notifyListeners();
  }

  changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }
}
