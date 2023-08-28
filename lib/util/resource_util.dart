sealed class Resource<T> {
  final T? data;
  final String? message;

  const Resource({this.data, this.message});
}

final class ResourceSuccess<T> extends Resource<T> {
  ResourceSuccess({super.data});
}

final class ResourceError<T> extends Resource<T> {
  ResourceError({super.data, super.message});
}
