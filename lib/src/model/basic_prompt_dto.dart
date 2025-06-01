//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'basic_prompt_dto.g.dart';

/// BasicPromptDto
///
/// Properties:
/// * [prompt] - The prompt to be sent to the Gemini API
@BuiltValue()
abstract class BasicPromptDto implements Built<BasicPromptDto, BasicPromptDtoBuilder> {
  /// The prompt to be sent to the Gemini API
  @BuiltValueField(wireName: r'prompt')
  String get prompt;

  BasicPromptDto._();

  factory BasicPromptDto([void updates(BasicPromptDtoBuilder b)]) = _$BasicPromptDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BasicPromptDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BasicPromptDto> get serializer => _$BasicPromptDtoSerializer();
}

class _$BasicPromptDtoSerializer implements PrimitiveSerializer<BasicPromptDto> {
  @override
  final Iterable<Type> types = const [BasicPromptDto, _$BasicPromptDto];

  @override
  final String wireName = r'BasicPromptDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BasicPromptDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'prompt';
    yield serializers.serialize(
      object.prompt,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BasicPromptDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BasicPromptDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'prompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.prompt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BasicPromptDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BasicPromptDtoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

