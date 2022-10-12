import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssignmentSubmission extends StatelessWidget {
  const AssignmentSubmission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: const [
                    Icon(Icons.add),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Upload Assignment'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('pdg/Excel/WordDocs'),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
