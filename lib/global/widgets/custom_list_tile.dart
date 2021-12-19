import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading, trailing, title, subtitle;
  const CustomListTile({
    Key? key,
    this.leading,
    this.trailing,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              leading ?? Container(),
              const SizedBox(width: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title ?? Container(),
                  subtitle ?? Container(),
                ],
              ),
            ],
          ),
          trailing ?? Container(),
        ],
      ),
    );
  }
}
