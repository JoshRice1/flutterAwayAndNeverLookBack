import 'package:flutter/material.dart';
import 'package:flutter_away_and_never_look_back/widgets/slide_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitlePage extends StatelessWidget {
  const TitlePage(
      {super.key,
      required this.endOfPageCallback,
      required this.begingingOfPageCallback});

  final Function endOfPageCallback;
  final Function begingingOfPageCallback;

  @override
  Widget build(BuildContext context) {
    return SlidePage(
        firstWidgetIsTitle: false,
        endOfPageCallback: endOfPageCallback,
        begingingOfPageCallback: begingingOfPageCallback,
        pageContent: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              constraints: const BoxConstraints(
                                  maxHeight: 200,
                                  minHeight: 75,
                                  minWidth: 50,
                                  maxWidth: 150),
                              child: Image.asset('assets/flutter-logo.png')),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.presentationTitle,
                            style: getTitleTextStyle(context),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/come-to-dart-side.png',
                        height: 250,
                      )),
                ],
              ),
            ),
          ),
        ]);
  }

  TextStyle? getTitleTextStyle(
    BuildContext context,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 900) {
      return Theme.of(context).primaryTextTheme.displayLarge;
    } else if (screenWidth > 575) {
      return Theme.of(context).primaryTextTheme.displayMedium;
    } else if (screenWidth > 475) {
      return Theme.of(context).primaryTextTheme.displaySmall;
    } else {
      return Theme.of(context).primaryTextTheme.headlineSmall;
    }
  }
}
