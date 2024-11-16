import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/styles.dart';

ListView TaskList(TaskItems, DeleteItem, StatusChange) {
  return ListView.builder(
      itemCount: TaskItems.length,
      itemBuilder: (context, index) {
        Color statusColor = Colors.green;
        if (TaskItems[index]['status'] == "New") {
          statusColor = Colors.blue;
        } else if (TaskItems[index]['status'] == "Progress") {
          statusColor = Colors.orange;
        } else if (TaskItems[index]['status'] == "Canceled") {
          statusColor = Colors.red;
        }

        return Card(
          child: ItemSizeBox(Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TaskItems[index]['title'],
                style: Head6Text(Colors.blue),
              ),
              Text(
                TaskItems[index]['description'],
                style: Head7Text(Colors.grey),
              ),
              Text(
                TaskItems[index]['createdDate'],
                style: Head9Text(Colors.blue),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusChild(TaskItems[index]['status'], statusColor),
                  Container(
                      child: Row(
                    children: [
                      SizedBox(
                          width: 50,
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                StatusChange(TaskItems[index]['_id']);
                              },
                              child: Icon(Icons.edit_location_alt_outlined,
                                  size: 16),
                              style: AppStatusButtonStyle(Colors.blue))),
                      SizedBox(width: 10),
                      SizedBox(
                          width: 50,
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                DeleteItem(TaskItems[index]['_id']);
                              },
                              child: Icon(Icons.delete_outlined, size: 16),
                              style: AppStatusButtonStyle(Colors.red)))
                    ],
                  )),
                ],
              )
            ],
          )),
        );
      });
}
