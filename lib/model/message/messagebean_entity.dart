import 'package:nurse/generated/json/base/json_field.dart';
import 'package:nurse/generated/json/messagebean_entity.g.dart';
import 'dart:convert';
export 'package:nurse/generated/json/messagebean_entity.g.dart';

@JsonSerializable()
class MessagebeanEntity {
	List<MessagebeanRecords>? records;
	int? total;
	int? size;
	int? current;
	List<dynamic>? orders;
	bool? optimizeCountSql;
	bool? searchCount;
	dynamic countId;
	dynamic maxLimit;
	int? pages;

	MessagebeanEntity();

	factory MessagebeanEntity.fromJson(Map<String, dynamic> json) => $MessagebeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $MessagebeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MessagebeanRecords {
	String? id;
	String? userId;
	String? msgTitle;
	String? msgType;
	dynamic msgUrl;
	String? status;
	String? orgCode;
	String? orgName;
	String? createTime;
	String? updateTime;
	String? msgDesn;
	String? ext;
	int? page;
	int? limit;

	MessagebeanRecords();

	factory MessagebeanRecords.fromJson(Map<String, dynamic> json) => $MessagebeanRecordsFromJson(json);

	Map<String, dynamic> toJson() => $MessagebeanRecordsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}