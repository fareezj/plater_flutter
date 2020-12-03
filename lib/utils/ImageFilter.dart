import 'package:flutter/material.dart';
import 'package:plater_flutter/utils/ColorFilterGenerator.dart';

Widget ImageFilter({brightness, saturation, hue, child}) {
  return ColorFiltered(
      colorFilter: ColorFilter.matrix(
          ColorFilterGenerator.brightnessAdjustMatrix(
            value: brightness,
          )
      ),
      child: ColorFiltered(
          colorFilter: ColorFilter.matrix(
              ColorFilterGenerator.saturationAdjustMatrix(
                value: saturation,
              )
          ),
          child: ColorFiltered(
            colorFilter: ColorFilter.matrix(
                ColorFilterGenerator.hueAdjustMatrix(
                  value: hue,
                )
            ),
            child: child,
          )
      )
  );
}