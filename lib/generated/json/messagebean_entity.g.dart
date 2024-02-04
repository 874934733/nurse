import 'package:nurse/generated/json/base/json_convert_content.dart';
import 'package:nurse/model/message/messagebean_entity.dart';

MessagebeanEntity $MessagebeanEntityFromJson(Map<String, dynamic> json) {
  final MessagebeanEntity messagebeanEntity = MessagebeanEntity();
  final List<MessagebeanRecords>? records = (json['records'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<MessagebeanRecords>(e) as MessagebeanRecords)
      .toList();
  if (records != null) {
    messagebeanEntity.records = records;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    messagebeanEntity.total = total;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    messagebeanEntity.size = size;
  }
  final int? current = jsonConvert.convert<int>(json['current']);
  if (current != null) {
    messagebeanEntity.current = current;
  }
  final List<dynamic>? orders = (json['orders'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (orders != null) {
    messagebeanEntity.orders = orders;
  }
  final bool? optimizeCountSql = jsonConvert.convert<bool>(
      json['optimizeCountSql']);
  if (optimizeCountSql != null) {
    messagebeanEntity.optimizeCountSql = optimizeCountSql;
  }
  final bool? searchCount = jsonConvert.convert<bool>(json['searchCount']);
  if (searchCount != null) {
    messagebeanEntity.searchCount = searchCount;
  }
  final dynamic countId = json['countId'];
  if (countId != null) {
    messagebeanEntity.countId = countId;
  }
  final dynamic maxLimit = json['maxLimit'];
  if (maxLimit != null) {
    messagebeanEntity.maxLimit = maxLimit;
  }
  final int? pages = jsonConvert.convert<int>(json['pages']);
  if (pages != null) {
    messagebeanEntity.pages = pages;
  }
  return messagebeanEntity;
}

Map<String, dynamic> $MessagebeanEntityToJson(MessagebeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['records'] = entity.records?.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['size'] = entity.size;
  data['current'] = entity.current;
  data['orders'] = entity.orders;
  data['optimizeCountSql'] = entity.optimizeCountSql;
  data['searchCount'] = entity.searchCount;
  data['countId'] = entity.countId;
  data['maxLimit'] = entity.maxLimit;
  data['pages'] = entity.pages;
  return data;
}

extension MessagebeanEntityExtension on MessagebeanEntity {
  MessagebeanEntity copyWith({
    List<MessagebeanRecords>? records,
    int? total,
    int? size,
    int? current,
    List<dynamic>? orders,
    bool? optimizeCountSql,
    bool? searchCount,
    dynamic countId,
    dynamic maxLimit,
    int? pages,
  }) {
    return MessagebeanEntity()
      ..records = records ?? this.records
      ..total = total ?? this.total
      ..size = size ?? this.size
      ..current = current ?? this.current
      ..orders = orders ?? this.orders
      ..optimizeCountSql = optimizeCountSql ?? this.optimizeCountSql
      ..searchCount = searchCount ?? this.searchCount
      ..countId = countId ?? this.countId
      ..maxLimit = maxLimit ?? this.maxLimit
      ..pages = pages ?? this.pages;
  }
}

MessagebeanRecords $MessagebeanRecordsFromJson(Map<String, dynamic> json) {
  final MessagebeanRecords messagebeanRecords = MessagebeanRecords();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    messagebeanRecords.id = id;
  }
  final String? userId = jsonConvert.convert<String>(json['userId']);
  if (userId != null) {
    messagebeanRecords.userId = userId;
  }
  final String? msgTitle = jsonConvert.convert<String>(json['msgTitle']);
  if (msgTitle != null) {
    messagebeanRecords.msgTitle = msgTitle;
  }
  final String? msgType = jsonConvert.convert<String>(json['msgType']);
  if (msgType != null) {
    messagebeanRecords.msgType = msgType;
  }
  final dynamic msgUrl = json['msgUrl'];
  if (msgUrl != null) {
    messagebeanRecords.msgUrl = msgUrl;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    messagebeanRecords.status = status;
  }
  final String? orgCode = jsonConvert.convert<String>(json['orgCode']);
  if (orgCode != null) {
    messagebeanRecords.orgCode = orgCode;
  }
  final String? orgName = jsonConvert.convert<String>(json['orgName']);
  if (orgName != null) {
    messagebeanRecords.orgName = orgName;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    messagebeanRecords.createTime = createTime;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    messagebeanRecords.updateTime = updateTime;
  }
  final String? msgDesn = jsonConvert.convert<String>(json['msgDesn']);
  if (msgDesn != null) {
    messagebeanRecords.msgDesn = msgDesn;
  }
  final String? ext = jsonConvert.convert<String>(json['ext']);
  if (ext != null) {
    messagebeanRecords.ext = ext;
  }
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    messagebeanRecords.page = page;
  }
  final int? limit = jsonConvert.convert<int>(json['limit']);
  if (limit != null) {
    messagebeanRecords.limit = limit;
  }
  return messagebeanRecords;
}

Map<String, dynamic> $MessagebeanRecordsToJson(MessagebeanRecords entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['msgTitle'] = entity.msgTitle;
  data['msgType'] = entity.msgType;
  data['msgUrl'] = entity.msgUrl;
  data['status'] = entity.status;
  data['orgCode'] = entity.orgCode;
  data['orgName'] = entity.orgName;
  data['createTime'] = entity.createTime;
  data['updateTime'] = entity.updateTime;
  data['msgDesn'] = entity.msgDesn;
  data['ext'] = entity.ext;
  data['page'] = entity.page;
  data['limit'] = entity.limit;
  return data;
}

extension MessagebeanRecordsExtension on MessagebeanRecords {
  MessagebeanRecords copyWith({
    String? id,
    String? userId,
    String? msgTitle,
    String? msgType,
    dynamic msgUrl,
    String? status,
    String? orgCode,
    String? orgName,
    String? createTime,
    String? updateTime,
    String? msgDesn,
    String? ext,
    int? page,
    int? limit,
  }) {
    return MessagebeanRecords()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..msgTitle = msgTitle ?? this.msgTitle
      ..msgType = msgType ?? this.msgType
      ..msgUrl = msgUrl ?? this.msgUrl
      ..status = status ?? this.status
      ..orgCode = orgCode ?? this.orgCode
      ..orgName = orgName ?? this.orgName
      ..createTime = createTime ?? this.createTime
      ..updateTime = updateTime ?? this.updateTime
      ..msgDesn = msgDesn ?? this.msgDesn
      ..ext = ext ?? this.ext
      ..page = page ?? this.page
      ..limit = limit ?? this.limit;
  }
}