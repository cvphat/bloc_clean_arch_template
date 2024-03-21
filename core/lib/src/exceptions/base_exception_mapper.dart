part of 'exceptions.dart';

abstract class BaseExceptionMapper {
  const BaseExceptionMapper();

  String map(BaseException appException);
}
