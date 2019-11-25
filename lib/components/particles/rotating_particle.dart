import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../mixins/single_child_particle.dart';
import '../particle_component.dart';
import 'curved_particle.dart';

/// A particle which rotates its child over the lifespan
/// between two given bounds in radians
class RotatingParticle extends CurvedParticle with SingleChildParticle {
  @override
  Particle child;
  
  final double from;
  final double to;

  RotatingParticle({ 
    @required this.child,
    this.from = 0,
    this.to = 2 * pi,
    double lifespan,
    Duration duration,
  }) : super(lifespan: lifespan, duration: duration);

  double get angle => lerpDouble(from, to, progress);

  @override
  void render(Canvas canvas) {
    canvas.save();
    canvas.rotate(angle);
    super.render(canvas);
    canvas.restore();
  }
}