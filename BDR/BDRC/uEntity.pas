unit uEntity;

interface

uses
  Classes;

type
  TRequest = record
    SYSID: string;
    DOCUMENT: string;
    HTTP_METHOD: integer;        // GET: 2; POST: 3
    PARAMS: string;              // PARAMS̫���Ļ���BLOB����
    POST_STREAM: TStream;
    IS_STREAM: boolean;          // String: 0; Stream: 1
    AppName: string;
  end;

  TResponse = record
    SYSID: string;
    CONTENT_TYPE: string;       // ContentText: 0; ContentStream: 1
    CharSet: string;
    CustomHeaders: string;
    CONTENT_TEXT: string;        // ContentText̫���Ļ���BLOB����
    CONTENT_STREAM: TStream;
    ERROR_Message: string;
  end;

implementation

end.
