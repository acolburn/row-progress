import 'dart:html';

// final sInput = querySelector("#input")!.text;
// final sOutput = querySelector("#output")!.text;
// final InputElement appInput = querySelector('#in') as InputElement;
// final TextAreaElement appOutput = querySelector('#out') as TextAreaElement;
// final ButtonElement submitButton = querySelector('#submit') as ButtonElement;

void main() {
  querySelector("#btnInput")!.onClick.listen(calculate);
  querySelector("#txtInput")!.onKeyUp.listen(calculate);
}

void calculate(Event e) {
  String strDistance = (querySelector("#txtInput") as InputElement).value!;
  String output = "";
  final today = DateTime.now();
  // today_formatted = today.strftime('%m/%d/%Y')
  final endDate = DateTime(2024, 5, 1); // May 1, 2023
  final diff = endDate.difference(today);
  final daysLeft = diff.inDays;
  final weeksLeft = daysLeft / 7;
  final distRowed = int.parse(strDistance);
  final distLeft = 1000000 - distRowed;
  final distPerDay = (distLeft / daysLeft).round();
  final distPerWeek = (distLeft / weeksLeft).round();
  final wksAt20kPerWeek = distLeft / 20000;
  final endDateAt20kPerWeek =
      today.add(Duration(days: (wksAt20kPerWeek * 7).round()));
  // final end_date_at_20k_per_week_formatted = end_date_at_20k_per_week.toLocal();
  final endDateAt20kPerWeekFormatted =
      "${endDateAt20kPerWeek.month}/${endDateAt20kPerWeek.day}";
  output += "Distance rowed: $distRowed \n";
  output += "Distance left: $distLeft m \n";
  output += "Days left: $daysLeft\n";
  output += "**$distPerWeek M PER WEEK**\n";
  var i = (distPerWeek / 5).round();
  output += "$i m/day if you row 5X\n";
  i = (distPerWeek / 6).round();
  output += "$i m/day if you row 6X\n";
  output += "$distPerDay m/day if you row daily\n";
  output += "**END $endDateAt20kPerWeekFormatted IF YOU ROW 20K PER WEEK**";
  querySelector("#memOutput")!.text = output;
  print('Output: $output');
}
