class Info {
  //final int id;
  final String name;
  final String description;
  final String price;
  //final String user_id;


  Info({  this.name, this.description, this.price  });

  factory Info.fromJson(Map<dynamic, dynamic> json) {
    return Info(

      //id : int.parse(json['id']),
      name: json['userName'],
      description: json['description'],
      price: json['price'],

      //   //id: json['id'] ,
      //   name: json['userName'],
      // description: json['description'],
      //   //price: json['balance'],
      //  // user_id: json['user_id']


    );
  }

}