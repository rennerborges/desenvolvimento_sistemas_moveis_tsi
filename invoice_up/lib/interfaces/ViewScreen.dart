class ViewScreen {
  bool home = false;
  bool registerInvoices = false;

  ViewScreen({this.home = false, this.registerInvoices = false});

  factory ViewScreen.fromJson(Map<String, dynamic> json) => ViewScreen(
        home: json['home'],
        registerInvoices: json['registerInvoices'],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "registerInvoices": registerInvoices,
      };
}
