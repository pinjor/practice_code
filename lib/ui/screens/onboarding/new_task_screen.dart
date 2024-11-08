import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/add_new_task_screen.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/widgets/Tm_Appbar.dart';

class new_task_screen extends StatefulWidget {
  const new_task_screen({super.key});

  @override
  State<new_task_screen> createState() => _new_task_screenState();
}

class _new_task_screenState extends State<new_task_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Tm_Appbar(),
      body: Column(
        children: [
          Row(
            children: [
              dashboard_card('09', 'New Task'),
              dashboard_card('09', 'Completed'),
              dashboard_card('09', 'Canceled'),
              dashboard_card('09', 'Processed'),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title'),
                        Text('Description'),
                        Text('Date : 2024/12/12'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            build_task_status_Chip(),
                            Wrap(
                              children: [
                                TextButton(
                                  onPressed: onTapEditButton,
                                  child: Icon(Icons.edit),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ));
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 15,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  onTapEditButton() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Status'),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              children: ['New', 'Completed', 'Canceled', 'Progress'].map((e) {
                return ListTile(
                  onTap: () {},
                  title: Text(e),
                );
              }).toList()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
