# pharo-uFFI-readWin32WideString

In this package there are two extensions to "FFI family", for those on Windows, where the return value from external function is of type wchar_t*, in Pharo represented by Win32WideString:

Extensions: 
- ExternalData>>#readWin32WideString 

  usage:
  
  aWin32WideString := anExternalData readWin32WideString. "  or:"
  
  aString := anExternalData readWin32WideString asString.

- Win32WideString class>>#fromExternalData:

  usage:
  
  aWin32WideString := Win32WideString fromExternalData: anExternalData. "  or:"
  
  aString := (Win32WideString fromExternalData: anExternalData) asString.


