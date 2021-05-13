
class Registrations {
    // String dobirth;
    String email;
    String firstName;
    int id;
    String imei;
    String lastName;
    String passport;
    String picturePath;
    String lat;
    String lon;
    String device;


    Registrations({ this.email, this.firstName, this.id, this.imei, this.lastName, this.passport, this.picturePath,this.lon,this.device,this.lat});

    factory Registrations.fromJson(Map<String, dynamic> json) {
        return Registrations(
            // dobirth: json['dobirth'],
            email: json['email'],
            firstName: json['firstName'],
            id: json['id'],
            imei: json['imei'],
            lastName: json['lastName'],
            passport: json['passport'],
            picturePath: json['picturepath'],
            lat: json['lat'],
            lon: json['lon'],
            device: json['device'],
        );

    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        // data['dobirth'] = this.dobirth;
        data['email'] = this.email;
        data['firstName'] = this.firstName;
        data['id'] = this.id;
        data['imei'] = this.imei;
        data['lastName'] = this.lastName;
        data['passport'] = this.passport;
        data['picturepath'] = this.picturePath;
        data['lat'] = this.lat;
        data['lon'] = this.lon;
        data['device'] = this.device;
        return data;
    }
}