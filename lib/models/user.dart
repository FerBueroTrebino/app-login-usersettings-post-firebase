class User {
  final String id;
  final String userName;
  final String adress;
  final String mapLocation;
  final String phoneNumber;
  final String email;
  final String userRole;
  final String nodes;
  final String userImg;

  User({
    this.id,
    this.userName,
    this.adress,
    this.mapLocation,
    this.phoneNumber,
    this.email,
    this.userRole,
    this.nodes,
    this.userImg,
  });

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        userName = data['userName'],
        adress = data['adress'],
        mapLocation = data['mapLocation'],
        phoneNumber = data['phoneNumber'],
        email = data['email'],
        userRole = data['userRole'],
        nodes = data['nodes'],
        userImg = data['userImg'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'adress': adress,
      'mapLocation': mapLocation,
      'phoneNumber': phoneNumber,
      'email': email,
      'userRole': userRole,
      'nodes': nodes,
      'userImg': userImg,
    };
  }
}
