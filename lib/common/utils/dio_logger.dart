import 'dart:convert';
import 'package:getx_scaffold/getx_scaffold.dart';

class PrettyDioLogger extends Interceptor {
  ///请求部分
  final bool showRequest;

  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print [Options.queryParameters]
  final bool queryParameters;

  /// Print request data [Options.data]
  final bool requestBody;

  ///返回部分
  final bool showResponse;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print [Response.data]
  final bool responseBody;

  ///其他参数

  /// Print error message
  final bool showError;

  /// Print cURL
  final bool showCUrl;

  /// Print FormData
  final bool convertFormData;

  /// Log printer; defaults logPrint log to console.
  /// you can also write log in a file.
  final void Function(String msg) logPrint;

  final JsonEncoder _encoder = const JsonEncoder.withIndent('\t');

  PrettyDioLogger({
    this.showRequest = true,
    this.showResponse = true,
    this.requestHeader = false,
    this.queryParameters = false,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = false,
    this.showError = false,
    this.showCUrl = false,
    this.convertFormData = false,
    this.logPrint = log,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (showRequest && options.headers[HttpService.showLog] != false) {
      try {
        _logOnRequest(options);
      } catch (e) {
        logPrint('PrettyDioLogger: $e');
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (showError && err.requestOptions.headers[HttpService.showLog] != false) {
      try {
        _logOnError(err);
      } catch (e) {
        logPrint('PrettyDioLogger: $e');
      }
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (showResponse &&
        response.requestOptions.headers[HttpService.showLog] != false) {
      try {
        _logOnResponse(response);
      } catch (e) {
        logPrint('PrettyDioLogger: $e');
      }
    }
    super.onResponse(response, handler);
  }

  void _logOnRequest(RequestOptions options) {
    String log =
        '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> REQUEST <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';
    final uri = options.uri;
    final method = options.method;
    log = addLog(log, '$method  >>>  ${uri.toString()}');
    if (showCUrl) {
      String curl = _cURLRepresentation(options);
      log = addLog(log, curl);
    }
    if (requestHeader) {
      log = addLog(log, '[-----HEADER-----]');
      final requestHeaders = <String, dynamic>{};
      requestHeaders.addAll(options.headers);
      requestHeaders['contentType'] = options.contentType?.toString();
      requestHeaders['responseType'] = options.responseType.toString();
      String json = _encoder.convert(requestHeaders);
      log = addLog(log, json);
    }
    if (queryParameters && options.queryParameters.isNotEmpty) {
      log = addLog(log, '[-----PARAMS-----]');
      String json = _encoder.convert(options.queryParameters);
      log = addLog(log, json);
    }
    if (requestBody && options.data != null) {
      final dynamic data = options.data;
      if (data is Map) {
        log = addLog(log, '[-----BODY-----]');
        String json = _encoder.convert(options.data);
        log = addLog(log, json);
      } else if (data is FormData) {
        log = addLog(log, '[-----FORMDATA-----]');
        final formDataMap = <String, dynamic>{}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        formDataMap.forEach((key, value) => log = addLog(log, '$key: $value'));
      } else {
        log = addLog(log, '[-----BODY-----]');
        log = addLog(log, data.toString());
      }
    }
    logPrint(log);
  }

  void _logOnError(DioException err) {
    String log =
        '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ERROR <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';
    final uri = err.requestOptions.uri;
    final method = err.requestOptions.method;
    log = addLog(log, '$method  >>>  ${uri.toString()}');
    log = addLog(log, '[-----ERROR-----]');
    log = addLog(log, err.message ?? '');
    log = addLog(log, '====================REQUEST====================');
    final requestHeaders = <String, dynamic>{};
    final options = err.requestOptions;
    requestHeaders.addAll(options.headers);
    requestHeaders['contentType'] = options.contentType?.toString();
    requestHeaders['responseType'] = options.responseType.toString();
    String json = _encoder.convert(requestHeaders);
    log = addLog(log, '[-----HEADER-----]');
    log = addLog(log, json);
    if (options.queryParameters.isNotEmpty) {
      String json = _encoder.convert(options.queryParameters);
      log = addLog(log, '[-----PARAMS-----]');
      log = addLog(log, json);
    }
    if (options.data != null) {
      final dynamic data = options.data;
      if (data is Map) {
        log = addLog(log, '[-----BODY-----]');
        String json = _encoder.convert(options.data);
        log = addLog(log, json);
      } else if (data is FormData) {
        log = addLog(log, '[-----FORMDATA-----]');
        final formDataMap = <String, dynamic>{}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        formDataMap.forEach((key, value) => log = addLog(log, '$key: $value'));
      } else {
        log = addLog(log, '[-----BODY-----]');
        log = addLog(log, data.toString());
      }
    }
    log = addLog(log, '====================RESPONSE====================');
    if (err.response != null) {
      log = addLog(log, '[-----STATUS-----]');
      log = addLog(
          log, '${err.response?.statusCode} ${err.response?.statusMessage}');
      if (err.response?.data != null) {
        log = addLog(log, '[-----BODY-----]');
        log = addLog(log, err.response.toString());
      }
    }
    logPrint(log);
  }

  void _logOnResponse(Response response) {
    String log =
        '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> RESPONSE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';
    final uri = response.requestOptions.uri;
    final method = response.requestOptions.method;
    log = addLog(log, '$method  >>>  ${uri.toString()}');

    log = addLog(log, '====================REQUEST====================');
    final requestHeaders = <String, dynamic>{};
    final options = response.requestOptions;
    requestHeaders.addAll(options.headers);
    requestHeaders['contentType'] = options.contentType?.toString();
    requestHeaders['responseType'] = options.responseType.toString();
    String json = _encoder.convert(requestHeaders);
    log = addLog(log, '[-----HEADER-----]');
    log = addLog(log, json);
    if (options.queryParameters.isNotEmpty) {
      String json = _encoder.convert(options.queryParameters);
      log = addLog(log, '[-----PARAMS-----]');
      log = addLog(log, json);
    }
    if (options.data != null) {
      final dynamic data = options.data;
      if (data is Map) {
        log = addLog(log, '[-----BODY-----]');
        String json = _encoder.convert(options.data);
        log = addLog(log, json);
      } else if (data is FormData) {
        log = addLog(log, '[-----FORMDATA-----]');
        final formDataMap = <String, dynamic>{}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        formDataMap.forEach((key, value) => log = addLog(log, '$key: $value'));
      } else {
        log = addLog(log, '[-----BODY-----]');
        log = addLog(log, data.toString());
      }
    }
    log = addLog(log, '====================RESPONSE====================');
    log = addLog(log, '[-----STATUS-----]');
    log = addLog(log, '${response.statusCode} ${response.statusMessage}');
    if (responseHeader) {
      log = addLog(log, '[-----HEADER-----]');
      final responseHeaders = <String, String>{};
      response.headers
          .forEach((k, list) => responseHeaders[k] = list.toString());
      String json = _encoder.convert(responseHeaders);
      log = addLog(log, json);
    }
    if (responseBody) {
      log = addLog(log, '[-----BODY-----]');
      String json = _encoder.convert(response.data);
      log = addLog(log, json);
    }
    logPrint(log);
  }

  String _cURLRepresentation(RequestOptions options) {
    List<String> components = ['curl -i'];
    components.add('-X ${options.method}');

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      if (options.data is FormData) {
        if (convertFormData) {
          final fieldData = Map.fromEntries(options.data.fields);
          fieldData.forEach((key, value) {
            components.add('--form $key="$value"');
          });
          final fileData = Map.fromEntries(options.data.files);
          fileData.forEach((key, value) {
            // can show file name only
            components.add('--form =@"${(value as MultipartFile).filename}"');
          });
        }
      } else if (options.headers['content-type'] ==
          'application/x-www-form-urlencoded') {
        options.data.forEach((k, v) {
          components.add('-d "$k=$v"');
        });
      } else {
        final data = json.encode(options.data).replaceAll('"', '\\"');
        components.add('-d "$data"');
      }
    }

    components.add('"${options.uri.toString()}"');

    String cURL = components.join(' \\\n\t');
    return '[-----CURL-----]\n$cURL';
  }

  String addLog(log, String data) {
    return '$log\n$data';
  }
}
