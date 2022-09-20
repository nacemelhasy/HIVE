 

import 'package:hive/hive.dart';
part 'Model.g.dart';

@HiveType(typeId: 0) // should be all class have unique nember
class Members extends HiveObject{
@HiveField(0)
late String name;
@HiveField(1)
late String department;
@HiveField(2)
late int age;

}