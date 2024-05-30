// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageRender extends HookConsumerWidget {
  final int length;
  final List<File> images;

  const ImageRender({required this.length, required this.images});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    if (length == 1) {
      // Return a single Container if length is 1
      return SizedBox(
        height: size.height * 0.25,
        width: size.width,
        child: Image.file(images.first, fit: BoxFit.cover,),
      );
    } else if (length == 2) {
      // Return two Containers side by side if length is 2
      return Row(
        children: [
          Container(
            height: size.height * 0.25,
            width: size.width * 0.45,
            child: Image.file(images.first),
          ),
          const SizedBox(width: 10),
          Container(
            height: size.height * 0.25,
            width: size.width * 0.45,
            child: Image.file(images[1]),
          ),
        ],
      );
    } else {
      // Return a wrap of Containers if length is greater than 2
      return Wrap(
        children: images.map((image) {
          return Container(
            height: size.height * 0.15,
            margin: const EdgeInsets.all(10),
            width: size.width * 0.35,
            child: Image.file(image, fit: BoxFit.cover,), // Use a color or image from your image list
          );
        }).toList(),
      );
    }
  }
}
