import 'package:flutter/material.dart';

class IconButtonWidget extends StatefulWidget {
  IconButtonWidget({
    Key? key,
    this.onPressed,
    this.color,
    required this.icon,
  }) : super(key: key);
  final Color? color;
  final IconData icon;
  final Function? onPressed;
  late Function onTap;
  set setonTap(func) {
    onTap = func;
  }

  @override
  _IconButtonWidgetState createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.onPressed != null) {
      widget.onTap = widget.onPressed!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 5, bottom: 10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.secondaryContainer),
            borderRadius: BorderRadius.circular(16),
            color: widget.color ?? Theme.of(context).colorScheme.primary),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  widget.onTap();
                },
                child: Icon(
                  widget.icon,
                  color: Theme.of(context).colorScheme.onPrimary,
                ))));
  }
}
