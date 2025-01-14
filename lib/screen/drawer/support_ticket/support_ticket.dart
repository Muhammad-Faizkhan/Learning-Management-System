import 'package:flutter/material.dart';

class SupportTicket extends StatelessWidget {
  const SupportTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("No Support Ticket Found",style: TextStyle(color: Colors.black,fontSize: 16),)
        ],
      ),
    );
  }
}
