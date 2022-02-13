class UserLoginModel
{
  late  bool status ;
  late String message ;
  late UserModel customer ;
  UserLoginModel({
    required this.message,
    required this.status,
    required this.customer,
}) ;
  UserLoginModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'] ;
    message=json['message'] ;
    customer=UserModel.fromJson(json['customer']) ;
  }
}
class UserModel
{
  late String uId ;
  late String name ;
  late String email ;
  late String password ;
  late  String phone ;
  late String link ;
  late  int numberOfNotifications ;
  UserModel({
   required this.name,
   required this.uId,
   required this.phone,
   required this.email,
   required this.password,
   required this.link,
   required this.numberOfNotifications,
});
  UserModel.fromJson(Map<String,dynamic>json)
  {
    uId=json['uId'];
    name=json['name'];
    email=json['email'];
    password=json['password'];
    phone=json['phone'];
    link=json['link'];
    numberOfNotifications=json['numberOfNotifications'];
  }
}