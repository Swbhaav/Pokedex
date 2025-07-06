
class Pokemon
{
    String name;
    String image;

  Pokemon({
    required this.name,
    required this.image,

});
  factory Pokemon.fromJson(Map<String,dynamic>json){
    return Pokemon(
        name: json['name'],
        image: json['image']
    );
  }

}