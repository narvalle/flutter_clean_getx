import 'package:clean_project/domain/entities/user.dart';
import 'package:clean_project/presentation/widgets/item_list_user.dart';
import 'package:flutter/material.dart';

class ListUserWidget extends StatelessWidget {
  final List<User> users;

  ListUserWidget({@required this.users});

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: users.length ?? 0,
        itemBuilder: (_, i) => ItemListUserWidget(
          user: users.elementAt(i),
        ),
      );
}
