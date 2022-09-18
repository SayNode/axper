import 'package:axa_casper_app/repositories/request_repo.dart';
import 'package:flutter/material.dart';

import '../../../Theme/theme.dart';
import '../../../models/request_model.dart';
import '../../home/home_page_loader.dart';

class RequestCard extends StatefulWidget {
  const RequestCard({
    super.key,
    required this.request,
  });
  final Request request;

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: ThemeAxper.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Activity: " + widget.request.title,
                  textAlign: TextAlign.right,
                ),
                Text(
                  "User: " +
                      widget.request.user_pk.substring(0, 5) +
                      "..." +
                      widget.request.user_pk.substring(
                          widget.request.user_pk.length - 5,
                          widget.request.user_pk.length),
                  textAlign: TextAlign.right,
                ),
                Text("Amout: " + widget.request.amount.toString())
              ],
            ),
          ),
          _pending(widget.request.status)
        ],
      ),
    );
  }

  _pending(String status) {
    if (status == 'pending') {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            IconButton(
                onPressed: () async {
                  await RequestRepository.updateStatus(
                      widget.request.id, 'done');
                },
                icon: Icon(Icons.check)),
            IconButton(
                onPressed: () async {
                  await RequestRepository.updateStatus(
                      widget.request.id, 'denied');
                },
                icon: Icon(Icons.clear))
          ],
        ),
      );
    } else if (status == 'done') {
      return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            'Done',
            style: TextStyle(color: Colors.green),
          ));
    } else {
      return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            'Denied',
            style: TextStyle(color: Colors.red),
          ));
    }
  }
}
