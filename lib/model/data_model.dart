class Data {
  String id;
  String owner_id;
  String img_foto;
  String nama_lengkap;
  int role_id;
  String role_name;
  String owner_name;
  String owner_address;
  String owner_phone;
  int punya_cabang;

  Data(
      {required this.nama_lengkap,
      required this.id,
      required this.owner_id,
      required this.img_foto,
      required this.role_id,
      required this.role_name,
      required this.owner_name,
      required this.owner_address,
      required this.owner_phone,
      required this.punya_cabang});

  @override
  String toString() {
    return 'Data{id: $id, nama_lengkap: $nama_lengkap, owner_id: $owner_id, img_foto: $img_foto, role_id: $role_id, owner_name: $owner_name, role_name: $role_name, owner_address: nama_lengkap: $nama_lengkap, $owner_address, owner_phone: $owner_phone, punya_cabang: $punya_cabang,}';
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        nama_lengkap: json['nama_lengkap'],
        owner_id: json['owner_id'],
        img_foto: json['img_foto'],
        role_id: json['role_id'],
        role_name: json['role_name'],
        owner_name: json['owner_name'],
        owner_address: json['owner_address'],
        owner_phone: json['owner_phone'],
        punya_cabang: json['punya_cabang'] as int);
  }
}
