import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SlidePage extends StatefulWidget {
  const SlidePage(
      {super.key,
      required this.pageContent,
      required this.endOfPageCallback,
      required this.begingingOfPageCallback,
      this.firstWidgetIsTitle = true});

  final List<Widget> pageContent;
  final Function endOfPageCallback;
  final Function begingingOfPageCallback;
  final bool firstWidgetIsTitle;

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  var itemCounter = 0;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    if (widget.firstWidgetIsTitle) {
      itemCounter++;
    }
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event.runtimeType == KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        setState(() {
          moveBackward();
        });
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        setState(() {
          moveForward();
        });
      }
    }
  }

  void moveForward() {
    itemCounter++;
    if (itemCounter <= widget.pageContent.length - 1) {
      setState(() {});
    } else {
      itemCounter = widget.pageContent.length - 1;
      widget.endOfPageCallback();
    }
  }

  void moveBackward() {
    if (itemCounter == 0) {
      widget.begingingOfPageCallback();
    } else {
      itemCounter--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      autofocus: true,
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: InkWell(
        onTap: moveForward,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: widget.pageContent.length,
            itemBuilder: (BuildContext context, int index) {
              return Visibility(
                  visible: index <= itemCounter,
                  child: widget.pageContent[index]);
            },
          ),
        ),
      ),
    );
  }
}
