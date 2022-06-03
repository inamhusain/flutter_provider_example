import 'package:flutter/widgets.dart';
import 'List.dart';

class SalaryProvider extends ChangeNotifier {
  double _grandSalary = 0;
  bool _isVisible = false;
  List<Employee> employeeList = [
    Employee(0, "0", 00.0),
    Employee(1, "emp1", 100.0),
    Employee(2, "emp2", 200.0),
    Employee(3, "emp3", 300.0),
    Employee(4, "emp4", 400.0),
    Employee(5, "emp5", 500.0),
  ];
  double get getGrandSalary => _grandSalary;
  bool get isvisible => _isVisible;
  visible() {
    _isVisible = !_isVisible;
    print(_isVisible);
    notifyListeners();
  }

  addUser({required String name, required double salary}) {
    var letesttid = employeeList.last.id + 1;
    employeeList.add(Employee(letesttid, name, salary));
    countSalary();
    visible();
    notifyListeners();
  }

  countSalary() {
    _grandSalary = 0;
    for (var i = 0; i < employeeList.length; i++) {
      _grandSalary = _grandSalary + employeeList[i].salary;
    }
  }

  deleteEmployee(id) {
    print(id);
    employeeList.removeAt(id);
    countSalary();
    notifyListeners();
  }
}
