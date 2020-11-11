/// Provides classes related to games.
library game;

import 'package:flutter/material.dart';

import 'level.dart';

class GameContext {
  GameContext() {
    levels = <Level>[];
  }

  /// The list of pushed [Level] instances.
  List<Level> levels;
}

/// The game object.
///
/// This object should be the first thing you create, as all other classes rely upon it.
class Game extends StatefulWidget {
  const Game({@required this.child, @required this.gameContext}) : super();

  /// The child widget which this widget will display.
  final Widget child;

  /// The context for this game.
  final GameContext gameContext;

  @override
  GameState createState() => GameState();

  /// Get the most recent [Level] instance pushed onto the `levels` stack.
  Level get level =>
      gameContext.levels.isEmpty ? null : gameContext.levels.last;

  /// Push a [Level] instance onto the game context.
  ///
  /// The provided [Level] instance will have it's `onPush` method called.
  ///
  /// If [level] is not `null`, then it will have its `onCover` method called.
  void pushLevel(Level newLevel) {
    level?.onCover(newLevel);
    newLevel.onPush();
    gameContext.levels.add(newLevel);
  }

  /// Pop the most recent level from the stack.
  ///
  /// The most recent [Level] instance will have its `onPop` method called.
  void popLevel() {
    if (gameContext.levels.isNotEmpty) {
      final Level oldLevel = gameContext.levels.removeLast();
      oldLevel.onPop();
    }
  }

  /// Replace the current [Level] with a new instance.
  ///
  /// Uses [popLevel] and [pushLevel], so that all events are handled properly.
  void replaceLevel(Level newLevel) {
    popLevel();
    pushLevel(newLevel);
  }
}

class GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      child: widget.child,
      focusNode: FocusNode(),
      onKey: (RawKeyEvent e) {
        print(e);
      },
    );
  }
}
