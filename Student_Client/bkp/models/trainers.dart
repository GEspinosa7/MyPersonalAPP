class Trainers {
    int id;
    String profilePicture;
    String firstname;
    String lastname;
    double avaliation;

    Trainers({this.id, this.firstname, this.lastname, this.avaliation});

    Trainers.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      profilePicture = json['profile_picture'];
      firstname = json['firstname'];
      lastname = json['lastname'];
      avaliation = json['avaliation'];
    }
}