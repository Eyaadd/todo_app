import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset("assets/images/birthday.png")),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "This is a Birthday Party ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8, top: 3),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    "21",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    "Nov",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
