abstract class ParamUseCase<Type, Params> {
  Future<Type> execute(Params params);
}

abstract class NoParamUseCase<Type> {
  Future<Type> execute();
}
