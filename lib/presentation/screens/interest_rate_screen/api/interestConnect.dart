import 'dart:convert';

import '../../../../core/network/dioClient.dart';
import '../../../../data/models_json/resultState.dart';
import '../../../../data/network/http_url.dart';

// String token0 =
//     'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiMTE1NmM3ZjYyNDVlMTUyMzgyODRlNzdiMzYzNWQ1ZWFkMjNiZWI2OTIzMGViNzE1NTc5YjYwNjE2MzgwYzljYmJhZmM5OGZkNjQyNjNkNzUwZjhlY2NjMDdlZTc3ZGNmNWVhOTA0YmEwNmVlZmE2M2I1YWM0OWJkZjVjZDg4MDU0NzlmMmUzMzU1MGY1M2YxNDM0OWM5OGQ2YWZmN2U0OTQ4NTM0OWFlZWEzMmUyMDViNGE5YjU5YzIyMDI2Yzg1ZDJkZjBjODQ4Mzc4YWQ0MDVhNTZlYWJjOGFkNmUxMTE4OWQ4NmQ4YzM5ZmY3N2ZjZmU0MjAyMGM3YjJmZDYyNWZlYjQ4NGY4Mjg5YTAzYjRkYjg5YjQ4MWEyMTViNDFjZGM3MWJiMzQwOTNkNTc4Zjk1NzM2MTFhMmE4NmI0MWYwOTEzMDVmZDVlZjM1OTk5NWJiM2U3NzA1MmZmZWVjZmJlNjRkZjcwNDcyZjEyMTk5ZDRkYjBhNzc4ZDQ3OTZlMDg4MTFmOWM1NTkwZWMzY2I2YWVmNjkwODU3YTg5ZTUzYmY2YTA2MjJiZGZiNGI0ODk3ZmFmMTFlYjE1OGFkOWYzYjZlZTU1OTRkY2E3ODdhOWRjYzU0ODdiYjc5Mjk5MWU5YmVmYmYxYmY5NmUxNGY2MzFkOGMwNjYzMjZiOTAiLCJpYXQiOjE2NjMzMTk4OTEsImV4cCI6MTY2MzMyMDc5MX0.y-u0pt8uY1Obuby155ZgzwrsPzD46D3nn2y9EA4e9B3P93xnOItVkvHzmvJ9kHO7oyBOVJojlvXwgxaDVA81b4O6HHVwACe9_vpAwZ1Fm98P1JFeccgJU9JFQ4uL-Tect5Gd3ptZH6fT6BWMeQwxubR-IXIbZqJjXg882LX99ZjP1K46t1nRyllUKrxPjSPxaZQBrIQXL9bwD_BjKm9go2e4aRsBfWTLR_LVyKvLc00GV6JcJ-DNtEb0grqQdIbn4_hkHZh8QjhVmVTnFk1L_leEdrrErBj-4czWrGD5F1-vW9md-BI1u5SxcJv8fXvxRDaWVGnGOyEBDhtKx1up2A';

class COOPDIOApi {
  COOPDIOApi();
  DioClient dioClient = DioClient();

  Future<StatusResponse> getInterestSavingInfo() async {
    return await dioClient.fetch(url: HttpUrl.interestSavingInfo);
  }

  Future<StatusResponse> getInterestSavingFixedInfo() async {
    return await dioClient.fetch(url: HttpUrl.interestSavingFixedInfo);
  }

  Future<StatusResponse> getInterestLoan() async {
    return await dioClient.fetch(url: HttpUrl.interestLoanInfo);
  }
}
