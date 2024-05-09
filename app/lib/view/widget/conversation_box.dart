
import 'package:dem_recip_mobile/utils/conversation_metadata.dart';
import 'package:dem_recip_mobile/utils/get_partner_type.dart';
import 'package:flutter/material.dart';

class ConversationBox extends StatelessWidget {
  final ConversationMetaData data;

  const ConversationBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: screenWidth,
        height: 150,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              data.topic.replaceAll('_', ' ').toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Partner: ${getPartnerType(data.participants)}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                data.timestamp.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}