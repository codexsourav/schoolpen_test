class RegionModel {
  List<String>? andamanAndNicobarIslands;
  List<String>? haryana;
  List<String>? ladakh;
  List<String>? tamilNadu;
  List<String>? madhyaPradesh;
  List<String>? jharkhand;
  List<String>? mizoram;
  List<String>? nagaland;
  List<String>? himachalPradesh;
  List<String>? tripura;
  List<String>? andhraPradesh;
  List<String>? punjab;
  List<String>? chandigarh;
  List<String>? rajasthan;
  List<String>? assam;
  List<String>? odisha;
  List<String>? chhattisgarh;
  List<String>? jammuAndKashmir;
  List<String>? karnataka;
  List<String>? manipur;
  List<String>? kerala;
  List<String>? delhi;
  List<String>? dadraAndNagarHaveli;
  List<String>? puducherry;
  List<String>? uttarakhand;
  List<String>? uttarPradesh;
  List<String>? bihar;
  List<String>? gujarat;
  List<String>? telangana;
  List<String>? meghalaya;
  List<String>? arunachalPradesh;
  List<String>? maharashtra;
  List<String>? goa;
  List<String>? westBengal;

  RegionModel(
      {this.andamanAndNicobarIslands,
      this.haryana,
      this.ladakh,
      this.tamilNadu,
      this.madhyaPradesh,
      this.jharkhand,
      this.mizoram,
      this.nagaland,
      this.himachalPradesh,
      this.tripura,
      this.andhraPradesh,
      this.punjab,
      this.chandigarh,
      this.rajasthan,
      this.assam,
      this.odisha,
      this.chhattisgarh,
      this.jammuAndKashmir,
      this.karnataka,
      this.manipur,
      this.kerala,
      this.delhi,
      this.dadraAndNagarHaveli,
      this.puducherry,
      this.uttarakhand,
      this.uttarPradesh,
      this.bihar,
      this.gujarat,
      this.telangana,
      this.meghalaya,
      this.arunachalPradesh,
      this.maharashtra,
      this.goa,
      this.westBengal});

  RegionModel.fromJson(Map<String, dynamic> json) {
    andamanAndNicobarIslands =
        json['Andaman and Nicobar Islands'].cast<String>();
    haryana = json['Haryana'].cast<String>();
    ladakh = json['Ladakh'].cast<String>();
    tamilNadu = json['Tamil Nadu'].cast<String>();
    madhyaPradesh = json['Madhya Pradesh'].cast<String>();
    jharkhand = json['Jharkhand'].cast<String>();
    mizoram = json['Mizoram'].cast<String>();
    nagaland = json['Nagaland'].cast<String>();
    himachalPradesh = json['Himachal Pradesh'].cast<String>();
    tripura = json['Tripura'].cast<String>();
    andhraPradesh = json['Andhra Pradesh'].cast<String>();
    punjab = json['Punjab'].cast<String>();
    chandigarh = json['Chandigarh'].cast<String>();
    rajasthan = json['Rajasthan'].cast<String>();
    assam = json['Assam'].cast<String>();
    odisha = json['Odisha'].cast<String>();
    chhattisgarh = json['Chhattisgarh'].cast<String>();
    jammuAndKashmir = json['Jammu and Kashmir'].cast<String>();
    karnataka = json['Karnataka'].cast<String>();
    manipur = json['Manipur'].cast<String>();
    kerala = json['Kerala'].cast<String>();
    delhi = json['Delhi'].cast<String>();
    dadraAndNagarHaveli = json['Dadra and Nagar Haveli'].cast<String>();
    puducherry = json['Puducherry'].cast<String>();
    uttarakhand = json['Uttarakhand'].cast<String>();
    uttarPradesh = json['Uttar Pradesh'].cast<String>();
    bihar = json['Bihar'].cast<String>();
    gujarat = json['Gujarat'].cast<String>();
    telangana = json['Telangana'].cast<String>();
    meghalaya = json['Meghalaya'].cast<String>();
    himachalPradesh = json['Himachal Pradesh '].cast<String>();
    arunachalPradesh = json['Arunachal Pradesh'].cast<String>();
    maharashtra = json['Maharashtra'].cast<String>();
    goa = json['Goa'].cast<String>();
    westBengal = json['West Bengal'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Andaman and Nicobar Islands'] = this.andamanAndNicobarIslands;
    data['Haryana'] = this.haryana;
    data['Ladakh'] = this.ladakh;
    data['Tamil Nadu'] = this.tamilNadu;
    data['Madhya Pradesh'] = this.madhyaPradesh;
    data['Jharkhand'] = this.jharkhand;
    data['Mizoram'] = this.mizoram;
    data['Nagaland'] = this.nagaland;
    data['Himachal Pradesh'] = this.himachalPradesh;
    data['Tripura'] = this.tripura;
    data['Andhra Pradesh'] = this.andhraPradesh;
    data['Punjab'] = this.punjab;
    data['Chandigarh'] = this.chandigarh;
    data['Rajasthan'] = this.rajasthan;
    data['Assam'] = this.assam;
    data['Odisha'] = this.odisha;
    data['Chhattisgarh'] = this.chhattisgarh;
    data['Jammu and Kashmir'] = this.jammuAndKashmir;
    data['Karnataka'] = this.karnataka;
    data['Manipur'] = this.manipur;
    data['Kerala'] = this.kerala;
    data['Delhi'] = this.delhi;
    data['Dadra and Nagar Haveli'] = this.dadraAndNagarHaveli;
    data['Puducherry'] = this.puducherry;
    data['Uttarakhand'] = this.uttarakhand;
    data['Uttar Pradesh'] = this.uttarPradesh;
    data['Bihar'] = this.bihar;
    data['Gujarat'] = this.gujarat;
    data['Telangana'] = this.telangana;
    data['Meghalaya'] = this.meghalaya;
    data['Himachal Pradesh '] = this.himachalPradesh;
    data['Arunachal Pradesh'] = this.arunachalPradesh;
    data['Maharashtra'] = this.maharashtra;
    data['Goa'] = this.goa;
    data['West Bengal'] = this.westBengal;
    return data;
  }
}