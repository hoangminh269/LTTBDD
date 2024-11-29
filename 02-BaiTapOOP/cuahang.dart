import 'dienthoai.dart';
import 'hoadon.dart';
import 'dart:core';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai;
  List<HoaDon> _danhSachHoaDon;

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi)
      : _danhSachDienThoai = [],
        _danhSachHoaDon = [];

  // Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;
  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dt) {
    _danhSachDienThoai.add(dt);
    print('Đã thêm điện thoại: ${dt.tenDT}');
  }

  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDT, String tenMoi, double giaNhapMoi, double giaBanMoi, int slTonKhoMoi) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDT == maDT) {
        dt.tenDT = tenMoi;
        dt.giaNhap = giaNhapMoi;
        dt.giaBan = giaBanMoi;
        dt.slTonKho = slTonKhoMoi;
        print('Cập nhật thành công cho mã điện thoại $maDT');
        return;
      }
    }
    print('Không tìm thấy điện thoại có mã $maDT');
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanh(String maDT) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDT == maDT) {
        dt.slTonKho = 0;
        dt.trangThai = false;
        print('Điện thoại mã $maDT đã ngừng kinh doanh.');
        return;
      }
    }
    print('Không tìm thấy điện thoại có mã $maDT');
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    print('Danh sách điện thoại:');
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
      print('---');
    }
  }

  // Tạo hóa đơn mới
  void taoHoaDon(HoaDon hoaDon) {
    if (hoaDon.slMua <= hoaDon.dtDuocBan.slTonKho) {
      _danhSachHoaDon.add(hoaDon);
      hoaDon.dtDuocBan.slTonKho -= hoaDon.slMua;
      print('Hóa đơn ${hoaDon.maHoaDon} đã được tạo.');
    } else {
      print('Số lượng mua vượt quá tồn kho. Không thể tạo hóa đơn.');
    }
  }

  // Tìm kiếm hóa đơn theo mã
  HoaDon? timHoaDonTheoMa(String maHoaDon) {
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.maHoaDon == maHoaDon) {
        return hoaDon;
      }
    }
    print('Không tìm thấy hóa đơn với mã $maHoaDon');
    return null;
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    print('Danh sách hóa đơn:');
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTin();
      print('---');
    }
  }

  // Thống kê tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double tongDoanhThu = 0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        tongDoanhThu += hoaDon.tinhTongTien();
      }
    }
    return tongDoanhThu;
  }

  // Thống kê lợi nhuận thực tế
  double tinhTongLoiNhuan() {
    double tongLoiNhuan = 0;
    for (var hoaDon in _danhSachHoaDon) {
      tongLoiNhuan += hoaDon.tinhLoiNhuanThucTe();
    }
    return tongLoiNhuan;
  }
}
