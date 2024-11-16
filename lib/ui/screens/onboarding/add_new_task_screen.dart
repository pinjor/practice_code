import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_clients.dart';
import 'package:task_manager/ui/screens/onboarding/new_task_screen.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/widgets/Tm_Appbar.dart';

class add_new_task_screen extends StatefulWidget {
  const add_new_task_screen({super.key});

  @override
  State<add_new_task_screen> createState() => _add_new_task_screenState();
}

class _add_new_task_screenState extends State<add_new_task_screen> {
  Map<String, String> FormValues = {
    "title": "",
    "description": "",
    "status": "New"
  };
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['title']!.length == 0) {
      ErrorToast('Title Required !');
    } else if (FormValues['description']!.length == 0) {
      ErrorToast('Description Required !');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await TaskCreateRequest(FormValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.green, title: Text('Create New Task')),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: Loading
                ? (Center(child: CircularProgressIndicator()))
                : (SingleChildScrollView(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add New Task", style: Head1Text(Colors.blue)),
                        SizedBox(height: 1),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("title", Textvalue);
                          },
                          decoration: AppInputDecoration("Task Name"),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("description", Textvalue);
                          },
                          maxLines: 10,
                          decoration: AppInputDecoration("Info"),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Create'),
                            onPressed: () {
                              FormOnSubmit();
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
          )
        ],
      ),
    );
  }
}

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Tm_Appbar(),
//       body: Stack(children: [
//         background_picture(context),
//         Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 HeadText('Add New Task'),
//                 SizedBox(
//                   height: 30.0,
//                 ),
//                 TextFormField(
//                   decoration: AppInputDecoration('Title'),
//                 ),
//                 SizedBox(
//                   height: 30.0,
//                 ),
//                 TextFormField(
//                   maxLines: 5,
//                   decoration: AppInputDecoration('Descriptions'),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 // Elevated_green_button(
//                 //   context,
//                 //   'Add',
//                 //   new_task_screen(),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
