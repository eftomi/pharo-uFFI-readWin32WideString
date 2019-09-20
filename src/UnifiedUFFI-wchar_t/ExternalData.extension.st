Extension { #name : #ExternalData }

{ #category : #'*UnifiedUFFI-wchar_t' }
ExternalData >> readWin32WideString [
	"Assume that the receiver represents a C wchar_t* and convert it to a Smalltalk Win32WideString. Tomaz Turk 19.9.2019"
	| stream index aWin32WideString |
	
	self isNull ifTrue: [ ^ nil ].
	
	type isPointerType ifFalse: [self error: 'External object is not a pointer type.'].
	stream := WriteStream on: ByteArray new.
	index := 1.
	[((handle unsignedByteAt: index) = 0) 
		and: [((handle unsignedByteAt: index + 1) = 0)]] whileFalse: [
			stream nextPut: (handle unsignedByteAt: index).
			stream nextPut: (handle unsignedByteAt: index + 1).
			index := index + 2].
	stream nextPut: 0; nextPut: 0.
"	stream size odd ifTrue: [ stream nextPut: 0 ] ."
	aWin32WideString := Win32WideString new: stream size.
	aWin32WideString setHandle: stream contents.

	^ aWin32WideString 
]
