class Info {
  final int id;
  final String name;
  final String description;
  final int price;
  final String user_id;


  Info({this.id, this.name, this.description, this.price, this.user_id});

  factory Info.fromJson(Map<dynamic, dynamic> json) {
    return Info(





        id: json['id'] ,
        name: json['userName'],
        description: json['account'],
        price: json['balance'],
        user_id: json['user_id']


    );
  }

}