import 'package:flutter/material.dart';

enum PostTipStatus { shown, hidden }

typedef ShowPostTipCallback = Future<void> Function();
typedef HidePostTipCallback = Future<void> Function();

class PostTipController {
  ShowPostTipCallback _showTip = () async {};
  HidePostTipCallback _hideTip = () async {};
  bool Function() _isShown = () => false;

  PostTipController({PostTipStatus? value});

  void attach({
    required Future<void> Function() showTip,
    required Future<void> Function() hideTip,
    required bool Function() isShown,
  }) {
    _showTip = showTip;
    _hideTip = hideTip;
    _isShown = isShown;
  }

  bool get isShown => _isShown();

  Future<void> show() async {
    if (!isShown) {
      await _showTip();
    }
  }

  Future<void> hide() async {
    if (isShown) {
      await _hideTip();
    }
  }

  Future<void> toggle() async {
    if (isShown) {
      await hide();
    } else {
      await show();
    }
  }
}
