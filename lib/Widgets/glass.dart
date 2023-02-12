import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DarkMode/DarkThemeProvider.dart';

class GlassMorphism extends StatefulWidget {
  final Widget child;
  final double start;
  final double end;
  final double topRight;
  final double topLeft;
  final double bottomLeft;
  final double bottomRight;
  final double blurx;
  final double blury;
  const GlassMorphism({
    Key? key,
    required this.child,
    required this.start,
    required this.end,
    required this.topRight,
    required this.topLeft,
    required this.bottomLeft,
    required this.bottomRight,
    required this.blurx,
    required this.blury,
  }) : super(key: key);
  @override
  State<GlassMorphism> createState() => _GlassMorphismState();
}

class _GlassMorphismState extends State<GlassMorphism> {
  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: widget.blurx, sigmaY: widget.blury),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(widget.start),
                Colors.white.withOpacity(widget.end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: BorderRadius.only(
              topRight:Radius.circular(widget.topRight),
              topLeft:Radius.circular(widget.topLeft),
              bottomLeft:Radius.circular(widget.bottomLeft),
              bottomRight:Radius.circular(widget.bottomRight),
            ),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity( object ? 0.2 : 1),
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

