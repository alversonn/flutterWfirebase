import 'package:flutter/material.dart';
import 'package:kicks/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:kicks/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:kicks/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, 
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
  
        child: Stack(
          children: [
          //bg custom shape
            Positioned(top: -150, right: -250, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
            Positioned(top: 100, right: -300,child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}