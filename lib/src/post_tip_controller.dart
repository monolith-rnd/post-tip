import 'package:flutter/material.dart';

enum PostTipStatus { shown, hidden }

typedef ShowPostTipCallback = Future<void> Function();
typedef HidePostTipCallback = Future<void> Function();

class PostTipController extends ValueNotifier<PostTipStatus> {
  ShowPostTipCallback? showTip;
  HidePostTipCallback? hideTip;

  PostTipController({PostTipStatus? value}) : super(value ?? PostTipStatus.shown) {
    showTip = null;
    hideTip = null;
  }

  void attach({ShowPostTipCallback? showTip, HidePostTipCallback? hideTip}) {
    this.showTip = showTip;
    this.hideTip = hideTip;
  }

  bool get isShown => value == PostTipStatus.shown;

  Future<void> show() async {
    if (value == PostTipStatus.shown) return;

    value = PostTipStatus.shown;
    await showTip?.call();
    notifyListeners();
  }

  Future<void> hide() async {
    if (value == PostTipStatus.hidden) return;

    value = PostTipStatus.hidden;
    await hideTip?.call();
    notifyListeners();
  }

  Future<void> toggle() async {
    if (isShown) {
      await hide();
    } else {
      await show();
    }
  }

  void notify(PostTipStatus status) {
    if (value != status) {
      value = status;
      notifyListeners();
    }
  }
}
