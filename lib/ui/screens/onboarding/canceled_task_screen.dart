import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_clients.dart';
import 'package:task_manager/ui/screens/onboarding/TaskList.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/widgets/Tm_Appbar.dart';

class canceled_task_screen extends StatefulWidget {
  const canceled_task_screen({super.key});

  @override
  State<canceled_task_screen> createState() => _canceled_task_screenState();
}

class _canceled_task_screenState extends State<canceled_task_screen> {
  List TaskItems = [];
  bool Loading = true;
  String Status = "Canceled";

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest("Canceled");
    setState(() {
      Loading = false;
      TaskItems = data;
    });
  }

  UpdateStatus(id) async {
    setState(() {
      Loading = true;
    });
    await TaskUpdateRequest(id, Status);
    await CallData();
    setState(() {
      Status = "Canceled";
    });
  }

  DeleteItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Loading = true;
                    });
                    await TaskDeleteRequest(id);
                    await CallData();
                  },
                  child: Text('Yes')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No')),
            ],
          );
        });
  }

  StatusChange(id) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(30),
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RadioListTile(
                    title: Text("New"),
                    value: "New",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Progress"),
                    value: "Progress",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Completed"),
                    value: "Completed",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Canceled"),
                    value: "Canceled",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),
                  ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Confirm'),
                    onPressed: () {
                      Navigator.pop(context);
                      UpdateStatus(id);
                    },
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Loading
        ? (Center(child: CircularProgressIndicator()))
        : RefreshIndicator(
            onRefresh: () async {
              await CallData();
            },
            child: TaskList(TaskItems, DeleteItem, StatusChange));
  }
}
//   return Scaffold(
//     appBar: Tm_Appbar(),
//     body: ListView.separated(
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return Card(
//             elevation: 0,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Title'),
//                 Text('Description'),
//                 Text('Date : 2024/12/12'),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     build_task_status_Chip(),
//                     Wrap(
//                       children: [
//                         TextButton(
//                           onPressed: onTapEditButton,
//                           child: Icon(Icons.edit),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: Icon(Icons.delete),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ));
//       },
//       separatorBuilder: (context, index) {
//         return SizedBox(
//           height: 15,
//         );
//       },
//     ),
//   );
// }
//
// onTapEditButton() {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text('Edit Status'),
//         content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: ['New', 'Completed', 'Canceled', 'Progress'].map((e) {
//               return ListTile(
//                 onTap: () {},
//                 title: Text(e),
//               );
//             }).toList()),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('cancel'),
//           ),
//           TextButton(
//             onPressed: () {},
//             child: Text('Ok'),
//           ),
//         ],
//       );
//     },
//   );
// }
