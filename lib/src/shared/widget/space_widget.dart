import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final Size size;
  const Space({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
    );
  }
}

class SSpace extends Space {
  const SSpace({
    super.key,
  }) : super(size: const Size(4, 4));
}

class MSpace extends Space {
  const MSpace({
    super.key,
  }) : super(size: const Size(8, 8));
}

class XMSpace extends Space {
  const XMSpace({
    super.key,
  }) : super(size: const Size(16, 16));
}

class LSpace extends Space {
  const LSpace({
    super.key,
  }) : super(size: const Size(20, 20));
}

class XLSpace extends Space {
  const XLSpace({
    super.key,
  }) : super(size: const Size(32, 32));
}
