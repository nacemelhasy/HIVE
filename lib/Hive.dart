/* 
one step for initail hive local database
1 - put this in pubspec.yaml
 dependencies:
   hive: ^2.2.3
   hive_flutter: ^1.1.0
 dev_dependencies:  
   build_runner: ^2.2.1  
   hive_generator: ^1.1.3

2- put inital hive in void main in first funcation in app
  WidgetsFlutterBinding.ensureInitialized();
  // for hive init
 await Hive.initFlutter();
----------------------------------------------------------------

* second step 
1 - creata model and transform model  
Like this : ->
import 'package:hive/hive.dart';

part 'Model.g.dart'; // this line write name of folder and .g for generate file

@HiveType(typeId: 0) // should be all class have unique nember
class Members extends HiveObject{
  // etendex hiveObject for use funcation delete save and update in faster
@HiveField(0)
late String name;
@HiveField(1)
late String department;
@HiveField(2)
late int age;

}



2 - run in termimal this commend  for genereate model adapter
flutter packages pub run build_runner build
or for clean flutter pub run build_runner clean
then  flutter pub run build_runner build
 
3 - go for main funcation and add this line
 Hive.registerAdapter(MembersAdapter()); // for register adeptor

-------------------------------------------------------------
* third step open and close database 
belwo line must be write in main funcation for open any box for put insid it some thing
 await Hive.openBox<Members>('Members');// for open box
 
 Hive.close(); // this line should be put inside dispose method 

--------------------------------------------------
* fourth step CURD proccess 

1 -  for add inside box
Future addMember(
  String name,
  String department,
  ing age
){
final member = Members()..name = name ..department = department .. age = age;
  final box = Hive.box<Members>('Members');
  box.put('${name}',member);
  or
  box.add(member); // auto key
  
}


2 - for edit on data 
Future editMember(
  Members member ,
    String name,
  String department,
  ing age
){
member.name = name;
member.age = age;
member.department = department;

make update data in two ways 
'
-- first way 
  final box = Hive.box<Members>('Members');
  box.put(member.key,member);

-- second way
member.save(); // this funcation because we use HiveObject in model class

}
// 


3 - for delete data 
Future deleteMember(Members member){
// you can delete object in two ways

-- first way
final box = Hive.box<Members>('members');
box.delete(member.key);

-- second way
member.delete();
}

*/
