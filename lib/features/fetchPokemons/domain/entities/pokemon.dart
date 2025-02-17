class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pokemon && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
