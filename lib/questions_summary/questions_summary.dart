import 'package:flutter/material.dart';

import 'package:new_quiz_app/questions_summary/summary_item.dart';

// class for the questions summary data
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

// object for accepting the summary data  
final List<Map<String, Object>> summaryData;

// method for the summary data  
  @override
  Widget build(BuildContext context) {
    
// returns the widget for the summary data configured in the summary item class
return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
