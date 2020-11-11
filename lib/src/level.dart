/// Provides the [Level] class.
library level;

/// The type of level callbacks.
typedef CallbackType = void Function();

/// A level object.
///
/// Instances of this class represent state machines which handle various user interface events, such as keys on a keyboard being pressed and released.
class Level {
  const Level({this.onPush, this.onPop, this.onCover});

  /// The function to be called when this level is pushed onto a [Game] instance.
  final CallbackType onPush;

  /// The function to be called when this level is popped from a [Game] instance.
  final CallbackType onPop;

  /// The function to be called when this level instance is covered by another.
  final void Function(Level) onCover;
}
