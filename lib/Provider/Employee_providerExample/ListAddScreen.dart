import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListProvider.dart';
import 'widgets/AddEmployeeSection.dart';
import 'widgets/EmployeeList.dart';
import 'widgets/FloatingActionBtn.dart';
import 'widgets/buttomContainer.dart';

class ListAddScreen extends StatefulWidget {
  const ListAddScreen({Key? key}) : super(key: key);

  @override
  _ListAddScreenState createState() => _ListAddScreenState();
}

class _ListAddScreenState extends State<ListAddScreen> {
  @override
  void initState() {
    super.initState();
    var listProvider = Provider.of<SalaryProvider>(context, listen: false);
    listProvider.countSalary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Consumer<SalaryProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                Visibility(
                  visible: context.read<SalaryProvider>().isvisible == true
                      ? true
                      : false,
                  child: AddEmployeeSection(context),
                ),
                EmployeeList(context),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionBtn(context),
      bottomNavigationBar: BottomContainer(),
    );
  }
}
