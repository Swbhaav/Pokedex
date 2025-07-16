
class Pokemon
{
    String name;
    String image;
    double? height;
    double? weight;

  Pokemon({
    required this.name,
    required this.image,
    this.height,
    this.weight,

});
  factory Pokemon.fromJson(Map<String,dynamic>json){
    return Pokemon(
        name: json['name'],
        image: json['image'],
        height: json['height'],
        weight: json['weight'],
    );
  }

}