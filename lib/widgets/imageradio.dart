import 'package:flutter/material.dart';

class ImageRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String selectImage;
  final String unSelectImage;
  final String text;
  final ValueChanged<T?> onChanged;

  const ImageRadio({
    required this.value,
    required this.groupValue,
    required this.text,
    required this.selectImage,
    required this.unSelectImage,
    required this.onChanged,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;
    return SizedBox(
      width: 30,
      height: 30,
      child: Image.asset(isSelected ? selectImage : unSelectImage),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 24),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => onChanged(value),
        child:
        _buildLabel(),
        // Padding(
        //   // padding: const EdgeInsets.all(5),
        //   child: Row(
        //     children: [
        //       _buildLabel(),
        //       const SizedBox(width: 10),
        //       // _buildText(),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}