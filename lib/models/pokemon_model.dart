
class Pokemon
{
    String name;
    String image;
    int height;
    int weight;

  Pokemon({
    required this.name,
    required this.image,
    required this.height,
    required this.weight,

});
  factory Pokemon.fromJson(Map<String,dynamic>json){
    return Pokemon(
        name: json['name'],
        image: json['image'],
        height: json['height'] as int,
        weight: json['weight'] as int,
    );
  }

}