import 'package:flutter/material.dart';
import 'package:post_project/Models/UserModels.dart';

class UserItems extends StatelessWidget {
  final Data data;

  const UserItems({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(

          children: [
            SizedBox(
              height: 100,
              width: 70,
              child: Image.network(
                data.avatar.toString(),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.firstName} ${data.lastName}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(data.email.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
