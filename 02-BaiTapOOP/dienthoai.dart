class DienThoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _slTonKho;
  bool _trangThai;

  // Constructor
  DienThoai(this._maDT, this._tenDT, this._hangSX, this._giaNhap, this._giaBan, this._slTonKho, this._trangThai);

  // Getters
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get slTonKho => _slTonKho;
  bool get trangThai => _trangThai;

  // Setters
  set maDT(String maDT) {
    if (maDT.isNotEmpty && maDT.startsWith("DT-")) {
      _maDT = maDT;
    }
  }

  set tenDT(String tenDT) {
    _tenDT = (tenDT.isNotEmpty) ? tenDT : _tenDT;
  }

  set hangSX(String hangSX) {
    _hangSX = (hangSX.isNotEmpty) ? hangSX : _hangSX;
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0 && giaNhap < giaBan) {
      _giaNhap = giaNhap;
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > giaNhap) {
      _giaBan = giaBan;
    }
  }

  set slTonKho(int slTonKho) {
    _slTonKho = (slTonKho >= 0) ? slTonKho : _slTonKho;
  }

  set trangThai(bool trangThai) {
    if (_slTonKho > 0 || trangThai == true) { // Cho phép thay đổi trạng thái nếu số lượng tồn kho > 0 hoặc nếu muốn đánh dấu trạng thái là 'còn kinh doanh'
      _trangThai = trangThai;
    } else {
      print("Không thể ngừng kinh doanh vì sản phẩm không còn hàng trong kho.");
    }
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuanDuKien() {
    // Kiểm tra nếu sản phẩm đang còn trong kinh doanh (trangThai = true)
    if (_trangThai) {
      // Lợi nhuận = (Giá bán - Giá nhập) * Số lượng tồn kho
      double loiNhuan = (_giaBan - _giaNhap) * _slTonKho;
      return loiNhuan;
    } else {
      print("Sản phẩm không khả dụng để bán.");
      return 0.0; // Không có lợi nhuận nếu sản phẩm không thể bán
    }
  }

  // Phương thức hiển thị thông tin điện thoại
  void hienThiThongTin() {
    print('Ma DT: $_maDT');
    print('Ten DT: $_tenDT');
    print('Hang SX: $_hangSX');
    print('Gia nhap: $_giaNhap');
    print('Gia ban: $_giaBan');
    print('SL ton kho: $_slTonKho');
    print('Trang thai: ${_trangThai ? 'Con kinh doanh' : 'Ngung kinh doanh'}');
  }
  
  // Phương thức kiểm tra xem sản phẩm có thể bán được không (dựa vào trangThai)
  void kiemTraCoTheBanKhong() {
    if (_trangThai) {
      print("Sản phẩm có thể bán.");
    } else {
      print("Sản phẩm không thể bán.");
    }
  }
}

void main() {
  // Tạo đối tượng sản phẩm
  DienThoai phone = DienThoai("DT-001", "Samsung Galaxy", "Samsung", 500.0, 800.0, 100, true);
  
  // Hiển thị thông tin sản phẩm
  phone.hienThiThongTin();

  // Tính lợi nhuận dự kiến
  double loiNhuan = phone.tinhLoiNhuanDuKien();
  print("Loi nhuan du kien: \$${loiNhuan}");

  // Kiểm tra xem sản phẩm có thể bán không
  phone.kiemTraCoTheBanKhong();
}
