import 'package:flutter/material.dart';

class IconPicker extends StatefulWidget {
  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  IconData? selectedIcon;
  final List<IconData> allIcons = [
    Icons.check,
    Icons.clear,
    Icons.add,
    Icons.edit,
    Icons.delete,
    Icons.done,
    Icons.done_all,
    Icons.remove,
    Icons.close,
    Icons.cancel,
    Icons.create,
    Icons.update,
    Icons.list,
    Icons.format_list_bulleted,
    Icons.format_list_numbered,
    Icons.event,
    Icons.alarm,
    Icons.notifications,
    Icons.calendar_today,
    Icons.calendar_view_day,
    Icons.access_time,
    Icons.hourglass_empty,
    Icons.hourglass_full,
    Icons.search,
    Icons.filter_list,
    Icons.sort,
    Icons.folder,
    Icons.save,
    Icons.cloud_upload,
    Icons.cloud_download,
  ];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        width: 300,
        child: GridView.count(
          crossAxisCount: 5,
          children: List.generate(allIcons.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop(allIcons[index]);
              },
              child: Icon(allIcons[index]),
            );
          }),
        ),
      ),
    );
  }
}