import 'package:flutter/material.dart';
import 'package:flutter_away_and_never_look_back/widgets/slide_page.dart';

class WhoAmIPage extends StatelessWidget {
  const WhoAmIPage(
      {super.key,
      required this.endOfPageCallback,
      required this.begingingOfPageCallback});

  final Function endOfPageCallback;
  final Function begingingOfPageCallback;
  static const double bulletFontSize = 25;

  List<Widget> content(BuildContext context) {
    return [title(context), gradInfo(), husbandAndKids()];
  }

  @override
  Widget build(BuildContext context) {
    return SlidePage(
        pageContent: content(context),
        endOfPageCallback: endOfPageCallback,
        begingingOfPageCallback: begingingOfPageCallback);
  }

  Widget title(BuildContext context) {
    return Text(
      "Who am I?",
      style: Theme.of(context).primaryTextTheme.displayLarge,
    );
  }

  Widget gradInfo() {
    return const Text(
      "Graduated from UW La Crosse in 2007",
      style: TextStyle(fontSize: bulletFontSize),
    );
  }

  Widget husbandAndKids() {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Husband and Father of 2 (15 & 12)",
        style: TextStyle(fontSize: bulletFontSize),
      ),
    );
  }
}
