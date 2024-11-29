import 'dienthoai.dart';

class HoaDon{
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dtDuocBan;
  int _slMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _sdtKH;

  //constructor
  HoaDon(this._maHoaDon,this._ngayBan,this._dtDuocBan,this._slMua,this._giaBanThucTe,this._tenKhachHang,this._sdtKH);

  //getters
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dtDuocBan => _dtDuocBan;
  int get slMua => _slMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get sdtKH => _sdtKH;

  //setters
  set maHoaDon(String maHoaDon){
    if (maHoaDon.isNotEmpty && maHoaDon.startsWith("HD-")) {
      _maHoaDon = maHoaDon;
    }
  }

  set ngayBan(DateTime ngayBan){
    if (ngayBan.isBefore(DateTime.now())){
      _ngayBan=ngayBan;
    }
  }

  set slMua(int slMua) {
    if (slMua > 0 && slMua <= _dtDuocBan.slTonKho) {
      _slMua = slMua;
    }
  }
  
  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    }
  }

  set tenKhachHang(String tenKhachHang) {
    _tenKhachHang=(tenKhachHang.isNotEmpty)? tenKhachHang: _tenKhachHang;
  }

  set sdtKH(String sdtKH) {
    if (sdtKH.isNotEmpty && RegExp(r'^\d{10,11}\$').hasMatch(sdtKH)) {
      _sdtKH = sdtKH;
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _slMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    double giaNhap = _dtDuocBan.giaNhap;
    return (_giaBanThucTe - giaNhap) * _slMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại: $_sdtKH');
    print('Sản phẩm: ${_dtDuocBan.tenDT}');
    print('Số lượng mua: $_slMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Tổng tiền: ${tinhTongTien()}');
    print('Lợi nhuận: ${tinhLoiNhuanThucTe()}');
  }
}