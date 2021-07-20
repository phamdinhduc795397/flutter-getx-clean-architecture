enum CategoryType { bitcoin, apple, earthquake, animal }

extension CategoryKeyword on CategoryType {
  String get keyword {
    switch (this) {
      case CategoryType.bitcoin:
        return "bitcoin";
      case CategoryType.apple:
        return "apple";
      case CategoryType.earthquake:
        return "earthquake";
      case CategoryType.animal:
        return "animal";
    }
  }
}
