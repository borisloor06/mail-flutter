import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const EmailWidget(
      {Key? key,
      required this.email,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(email.id);
      },
      onLongPress: () {
        onLongPress(email.id);
      },
      onTap: () {
        onTap(email);
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        height: 90.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image(
                height: 50.0,
                image: email.read
                    ? const NetworkImage(
                        'https://res.cloudinary.com/dtmsfgjzi/image/upload/v1669741681/fondo_png_vacio_by_juuliidev_d4x2xn5-fullview.png_anslxy.png')
                    : const NetworkImage(
                        'https://res.cloudinary.com/dtmsfgjzi/image/upload/v1669736024/mail_icon_amc8vf.png'),
                color: imgColor,
              ),
            ),
            const Padding(padding: EdgeInsets.only(right: 15.0)),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('From:', style: fromTextStyle),
                  Text(email.from, style: fromTextStyle),
                  Text(
                    email.dateTime.toString().substring(0, 10),
                    style: dateTextStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    email.subject,
                    style:
                        email.read ? subjectReadedTextStyle : subjectTextStyle,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
