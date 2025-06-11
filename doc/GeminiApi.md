# orion_gem_nest_dart_client.api.GeminiApi

## Load the API package
```dart
import 'package:orion_gem_nest_dart_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**geminiControllerBasicPrompt**](GeminiApi.md#geminicontrollerbasicprompt) | **POST** /api/gemini/basic-prompt | Basic prompt
[**geminiControllerBasicPromptStream**](GeminiApi.md#geminicontrollerbasicpromptstream) | **POST** /api/gemini/basic-prompt-stream | Basic prompt stream


# **geminiControllerBasicPrompt**
> String geminiControllerBasicPrompt(basicPromptDto)

Basic prompt

### Example
```dart
import 'package:orion_gem_nest_dart_client/api.dart';

final api = OrionGemNestDartClient().getGeminiApi();
final BasicPromptDto basicPromptDto = ; // BasicPromptDto | 

try {
    final response = api.geminiControllerBasicPrompt(basicPromptDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GeminiApi->geminiControllerBasicPrompt: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **basicPromptDto** | [**BasicPromptDto**](BasicPromptDto.md)|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **geminiControllerBasicPromptStream**
> Uint8List geminiControllerBasicPromptStream(basicPromptDto)

Basic prompt stream

### Example
```dart
import 'package:orion_gem_nest_dart_client/api.dart';

final api = OrionGemNestDartClient().getGeminiApi();
final BasicPromptDto basicPromptDto = ; // BasicPromptDto | 

try {
    final response = api.geminiControllerBasicPromptStream(basicPromptDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GeminiApi->geminiControllerBasicPromptStream: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **basicPromptDto** | [**BasicPromptDto**](BasicPromptDto.md)|  | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: text/plain

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

