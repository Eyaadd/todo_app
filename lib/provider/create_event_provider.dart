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

  String get selectedCategoryName => eventCategories[selectedCategory];

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  var modelID = "";
  bool editPage = false;

  setModelID(var modelId){
    modelID = modelId;
    notifyListeners();
  }

  changeTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }

  changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }
  ThemeMode themeMode = ThemeMode.light;

  changeTheme(){
    if(themeMode == ThemeMode.light){
      themeMode = ThemeMode.dark;
    }else{
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
