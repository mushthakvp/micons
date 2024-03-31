library micons;

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micons/source.dart';

/// The [MIcons] class is a custom widget that displays an SVG icon.
/// The [MIcons] class extends the [StatefulWidget] class.
/// The [MIcons] class has a constructor that takes the following parameters:
/// - [icon] (required): The SVG icon as a string.
/// - [color] (optional): The color of the icon.
/// - [size] (optional): The size of the icon.
/// The [MIcons] class has a [build] method that returns a [SvgPicture] widget.
/// The [SvgPicture] widget displays the SVG icon.

class MIcons extends StatefulWidget {
  const MIcons({
    super.key,
    required this.icon,
    this.color,
    this.size,
    this.filled,
  });
  final String icon;
  final Color? color;
  final double? size;
  final bool? filled;

  @override
  State<MIcons> createState() => _MIconsState();
}

class _MIconsState extends State<MIcons> {
  @override
  Widget build(BuildContext context) {
    /// The [processedIcon] variable is used to store the processed SVG icon.
    /// The [processedIcon] variable is initialized to an empty string.
    String processedIcon = Source.getSource(
      widget.filled == true ? "${widget.icon}Outline" : widget.icon,
    );

    /// The [processedIcon] variable is used to store the processed SVG icon.
    /// The [processedIcon] variable is initialized to an empty string.
    /// The [processedIcon] variable is used to store the processed SVG icon.
    /// The [processedIcon] variable is initialized to an empty string.
    /// The [processedIcon] variable is used to store the processed SVG icon.

    /// Convert the SVG string to a Uint8List [Uint8List].
    /// This is necessary because the [SvgPicture.memory] constructor
    /// requires a [Uint8List] as input.
    /// The [Uint8List] is created from the UTF-8 encoded string.
    /// The [Utf8Encoder] is used to encode the string to UTF-8.
    /// The [Uint8List] is created from the UTF-8 encoded string.
    /// The [Uint8List] is then passed to the [SvgPicture.memory] constructor.
    /// The [SvgPicture.memory] constructor is used to display the SVG image.
    Uint8List data = Uint8List.fromList(utf8.encode(processedIcon));
    return SvgPicture.memory(
      /// The [data] property is set to the [Uint8List]
      /// that was created from the UTF-8 encoded string.
      data,

      /// The [height] and [width] properties are set to 34.
      height: widget.size ?? 34,
      width: widget.size ?? 34,

      /// The [color] property is set to [Theme.of(context).colorScheme.onPrimary].
      /// This is the color of the icon.
      cacheColorFilter: true,
      color: widget.color ?? Colors.black,

      /// The [fit] property is set to [BoxFit.contain].
      /// This is the fit of the icon.
      /// The [BoxFit.contain] value is used to scale the icon to fit the parent widget.
    );
  }
}
