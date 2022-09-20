import 'package:api/Getx.dart';
import 'package:api/Model/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

init cnot = Get.put(init());

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Members> members = [];
  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<init>(
        init: init(),
        builder: (_) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(onPressed: () {
                // addMember(name: 'nacem', department: 'computer', age: 21);
                //updateMember(members:  Hive.box<Members>('Members').values.toList()[4], name: 'mohamed hossin', department: 'computer', age: 20);
                delteMember(Hive.box<Members>('Members').values.toList()[4]);
              }),
              body: ValueListenableBuilder<Box<Members>>(
                valueListenable: Hive.box<Members>('Members').listenable(),
                builder: (context, value, child) {
                  final list = value.values.toList();
                  return buildContent(list);
                },
              ));
        });
  }
}
// for add member
addMember({
  required String name,
  required String department,
  required int age,
}) {
  final member = Members()
    ..name = name
    ..age = age
    ..department = department;

  final box = Hive.box<Members>('Members');

  box.add(member);
}

// for update data
updateMember({
  required Members members,
  required String name,
  required String department,
  required int age,
}) {
  members.name = name;
  members.age = age;
  members.department = department;
  members.save();
}

// for delete member
delteMember(Members member) {
  member.delete();
}

// for show all members
Widget buildContent(List<Members> list) {
  return list.isEmpty
      ? Center(
          child: Text('Nothing'),
        )
      : ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => Text(list[index].name));
}
