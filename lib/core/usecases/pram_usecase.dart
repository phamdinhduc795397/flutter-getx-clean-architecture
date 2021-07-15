abstract class ParamUseCase<Type, Params> {
  Future<Type> execute(Params params);
}
