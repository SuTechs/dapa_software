import 'package:flutter/widgets.dart';

enum CustomIndicatorSize {
  tiny,
  normal,
  full,
}

class CustomIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final CustomIndicatorSize indicatorSize;

  const CustomIndicator({
    this.indicatorHeight = 3,
    required this.indicatorColor,
    this.indicatorSize = CustomIndicatorSize.normal,
  });

  @override
  CustomIndicatorPainter createBoxPainter([VoidCallback? onChanged]) {
    return CustomIndicatorPainter(this, onChanged);
  }
}

class CustomIndicatorPainter extends BoxPainter {
  final CustomIndicator decoration;

  CustomIndicatorPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    Rect rect;
    if (decoration.indicatorSize == CustomIndicatorSize.full) {
      rect = Offset(
            offset.dx,
            configuration.size!.height - decoration.indicatorHeight,
          ) &
          Size(configuration.size!.width, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == CustomIndicatorSize.tiny) {
      rect = Offset(
            offset.dx + configuration.size!.width / 2 - 8,
            configuration.size!.height - decoration.indicatorHeight,
          ) &
          Size(16, decoration.indicatorHeight);
    } else {
      rect = Offset(
            offset.dx + 6,
            configuration.size!.height - decoration.indicatorHeight,
          ) &
          Size(configuration.size!.width - 12, decoration.indicatorHeight);
    }

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
      ),
      paint,
    );
  }
}
