part of 'extensions.dart';

extension ObjectUtils<T> on T? {
  R? safeCast<R>() {
    final that = this;
    if (that is R) {
      return that;
    }

    Log.e('Error: safeCast: $this is not $R');

    return null;
  }

  R? let<R>(R Function(T)? cb) {
    final that = this;
    if (that == null) {
      return null;
    }

    return cb?.call(that);
  }
}
