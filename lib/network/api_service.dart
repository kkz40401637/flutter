import 'package:dio/dio.dart';
import 'package:hanseinthantiot/network/model/batch_data.dart';
import 'package:hanseinthantiot/network/model/device_data.dart';
import 'package:hanseinthantiot/network/model/device_data_current.dart';
import 'package:hanseinthantiot/network/model/device_data_list.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://api.kpiiot.com/devices")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      "apiKey": "ukZFwKGZIFdaiAJHpYr1gg0HCuSMPlAl"
    }));

    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET("/batch")
  Future<BatchData> getDevices();

  @GET("/{id}") //20855
  Future<DeviceData> getDeviceData(@Path('id') int id);

  @GET("/datastreams?device_ids={id}")
  Future<DeviceDataCurrent> getDeviceDataPoint(@Path('id') int id);

  @GET("{id}/datastreams?param_ids={pId}&start={sTime}&end=&limit=100&sort=ASC")
  Future<DeviceDataList> getDataPoint(
      @Path('id') int id, @Path('pId') int pId, @Path('sTime') int sTime);
}
