import 'package:clean_project/domain/entities/user.dart';
import 'package:flutter/material.dart';

class ItemListUserWidget extends StatelessWidget {
  final User user;
  final CallbackAction onTap;

  ItemListUserWidget({
    @required this.user,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 5),
            Text(
              user.email,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      );
}
