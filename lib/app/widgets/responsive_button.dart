import 'package:flutter/material.dart';
import 'package:seasalon/app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  Color? color;
  double? height;

  ResponsiveButton({
    super.key,
    this.isResponsive = false,
    this.width,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? width : double.maxFinite,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: AppText(
                      text: "Booking Now",
                      color: Colors.white,
                    ),
                  )
                : Container(),
            isResponsive == false
                ? const Icon(
                    Icons.keyboard_double_arrow_right_outlined,
                    color: Colors.black,
                    size: 24.0,
                  )
                : Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: const Icon(
                      Icons.keyboard_double_arrow_right_outlined,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
