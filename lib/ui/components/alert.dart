import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/cupertino.dart';

void customAlert(BuildContext context, type, massage) {
  if (type == "success") {
    ElegantNotification.success(
      width: 200,
      height: 100,
      notificationPosition: NotificationPosition.topLeft,
      animation: AnimationType.fromTop,
      title: Text('Succes!'),
      description: Text(massage),
      onDismiss: () {
        print(
          'This print will be displayed when dismissing the popup',
        );
      },
    ).show(context);
  } else if (type == "error") {
    ElegantNotification.error(
      width: 200,
      height: 100,
      notificationPosition: NotificationPosition.topLeft,
      animation: AnimationType.fromTop,
      title: Text('Error!'),
      description: Text(massage),
      onDismiss: () {
        print(
          'This print will be displayed when dismissing the popup',
        );
      },
    ).show(context);
  }
}
