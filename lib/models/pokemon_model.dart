
class Pokemon
{
    String name;
    String image;
    int height;
    int weight;
    String types;
    String abilities;

  Pokemon({
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities

});
  factory Pokemon.fromJson(Map<String,dynamic>json){
    return Pokemon(
        name: json['name'],
        image: json['image'],
        height: json['height'] as int,
        weight: json['weight'] as int,
        types: json['types'],
        abilities: json['abilities'],
    );
  }

}