class PokeNameResponse {
  final List<PokeName>? results;

  PokeNameResponse({
    this.results,
  });

  factory PokeNameResponse.fromJson(Map<String, dynamic> json) {
    return PokeNameResponse(
      results: json['results'] != null
          ? List<PokeName>.from(json['results'].map((data) => PokeName.fromJson(data)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results?.map((pokemon) => pokemon.toJson()).toList(),
    };
  }
}

class PokeName {
  final String? name;
  final String? url;

  PokeName({
    this.name,
    this.url,
  });

  factory PokeName.fromJson(Map<String, dynamic> json) {
    return PokeName(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}