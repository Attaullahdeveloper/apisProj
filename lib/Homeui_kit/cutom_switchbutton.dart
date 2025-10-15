import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller.dart';
class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

   CustomSwitch({required this.value, required this.onChanged});
  Statecontroller obj=Get.put(Statecontroller());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 40.0, // Track width
        height: 18.0, // Track height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Color(0xffD4E2FD)
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: value ? 22.0 : 0.0, // (width - toggleSize) for right edge
              child: Container(
                width: 17.0, // Toggle width (slightly larger than height)
                height: 17.0, // Toggle height
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value?Color(0xffFFFFFF):Color(0xff2666DE),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}