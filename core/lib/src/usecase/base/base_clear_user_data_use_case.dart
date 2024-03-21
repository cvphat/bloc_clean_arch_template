part of 'base.dart';

abstract class BaseClearUserDataUseCase
    extends BaseFutureUseCase<ClearUserDataInput, ClearUserDataOutput> {}

class ClearUserDataInput extends BaseInput {
  const ClearUserDataInput();
}

class ClearUserDataOutput extends BaseOutput {
  const ClearUserDataOutput();
}

class FakeClearUserDataUseCase extends BaseClearUserDataUseCase {
  @override
  Future<ClearUserDataOutput> buildUseCase(ClearUserDataInput input) {
    throw UnimplementedError(
        'Just fake instace of use case to init common bloc');
  }
}
