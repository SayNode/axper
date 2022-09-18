import 'package:axa_casper_app/pages/governance/widgets/request_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Theme/theme.dart';
import '../../../models/request_model.dart';
import '../../../repositories/request_repo.dart';

class RequestListview extends StatefulWidget {
  const RequestListview(
      {super.key, required this.status, required this.requests});
  final String status;
  final List<Request> requests;

  @override
  State<RequestListview> createState() => _RequestListviewState();
}

class _RequestListviewState extends State<RequestListview> {
  @override
  Widget build(BuildContext context) {
    var list = [];
    for (var element in widget.requests) {
      if (element.status == widget.status) {
        list.add(element);
      }
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
              },
              child: Text('reset')),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.status.toUpperCase(),
              style: GoogleFonts.nunito(
                  fontSize: 20,
                  color: ThemeAxper.textBlue,
                  fontWeight: FontWeight.w900),
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return RequestCard(
                  request: list[index],
                );
              }),
        ],
      ),
    );
  }
}
