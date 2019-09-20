Extension { #name : #Win32WideString }

{ #category : #'*UnifiedUFFI-wchar_t' }
Win32WideString class >> fromExternalData: anExternalData [
	^anExternalData readWin32WideString
]
