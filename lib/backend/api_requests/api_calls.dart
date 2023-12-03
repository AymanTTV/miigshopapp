import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class WaafiPayCall {
  static Future<ApiCallResponse> call({
    String? mobileNo = '',
    String? amount = '',
    String? apiKey = 'API-1618808470AHX',
    String? merchantId = 'M0911988',
    String? storeId = '1004328',
  }) async {
    final ffApiRequestBody = '''
{
  "schemaVersion": "1.0",
  "requestId": "6461759248",
  "timestamp": "2023-07-06 Africa",
  "channelName": "WEB",
  "serviceName": "API_PREAUTHORIZE",
  "serviceParams": {
    "merchantUid": "$merchantId",
    "apiUserId": "$storeId",
    "apiKey": "$apiKey",
    "paymentMethod": "MWALLET_ACCOUNT",
    "payerInfo": {
      "accountNo": "$mobileNo"
    },
    "transactionInfo": {
      "referenceId": "11197",
      "invoiceId": "22228",
      "amount": "$amount",
      "currency": "USD",
      "description": "wan diray"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Waafi Pay',
      apiUrl: 'https://api.waafipay.net/asm',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic responseMsg(dynamic response) => getJsonField(
        response,
        r'''$.responseMsg''',
      );
  static dynamic errorcode(dynamic response) => getJsonField(
        response,
        r'''$.responseCode''',
      );
  static dynamic errordescriptio(dynamic response) => getJsonField(
        response,
        r'''$.params.description''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
