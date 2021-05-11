
class Registrations {
    String dateOfBirth;
    String email;
    String firstName;
    int id;
    String imei;
    String lastName;
    String passport;
    String picturePath;

    Registrations({this.dateOfBirth, this.email, this.firstName, this.id, this.imei, this.lastName, this.passport, this.picturePath});

    factory Registrations.fromJson(Map<String, dynamic> json) {
        return Registrations(
            dateOfBirth: json['dateOfBirth'], 
            email: json['email'], 
            firstName: json['firstName'], 
            id: json['id'], 
            imei: json['imei'], 
            lastName: json['lastName'], 
            passport: json['passport'], 
            picturePath: json['picturePath'], 
        );

    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['dateOfBirth'] = this.dateOfBirth;
        data['email'] = this.email;
        data['firstName'] = this.firstName;
        data['id'] = this.id;
        data['imei'] = this.imei;
        data['lastName'] = this.lastName;
        data['passport'] = this.passport;
        data['picturePath'] = this.picturePath;
        return data;
    }
}