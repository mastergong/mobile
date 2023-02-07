class HttpClass {
  String url;
  String method;

  HttpClass({required this.url, required this.method});
}

class HttpMethod {
  static String get _GET => 'GET';
  static String get _POST => 'POST';
}

class HttpUrl {
  static String apiversion = 'v1';
  static String baseUrl = '';

  static HttpClass startAppApi({String coopCode = '0001'}) =>
      HttpClass(url: '/app/start/$coopCode', method: HttpMethod._GET); //refresh

  static HttpClass refreshToken =
      HttpClass(url: '/token/refresh', method: HttpMethod._POST); //refresh
  static HttpClass login =
      HttpClass(url: '/login', method: HttpMethod._POST); //เข้าสู่ระบบ

  static HttpClass logout =
      HttpClass(url: '/logout', method: HttpMethod._GET); //เข้าสู่ระบบ

  static HttpClass profile =
      HttpClass(url: '/member/profile', method: HttpMethod._GET); //ข้อมูลสมาชิก

  static HttpClass savingList = HttpClass(
      url: '/moneyaccount/saving/list', method: HttpMethod._GET); //บัญชีเงินฝาก

  static HttpClass guarantee = HttpClass(
      url: '/guarantee', method: HttpMethod._GET); //การค้ำประกันผู้อื่น

  static HttpClass beneficiary = HttpClass(
      url: '/beneficiary', method: HttpMethod._GET); // ผู้รับผลประโยชน์

  static HttpClass share =
      HttpClass(url: '/share', method: HttpMethod._GET); // หุ้น

  static HttpClass billing =
      HttpClass(url: '/billing', method: HttpMethod._GET); // ใบเสร็จ

  static HttpClass dividend = HttpClass(
      url: '/dividend', method: HttpMethod._GET); //รายการ ปันผลเฉลี่ยคืน

  static HttpClass loancontract = HttpClass(
      url: '/loan/contract', method: HttpMethod._GET); //ข้อมูลติดต่อสหกรณ์

  static HttpClass savinginfo(String savingAccId) => HttpClass(
      url: '/savinginfo/$savingAccId', method: HttpMethod._GET); //บัญชีเงินฝาก

  static HttpClass interestSavingInfo = HttpClass(
      url: '/rate/saving', method: HttpMethod._GET); //ข้อมูลดอกเบี้ยเงินฝาก
  static HttpClass interestSavingFixedInfo = HttpClass(
      url: '/rate/savingfixed',
      method: HttpMethod._GET); //ข้อมูลดอกเบี้ยเงินฝากประจำ
  static HttpClass interestLoanInfo = HttpClass(
      url: '/rate/loan', method: HttpMethod._GET); //ข้อมูลดอกเบี้ยเงินกู้
  static HttpClass savingstatement(String savingAccId, String yyyymm) =>
      HttpClass(
          url: '/moneyaccount/saving/statement/$savingAccId/$yyyymm*?',
          method: HttpMethod._GET); //รายการเดินบัญชี

  static HttpClass loanstatement(String contractId, String yyyymm) => HttpClass(
      url: '/moneyaccount/loan/statement/$contractId/$yyyymm*?',
      method: HttpMethod._GET); //รายการ เงินกู้

  static HttpClass loanguarantee(String contractNo) => HttpClass(
      url: '/loan/contract/$contractNo/guarantee',
      method: HttpMethod._GET); //ค้ำประกันเงินกู้ตามสัญญา

  static HttpClass loancollateral(String contractNo) => HttpClass(
      url: '/loan/contract/$contractNo/collateral', method: HttpMethod._GET);

  static HttpClass dividendyearly(String yearly) => HttpClass(
      url: '/dividend/yearly/$yearly/deduction', method: HttpMethod._GET);

  static HttpClass pushnotificationSummary =
      HttpClass(url: '/pushnotification/summary', method: HttpMethod._GET);

  static HttpClass pushnotificationDetial(String notifyId) => HttpClass(
      url: '/pushnotification/detail/$notifyId', method: HttpMethod._GET);

  static HttpClass pushnotificationUpdatestate =
      HttpClass(url: 'pushnotification/update/state', method: HttpMethod._POST);
}
