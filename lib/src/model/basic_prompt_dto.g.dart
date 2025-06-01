// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_prompt_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BasicPromptDto extends BasicPromptDto {
  @override
  final String prompt;

  factory _$BasicPromptDto([void Function(BasicPromptDtoBuilder)? updates]) =>
      (BasicPromptDtoBuilder()..update(updates))._build();

  _$BasicPromptDto._({required this.prompt}) : super._();
  @override
  BasicPromptDto rebuild(void Function(BasicPromptDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BasicPromptDtoBuilder toBuilder() => BasicPromptDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BasicPromptDto && prompt == other.prompt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BasicPromptDto')
          ..add('prompt', prompt))
        .toString();
  }
}

class BasicPromptDtoBuilder
    implements Builder<BasicPromptDto, BasicPromptDtoBuilder> {
  _$BasicPromptDto? _$v;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  BasicPromptDtoBuilder() {
    BasicPromptDto._defaults(this);
  }

  BasicPromptDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prompt = $v.prompt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BasicPromptDto other) {
    _$v = other as _$BasicPromptDto;
  }

  @override
  void update(void Function(BasicPromptDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BasicPromptDto build() => _build();

  _$BasicPromptDto _build() {
    final _$result = _$v ??
        _$BasicPromptDto._(
          prompt: BuiltValueNullFieldError.checkNotNull(
              prompt, r'BasicPromptDto', 'prompt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
