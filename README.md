# PostTip

PostTip is a flutter tooltip library that can easily add tooltip around a target widget.There are great tooltip libraries out there such as [ElToolTip](https://github.com/marcelogil/el_tooltip) which I mostly inspired and JustToolTip, SuperToolTip.

The difference between this library and others is its implementation. PostTip uses CompositedTransformFollower and CompositedTransformTarget to set the position of tooltip content and child widget.

I would also recommend you to use [ElToolTip](https://github.com/marcelogil/el_tooltip) as it it safer to use, has more stars and features.

This project is at the first stage of ToolTip features and will be updated more features soon.

## Getting started

pubspec.yaml

```yaml
post_it: <latest_version>
```

project

```dart
MaterialApp(
  title: 'PostTip Demo',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  ),
  home: Scaffold(
    body: Center(
      child: PostTip(
        position: PostTipPosition.topStart,
        distance: 4,
        backgroundColor: Colors.lightBlue,
        content: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text('PostTip'),
        ),
        child: Container(
          color: Colors.yellow,
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 64.0,
          ),
        ),
      ),
    ),
  ),
);
```

## Demo

![PostTip Demo](https://github.com/monolith-rnd/post-tip/blob/main/art/demo.webp)
