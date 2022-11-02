class Invoice {
  String? id;
  late String title;
  late String placeOfPurchase;
  late String dateOfPurchase;
  String? dateOfWarranty;
  late double price;
  late String image;
  late String emailUser;

  Invoice({
    this.id,
    this.dateOfWarranty,
    required this.emailUser,
    required this.title,
    required this.placeOfPurchase,
    required this.dateOfPurchase,
    required this.price,
    required this.image,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json['_id'],
        title: json['title'],
        placeOfPurchase: json['placeOfPurchase'],
        dateOfPurchase: json['dateOfPurchase'],
        dateOfWarranty: json['dateOfWarranty'],
        emailUser: json['emailUser'],
        price: double.parse(json['price']),
        image: json['image'],
      );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "placeOfPurchase": placeOfPurchase,
      "dateOfPurchase": dateOfPurchase,
      "dateOfWarranty": dateOfWarranty ?? "",
      "emailUser": emailUser,
      "price": price.toString(),
      "image": image,
    };
  }
}
