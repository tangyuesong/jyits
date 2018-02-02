unit qstring;
{$I 'qdac.inc'}

interface

{
  ��Դ������QDAC��Ŀ����Ȩ��swish(QQ:109867294)���С�
  (1)��ʹ����ɼ�����
  ���������ɸ��ơ��ַ����޸ı�Դ�룬�������޸�Ӧ�÷��������ߣ������������ڱ�Ҫʱ��
  �ϲ�������Ŀ���Թ�ʹ�ã��ϲ����Դ��ͬ����ѭQDAC��Ȩ�������ơ�
  ���Ĳ�Ʒ�Ĺ����У�Ӧ�������µİ汾����:
  ����Ʒʹ�õ�JSON����������QDAC��Ŀ�е�QJSON����Ȩ���������С�
  (2)������֧��
  �м������⣬�����Լ���QDAC�ٷ�QQȺ250530692��ͬ̽�֡�
  (3)������
  ����������ʹ�ñ�Դ�������Ҫ֧���κη��á���������ñ�Դ������а�������������
  ������Ŀ����ǿ�ƣ�����ʹ���߲�Ϊ�������ȣ��и���ľ���Ϊ�����ָ��õ���Ʒ��
  ������ʽ��
  ֧������ guansonghuan@sina.com �����������
  �������У�
  �����������
  �˺ţ�4367 4209 4324 0179 731
  �����У��������г����ŷ索����
}

{ �޶���־
  2016.2.26
  ==========
  + ���� IsEmailAddr �������������ʽ
  + ����IsChineseMobile ������ֻ������ʽ

  2016.2.25
  ==========
  + ���� IsChineseIdNo �������ж����֤�ŵ���Ч�ԣ�������֤����������֤��
  + ���� DecodeChineseId ���������֤�ŵĸ�����ɲ�������

  2015.11.22
  ==========
  * ������PosW ���� AStartPos ����ʱû�п��Ǻ�һ�����ض�ʧAStartPos���������⣨��ľ���棩

  2015.11.18
  ==========
  * ������MemScan���Ǽ�Сlen_s���������⣨TTT���棩
  2015.11.10
  ==========
  + �������ҽ����д���� CapMoney
  + ������ת������ SimpleChineseToTraditional �� TraditionalChineseToSimple

  2015.9.26
  =========
  * ������ParseDateTime�ڽ��� "n-nxxx" ����������ʱ���󷵻�true�����⣨�������棩
  2015.9.2
  =========
  * ������ AnsiEncode �� 2007 �����ڱ�������Bug����������⣨�ǿձ��棩

  2015.8.28
  =========
  * �ϲ� InternalInsert �Ĵ��뵽 Insert
  * ������ Clear ��û������ʱ�����²���Ԫ��ʱҳ���쳣���������⣨�����������棩
  * ������ Pack ������ Clear ������ʱ��������⣨���屨�棩
  + ��������������ģʽ�� Insert ��������
  + �����������ģʽ�� Add ��������
  2015.8.27
  =========
  * ������ TQPagedList.Pack ���������������ȷ�����⣨�����������棩

  2015.8.26
  =========
  * ������ TQPagedList.Insert ����λ��С��0ʱ���������(�����������棩
  * �Ż��� TQPagedList.Add �Ĵ��룬�ĳ�ֱ�ӵ���InternalInsert(�����������飩

  2015.8.11
  =========
  * ������ HTMLUnescape ��ת�������ַ�ʱ��������⣨�����б��棩
  2015.7.15
  =========
  * ���� qsl �Ĺ�ϣ���Խ������ HashOf �����㷨��Ϊ BKDR ����Windowsƽ̨��ʹ�û��
  ������Ч�ʣ���лqsl��
  2015.6.6
  =========
  * ������ Utf8Decode ʱ��0x10000+��Χ���ַ�����ʱ��λ���󣨸�лqsl��
  2015.5.29
  =========
  * ������ TQPagedStream �ڵͰ汾��IDE���޷����������

  2015.5.25
  =========
  + TQPagedStream ���룬����д����ڴ�������ʱ���TMemoryStream

  2015.5.22
  =========
  * ������ ParseNumeric �� ParseInt ʱ���������ʾ��Χ����ֵ����ʽ
  2015.5.21
  =========
  * ������ StringReplaceWithW �� AWithTag Ϊ True ʱ�������ȷ�����⣨�����ٷʱ��棩
  * ������ StringReplaceWithW ���滻�Ľ���ַ���Ϊ��ʱ��������Ч��ַ�����⣨�����ٷʱ��棩
  2015.5.20
  =========
  + StringReplaceW ������һ�����أ������滻�ַ����е�ĳһ����Ϊ�ض��ַ���һ�����ڲ����������ݵ�����
  * �Ƴ�һ��Hint
  2015.5.8
  =========
  * �޸� TQPtr ��ʵ�֣��������ͷ��¼�����ͨ���¼�ʹ��ͬһ������
  + DecodeText �������ڴ���ֱ�Ӽ����벢����Unicode������ַ���

  2015.4.17
  =========
  * �Ż���UTFEncode��ռ���ڴ���������
  2015.4.8
  =========
  * ������ParseNumeric �ڽ��� -0.xx ���������ַ��ų�������⣨��лYZ���棩
  2015.4.1
  =========
  * ������TQStringCatHelper������Ҫ�Ļ���������ʱ�жϴ�������⣨��лetarelecca���棩
  2015.3.9
  =========
  * �޸� NaturalCompareW �����������Ƿ���Ե��հ��ַ�ѡ��ں���ʱA 10 �� A10 ������Ϊһ�µĽ��
  2015.3.5
  =========
  + ���� PosW���ȼ���ϵͳ��Pos�� �Ͱ���Ȼ���������� NaturalCompareW
  2015.2.9
  =========
  + ���� FilterCharW �� FilterNoNumberW ��������

  2015.1.27
  =========
  * ������TQPtr.Bind �����������ڴ���û�б��������

  2015.1.26
  ==========
  + TQPtr �������� Bind ����������
  + ����ȫ�ֱ��� IsFMXApp ����⵱ǰ�Ƿ��� FMX ��Ӧ�ó���

  2014.11.10
  =========
  * ������XE3����ʱTSystemTimes������Ч������

  2014.11.5
  =========
  * QStringA��From�����޸ķ���ֵ���Ͳ�����һ������
  + QStringA����Cat����
  + CharCodeA/CharCodeU/CharCodeW�����ָ��λ�õ��ַ�����ֵ

  2014.9.26
  =========
  * ��TThreadId���Ͷ�����QWorker���뱾��Ԫ
  2014.9.11
  =========
  * ������LoadTextA/LoadTextW���ش���BOMͷ�Ŀյ�Utf8��ʱ���������
  2014.8.20
  =========
  + StringReplaceWithW�����������滻һ���ǩ�е����ݣ�����ң�
  2014.8.15
  =========
  * ������֤��TQBytesCatHelper�����2007�����޷�ͨ��������(��������������沢��֤)
  + PQStringA���Ͷ���

  2014.8.14
  =========
  * ������TQBytesCatHelper.NeedSize������Delphi2007���޷����������(����С�ױ��沢�ṩ�޸�)
  2014.8.5
  ========
  * BinToHex����ALowerCase��������֧��ʹ��Сд��ʮ�����Ʊ�ʾ��ʽ
  2014.8.1
  =========
  + ��������SameCharsA/U/W������ͬ���ַ�����EndWithA/U/W�ж��Ƿ���ָ�����ַ�����β
  2014.7.17
  =========
  + ����BinaryCmp���������ڵȼ���C�е�memcmp����
  2014.7.16
  =========
  + ����MemScan����������ָ�����ڴ������в���ָ�����ֽ�����
  2014.7.12
  =========
  * ������DecodeLineU�еݹ�����Լ��Ĵ���(����С�ױ���)
  * ������CharCountU����ַ����ʱ��˫�ֽ�Utf8����ļ�����
  2014.7.10
  =========
  + �������º�����StringReplicateW,NameOfW,ValueOfW,IndexOfNameW,IndexOfValueW

  2014.6.26
  =========
  * ����HPPEMITĬ�����ӱ���Ԫ(�����ٷ� ����)
  2014.6.21
  ==========
  * ������C++ Builder�б��������
  2014.6.19
  ==========
  * ������QuotedStr���ڳ���Ϊ0���ַ���������������
}
uses classes, sysutils, types{$IF RTLVersion>=21},
  Rtti{$IFEND >=XE10}{$IFNDEF MSWINDOWS},
  syncobjs{$ENDIF}
{$IFDEF POSIX}
    , Posix.String_
{$ENDIF}
    ;
{$HPPEMIT '#pragma link "qstring"'}

const
  MC_NUM = $01; // ��ʾ����
  MC_UNIT = $02; // ��ʾ��λ
  MC_HIDE_ZERO = $04; // ���������ֵ
  MC_MERGE_ZERO = $08; // �ϲ��м����ֵ
  MC_END_PATCH = $10; // ���ڲ��Էֽ���ʱ����AEndTextָ����ֵ
  MC_READ = MC_NUM or MC_UNIT or MC_HIDE_ZERO or MC_MERGE_ZERO or MC_END_PATCH;
  // ������ȡ��ʽ
  MC_PRINT = MC_NUM or MC_HIDE_ZERO; // �����״���ʽ

type
{$IFDEF UNICODE}
  QStringW = UnicodeString;
{$ELSE}
  QStringW = WideString;
{$ENDIF UNICODE}
{$IF RTLVersion>=21}
  TValueArray = array of TValue;
{$IFEND >=2010}
{$IF RTLVersion<25}
  IntPtr = Integer;
  IntUPtr = Cardinal;
{$IFEND IntPtr}
  // {$IF RTLVersion<=18}
  // DWORD_PTR = DWORD;
  // ULONGLONG = Int64;
  // TBytes = array of Byte;
  // PPointer = ^Pointer;
  // {$IFEND}
{$IF RTLVersion<22}
  TThreadId = Longword;
{$IFEND}
  PIntPtr = ^IntPtr;
  QCharA = Byte;
  QCharW = WideChar;
  PQCharA = ^QCharA;
  PPQCharA = ^PQCharA;
  PQStringA = ^QStringA;
  PQCharW = PWideChar;
  PPQCharW = ^PQCharW;
  PQStringW = ^QStringW;
  TTextEncoding = (teUnknown, { δ֪�ı��� }
    teAuto, { �Զ���� }
    teAnsi, { Ansi���� }
    teUnicode16LE, { Unicode LE ���� }
    teUnicode16BE, { Unicode BE ���� }
    teUTF8 { UTF8���� }
    );
{$HPPEMIT '#define DELPHI_ANON(AType,Code,AVar) \'}
{$HPPEMIT '  class AType##AVar:public TCppInterfacedObject<AType>\'}
(*$HPPEMIT '  {\'*)
{$HPPEMIT '  public:\'}
{$HPPEMIT '    void __fastcall Invoke##Code\'}
(*$HPPEMIT '  } *AVar=new AType##AVar'*)

  // ��A��β��ΪAnsi����֧�ֵĺ�������U��β����Utf8����֧�ֵĺ�������W��β��ΪUCS2
  QStringA = record
  private
    FValue: TBytes;
    function GetChars(AIndex: Integer): QCharA;
    procedure SetChars(AIndex: Integer; const Value: QCharA);
    function GetLength: Integer;
    procedure SetLength(const Value: Integer);
    function GetIsUtf8: Boolean;
    function GetData: PByte;
  public
    class operator Implicit(const S: QStringW): QStringA;
    class operator Implicit(const S: QStringA): Pointer;
    class operator Implicit(const S: QStringA): TBytes;
    class operator Implicit(const ABytes: TBytes): QStringA;
    class operator Implicit(const S: QStringA): QStringW;
    class operator Implicit(const S: PQCharA): QStringA;
{$IFNDEF NEXTGEN}
    class operator Implicit(const S: AnsiString): QStringA;
    class operator Implicit(const S: QStringA): AnsiString;
{$ENDIF}
    // �ַ����Ƚ�
    function From(p: PQCharA; AOffset, ALen: Integer): PQStringA; overload;
    function From(const S: QStringA; AOffset: Integer = 0): PQStringA; overload;
    function Cat(p: PQCharA; ALen: Integer): PQStringA; overload;
    function Cat(const S: QStringA): PQStringA; overload;
    property Chars[AIndex: Integer]: QCharA read GetChars
      write SetChars; default;
    property Length: Integer read GetLength write SetLength;
    property IsUtf8: Boolean read GetIsUtf8;
    property Data: PByte read GetData;
  end;

  QException = class(Exception)

  end;

  // �ַ���ƴ����
  TQStringCatHelperW = class
  private
    FValue: array of QCharW;
    FStart, FDest: PQCharW;
    FBlockSize: Integer;
{$IFDEF DEBUG}
    FAllocTimes: Integer;
{$ENDIF}
    FSize: Integer;
    function GetValue: QStringW;
    function GetPosition: Integer; inline;
    procedure SetPosition(const Value: Integer);
    procedure NeedSize(ASize: Integer);
    function GetChars(AIndex: Integer): QCharW;
  public
    constructor Create; overload;
    constructor Create(ASize: Integer); overload;
    procedure LoadFromFile(const AFileName: QStringW);
    procedure LoadFromStream(const AStream: TStream);
    function Cat(p: PQCharW; len: Integer): TQStringCatHelperW; overload;
    function Cat(const S: QStringW): TQStringCatHelperW; overload;
    function Cat(c: QCharW): TQStringCatHelperW; overload;
    function Cat(const V: Int64): TQStringCatHelperW; overload;
    function Cat(const V: Double): TQStringCatHelperW; overload;
    function Cat(const V: Boolean): TQStringCatHelperW; overload;
    function Cat(const V: Currency): TQStringCatHelperW; overload;
    function Cat(const V: TGuid): TQStringCatHelperW; overload;
    function Cat(const V: Variant): TQStringCatHelperW; overload;
    function Replicate(const S: QStringW; count: Integer): TQStringCatHelperW;
    function Back(ALen: Integer): TQStringCatHelperW;
    function BackIf(const S: PQCharW): TQStringCatHelperW;
    procedure TrimRight;
    procedure Reset;
    property Value: QStringW read GetValue;
    property Chars[AIndex: Integer]: QCharW read GetChars;
    property Start: PQCharW read FStart;
    property Current: PQCharW read FDest;
    property Position: Integer read GetPosition write SetPosition;
  end;

  TQBytesCatHelper = class
  private
    FValue: TBytes;
    FStart, FDest: PByte;
    FBlockSize: Integer;
    FSize: Integer;
    function GetBytes(AIndex: Integer): Byte;
    function GetPosition: Integer;
    procedure SetPosition(const Value: Integer);
    procedure NeedSize(ASize: Integer);
    procedure SetCapacity(const Value: Integer);
    function GetValue: TBytes;
  public
    constructor Create; overload;
    constructor Create(ASize: Integer); overload;
    function Cat(const V: Byte): TQBytesCatHelper; overload;
    function Cat(const V: Shortint): TQBytesCatHelper; overload;
    function Cat(const V: Word): TQBytesCatHelper; overload;
    function Cat(const V: Smallint): TQBytesCatHelper; overload;
    function Cat(const V: Cardinal): TQBytesCatHelper; overload;
    function Cat(const V: Integer): TQBytesCatHelper; overload;
    function Cat(const V: Int64): TQBytesCatHelper; overload;
{$IFNDEF NEXTGEN}
    function Cat(const V: AnsiChar): TQBytesCatHelper; overload;
    function Cat(const V: AnsiString): TQBytesCatHelper; overload;
{$ENDIF}
    function Cat(const V: QStringA; ACStyle: Boolean = False)
      : TQBytesCatHelper; overload;
    function Cat(const c: QCharW): TQBytesCatHelper; overload;
    function Cat(const S: QStringW): TQBytesCatHelper; overload;
    function Cat(const ABytes: TBytes): TQBytesCatHelper; overload;
    function Cat(const AData: Pointer; const ALen: Integer)
      : TQBytesCatHelper; overload;
    function Cat(const V: Single): TQBytesCatHelper; overload;
    function Cat(const V: Double): TQBytesCatHelper; overload;
    function Cat(const V: Boolean): TQBytesCatHelper; overload;
    function Cat(const V: Currency): TQBytesCatHelper; overload;
    function Cat(const V: TGuid): TQBytesCatHelper; overload;
    function Cat(const V: Variant): TQBytesCatHelper; overload;
    function Replicate(const ABytes: TBytes; ACount: Integer): TQBytesCatHelper;
    function Back(ALen: Integer): TQBytesCatHelper;
    procedure Reset;
    property Value: TBytes read GetValue;
    property Bytes[AIndex: Integer]: Byte read GetBytes;
    property Start: PByte read FStart;
    property Current: PByte read FDest;
    property Position: Integer read GetPosition write SetPosition;
    property Capacity: Integer read FSize write SetCapacity;
  end;

  IQPtr = interface(IInterface)
    function Get: Pointer;
  end;

  TQPtrFreeEvent = procedure(AData: Pointer) of object;
  PQPtrFreeEvent = ^TQPtrFreeEvent;
  TQPtrFreeEventG = procedure(AData: Pointer);
{$IFDEF UNICODE}
  TQPtrFreeEventA = reference to procedure(AData: Pointer);
{$ENDIF}

  TQPtrFreeEvents = record
    case Integer of
      0:
        (Method: TMethod);
      1:
        (OnFree: {$IFNDEF NEXTGEN}TQPtrFreeEvent{$ELSE}Pointer{$ENDIF});
      2:
        (OnFreeG: TQPtrFreeEventG);
      3:
        (OnFreeA: Pointer);
  end;

  TQPtr = class(TInterfacedObject, IQPtr)
  private
    FObject: Pointer;
    FOnFree: TQPtrFreeEvents;
  public
    constructor Create(AObject: Pointer); overload;
    destructor Destroy; override;
    class function Bind(AObject: TObject): IQPtr; overload;
    class function Bind(AData: Pointer; AOnFree: TQPtrFreeEvent)
      : IQPtr; overload;
    class function Bind(AData: Pointer; AOnFree: TQPtrFreeEventG)
      : IQPtr; overload;
{$IFDEF UNICODE}
    class function Bind(AData: Pointer; AOnFree: TQPtrFreeEventA)
      : IQPtr; overload;
{$ENDIF}
    function Get: Pointer;
  end;
{$IF RTLVersion<=23}

  TDirection = (FromBeginning, FromEnd);
  TPointerList = array of Pointer;
{$ELSE}
  // TDirection = System.Types.TDirection;
{$IFEND}

  // TQPagedList - ��ҳʽ�б��������ڼ�¼�б�
  TQListPage = class
  protected
    FStartIndex: Integer; // ��ʼ����
    FUsedCount: Integer; // ʹ�õ�ҳ�����
    FItems: array of Pointer;
  public
    constructor Create(APageSize: Integer);
    destructor Destroy; override;
  end;

  TQPagedListSortCompare = procedure(p1, p2: Pointer; var AResult: Integer)
    of object;
  TQPagedListSortCompareG = procedure(p1, p2: Pointer; var AResult: Integer);
{$IFDEF UNICODE}
  TQPagedListSortCompareA = reference to procedure(p1, p2: Pointer;
    var AResult: Integer);
{$ENDIF}
  TQPagedList = class;

  TQPagedListEnumerator = class
  private
    FIndex: Integer;
    FList: TQPagedList;
  public
    constructor Create(AList: TQPagedList);
    function GetCurrent: Pointer; inline;
    function MoveNext: Boolean;
    property Current: Pointer read GetCurrent;
  end;

  TQPagedList = class
  protected
    FPages: array of TQListPage; // ҳ���б�
    FPageSize: Integer; // ÿҳ��С
    FCount: Integer; // ����
    FLastUsedPage: Integer; // ���һ������ʹ�õ�ҳ������(����0)
    FFirstDirtyPage: Integer; // �׸��������ҳ��
    FOnCompare: TQPagedListSortCompare; // ���ݱȽϺ���
    /// <summary> �Ƚ�����ָ���Ӧ�����ݴ�С </summary>
    /// <param name="p1">��һ��ָ��</param>
    /// <param name="p2">�ڶ���ָ��</param>
    /// <returns>�������ݵıȽϽ��,&lt;0����p1������С��p2,�����Ϊ0����֮��&gt;0</returns>
    /// <remarks>��������Ͳ���ʱʹ��</remarks>
    function DoCompare(p1, p2: Pointer): Integer; inline;
    /// <summary>��ȡָ��������ֵ</summary>
    /// <param name="AIndex">Ҫ��ȡ��Ԫ������</param>
    /// <returns>����ָ����ָ�룬�������Խ�磬���׳��쳣</returns>
    /// <remarks>����Items�Ķ�����</remarks>
    function GetItems(AIndex: Integer): Pointer; inline;
    /// <summary>����ָ��������ֵ</summary>
    /// <param name="AIndex">Ŀ������λ�ã����Խ�磬���׳��쳣</param>
    /// <remarks>����Items��д����</remarks>
    procedure SetItems(AIndex: Integer; const Value: Pointer); inline;
    /// <summary>ɾ��֪ͨ��������</summary>
    /// <param name="p">Ҫɾ����ָ��</param>
    /// <remarks>����TQPagedList����Żᴥ��Notify����</remarks>
    procedure DoDelete(const p: Pointer); inline;
    /// <summary>����ָ���������ڵ�ҳ����</summary>
    /// <param name="p">Ŀ������λ��</param>
    /// <returns>�����ҵ���ҳ��</returns>
    function FindPage(AIndex: Integer): Integer;
    /// <summary>����ָ���������ڵ�ҳ</summary>
    /// <param name="p">Ŀ������λ��</param>
    /// <returns>�����ҵ���ҳ����</returns>
    function GetPage(AIndex: Integer): TQListPage;
    /// <summary>��Ǵ�ָ����ҳ��ʼ��ҳͷ��FStartIndex��ϢʧЧ</summary>
    /// <param name="APage">ʧЧ��ҳ������</param>
    /// <remarks>ʹ��ʧЧ��ҳ����ҳ������ʱ����Ҫ�ȸ�����ҳ������Ϣ</remarks>
    procedure Dirty(APage: Integer); inline;
    /// <summary>ָ֪ͨ����ָ�뷢���仯</summary>
    /// <param name="Ptr">�����仯��ָ������</param>
    /// <param name="Action">�����ı仯����</param>
    procedure Notify(Ptr: Pointer; Action: TListNotification); virtual;
    /// <summary>��ȡ��ǰ�б������</summary>
    /// <returns>���� PageSize*PageCount �Ľ��</returns>
    /// <remarks>����Capacity�Ķ�����</remarks>
    function GetCapacity: Integer;
    /// <summary>�����κ��£���Ϊ����TList����ʽ���ṩ</summary>
    /// <remarks>����Capacity��д����</remarks>
    procedure SetCapacity(const Value: Integer);
    /// <summary>����ǰ�������ݷŵ�һά��ָ��������</summary>
    /// <returns>�������ɵ�һά��̬����</returns>
    /// <remarks>����List�Ķ�����</remarks>
    function GetList: TPointerList;
    /// <summary>�������ݴ�С�ȽϺ���</summary>
    /// <param name="Value">�µıȽϺ���</summary>
    /// <remarks>����OnCompare��д�������޸������ܴ�����������</remarks>
    procedure SetOnCompare(const Value: TQPagedListSortCompare);
    /// <summary>��ɾ�����Ƴ�Ԫ��ʱ��������ʹ�õķ�ҳ����</summary>
    procedure CheckLastPage;
    /// <summary>��ȡ��ǰ�Ѿ��������ҳ��</summary>
    function GetPageCount: Integer;
  public
    /// <summary>
    /// Ĭ�Ϲ��캯��������δָ��ҳ���С��ʹ��Ĭ�ϴ�С512
    /// </summary>
    constructor Create; overload;
    /// <summary>���캯��</summary>
    /// <param name="APageSize">ÿҳ���������С�ڵ���0��ʹ��Ĭ��ֵ</param>
    constructor Create(APageSize: Integer); overload;
    /// <summary>��������</summary>
    destructor Destroy; override;
{$IF RTLVersion<26}
    /// <summary>�����������ο�TList.Assign</summary>
    procedure Assign(ListA: TList; AOperator: TListAssignOp = laCopy;
      ListB: TList = nil); overload;
{$IFEND}
    /// <summary>�����������ο�TList.Assign</summary>
    procedure Assign(ListA: TQPagedList; AOperator: TListAssignOp = laCopy;
      ListB: TQPagedList = nil); overload;
    /// <summary>���һ��Ԫ��</summary>
    /// <param name="p">Ҫ��ӵ�Ԫ��</param>
    /// <returns>������Ԫ�ص�����ֵ</returns>
    function Add(const p: Pointer): Integer; overload;
    /// <summary>һ������Ӷ��Ԫ��</summary>
    /// <param name="pp">Ҫ��ӵ�Ԫ���б�ָ��</param>
    /// <param name="ACount">Ҫ��ӵ�Ԫ�ظ���</param>
    /// <returns>������Ԫ�ص�����ֵ</returns>
    procedure BatchAdd(pp: PPointer; ACount: Integer); overload;
    /// <summary>һ������Ӷ��Ԫ��</summary>
    /// <param name="AList">Ҫ��ӵ�Ԫ�ض�̬����</param>
    /// <returns>������Ԫ�ص�����ֵ</returns>
    procedure BatchAdd(AList: TPointerList); overload;
    /// <summary>��ָ����λ�ò���һ����Ԫ��</summary>
    /// <param name="AIndex">Ҫ�����λ�ã����С�ڵ���0��������ʼλ�ã�������ڵ���Count�������ĩβ</param>
    /// <param name="p">Ҫ�����Ԫ��</param>
    /// <remarks>���ָ�������������AIndex����������</remarks>
    procedure Insert(AIndex: Integer; const p: Pointer); overload;
    /// <summary>��ָ����λ��������������Ԫ��</summary>
    /// <param name="AIndex">Ҫ�����λ�ã����С�ڵ���0��������ʼλ�ã�������ڵ���Count�������ĩβ</param>
    /// <param name="pp">Ҫ�����Ԫ��</param>
    /// <param name="ACount">pp����ָ���Ԫ�ظ���</param>
    /// <remarks>���ָ�������������AIndex����������</remarks>
    procedure BatchInsert(AIndex: Integer; pp: PPointer;
      ACount: Integer); overload;
    /// <summary>��ָ����λ�ò���һ����Ԫ��</summary>
    /// <param name="AIndex">Ҫ�����λ�ã����С�ڵ���0��������ʼλ�ã�������ڵ���Count�������ĩβ</param>
    /// <param name="p">Ҫ�����Ԫ��</param>
    /// <remarks>���ָ�������������AIndex����������</remarks>
    procedure BatchInsert(AIndex: Integer; const AList: TPointerList); overload;
    /// <summary>��������Ԫ�ص�λ��</summary>
    /// <param name="AIndex1">��һ��Ԫ�ص�λ������</param>
    /// <param name="AIndex2">�ڶ���Ԫ�ص�λ������</param>
    procedure Exchange(AIndex1, AIndex2: Integer);
    /// <summary>��ָ��λ�õ�Ԫ���ƶ�����λ��</summary>
    /// <param name="AFrom">��ʼλ������</param>
    /// <param name="ATo">Ŀ��λ������</param>
    procedure MoveTo(AFrom, ATo: Integer);
    /// <summary>ʵ��ֱ�ӵ���MoveTo</summary>
    procedure Move(AFrom, ATo: Integer); inline;
    /// <summary>ɾ��ָ����Ԫ��</summary>
    procedure Delete(AIndex: Integer);
    /// <summary>�Ƴ�ָ����Ԫ��</summary>
    procedure Remove(AIndex: Integer); overload;
    /// <summary>�Ƴ�ָ����Ԫ��</summary>
    function Remove(Item: Pointer): Integer; overload; inline;
    /// <summary>��ָ���ķ���ʼ���Ҳ��Ƴ�Ԫ��</summary>
    function RemoveItem(Item: Pointer; Direction: TDirection): Integer;
    /// <summary>����ָ��Ԫ�ص�����</summary>
    /// <param name="p">Ҫ���ҵ�Ԫ��</param>
    /// <param name="AIdx">�ҵ���Ԫ������</param>
    /// <returns>����ҵ�������True,���򷵻�False��AIdxΪĿ��Ӧ���ֵ�λ��</returns>
    function Find(const p: Pointer; var AIdx: Integer): Boolean;
    /// <summary>�������Ԫ��</summary>
    /// <remarks>Clear��������ҳ�Ա�������ã�Ҫ����ҳ�������Pack����</remarks>
    procedure Clear;
    /// <summary>�����б�Ϊ���ٵ�ҳ��</summary>
    procedure Pack;
    /// <summary>����OnCompare�涨�Ĺ�������</summary>
    /// <remarks>һ��ָ��OnCompare���������Ԫ��ʱ���Զ�����Insertʱָ��������λ�ý��ᱻ����</remarks>
    procedure Sort; overload;
{$IFDEF UNICODE}
    /// <summary>����AOnCompare�����涨�Ĺ�������</summary>
    /// <remarks>һ��ָ��OnCompare���������Ԫ��ʱ���Զ�����Insertʱָ��������λ�ý��ᱻ����</remarks>
    procedure Sort(AOnCompare: TQPagedListSortCompareA); overload;
{$ENDIF}
    /// <summary>����AOnCompare�����涨�Ĺ�������</summary>
    /// <remarks>һ��ָ��OnCompare���������Ԫ��ʱ���Զ�����Insertʱָ��������λ�ý��ᱻ����</remarks>
    procedure Sort(AOnCompare: TQPagedListSortCompareG); overload;
    /// <summary> for .. in ֧��</summary>
    function GetEnumerator: TQPagedListEnumerator;
    /// <summary>��Ϊ���� TList ��ӣ��� TQPagedList ������</summary>
    function Expand: TQPagedList;
    /// <summary>�Ƴ�ָ������Ŀ</summary>
    /// <param name="Item">Ҫ�Ƴ���ֵ</param>
    function Extract(Item: Pointer): Pointer; inline;
    /// <summary>�Ƴ�ָ������Ŀ</summary>
    /// <param name="Item">Ҫ�Ƴ���ֵ</param>
    /// <param name="Direction">���ҷ���</param>
    function ExtractItem(Item: Pointer; Direction: TDirection): Pointer;
    /// <summary>�׸�Ԫ��</summary>
    function First: Pointer; inline;
    /// <summary>���һ��Ԫ��</summary>
    function Last: Pointer; inline;
    /// <summary>��ȡָ��Ԫ�ص��״γ���λ��</summary>
    /// <param name="Item">Ҫ���ҵ�Ԫ��</param>
    function IndexOf(Item: Pointer): Integer;
    /// <summary>��ָ���ķ������Ԫ���״γ��ֵ�λ��</summary>
    /// <param name="Item">Ҫ���ҵ�Ԫ��</param>
    /// <param name="Direction">���ҷ���</param>
    function IndexOfItem(Item: Pointer; Direction: TDirection): Integer;
    /// <summary>Ԫ�ظ���</summary>
    property count: Integer read FCount;
    /// <summary>Ԫ���б�</summary>
    property Items[AIndex: Integer]: Pointer read GetItems
      write SetItems; default;
    /// <summary>Ԫ�رȽϹ������ָ������Ԫ���Զ�����</summary>
    property OnCompare: TQPagedListSortCompare read FOnCompare
      write SetOnCompare;
    /// <summary>����TList���ã��� TQPagedList ������</summary>
    property Capacity: Integer read GetCapacity write SetCapacity;
    /// <summary>��ȡ���е�Ԫ��ֵ����</summary>
    property List: TPointerList read GetList;
    /// <summary>�Ѿ������ҳ��</summary>
    property PageCount: Integer read GetPageCount;
    /// <summary>��ǰҳ��С</summary>
    property PageSize: Integer read FPageSize;
  end;

  TQPagedStream = class(TStream)
  private
    procedure SetCapacity(Value: Int64);
    function GetBytes(AIndex: Int64): Byte;
    procedure SetBytes(AIndex: Int64; const Value: Byte);
    procedure SetAsBytes(const Value: TBytes);
    function GetAsBytes: TBytes;
  protected
    FPages: array of PByte;
    FPageSize: Integer;
    FSize: Int64;
    FPosition: Int64;
    FCapacity: Int64;
    function ActivePage: Integer; inline;
    function ActiveOffset: Integer; inline;
    procedure PageNeeded(APageIndex: Integer);
    function GetSize: Int64; override;
  public
    constructor Create; overload;
    constructor Create(APageSize: Integer); overload;
    destructor Destroy; override;
    procedure Clear;
    function Read(var Buffer; count: Longint): Longint; overload; override;
    function Read(Buffer: TBytes; Offset, count: Longint): Longint;
{$IF RTLVersion>23} override{$ELSE}reintroduce;
    overload{$IFEND};
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure SaveToFile(const FileName: string);
    procedure LoadFromStream(Stream: TStream);
    procedure LoadFromFile(const FileName: string);
    procedure SetSize(const NewSize: Int64); override;
    procedure SetSize(NewSize: Longint); override;
    function Write(const Buffer; count: Longint): Longint; overload; override;
    function Write(const Buffer: TBytes; Offset, count: Longint): Longint;
{$IF RTLVersion>23} override{$ELSE}reintroduce;
    overload{$IFEND};
    property Capacity: Int64 read FCapacity write SetCapacity;
    property Bytes[AIndex: Int64]: Byte read GetBytes write SetBytes;
    property AsBytes: TBytes read GetAsBytes write SetAsBytes;
  end;

  TQBits = record
  private
    FBits: TBytes;
    function GetSize: Integer;
    procedure SetSize(const Value: Integer);
    function GetIsSet(AIndex: Integer): Boolean;
    procedure SetIsSet(AIndex: Integer; const Value: Boolean);
  public
    property Size: Integer read GetSize write SetSize;
    property IsSet[AIndex: Integer]: Boolean read GetIsSet
      write SetIsSet; default;
    property Bytes: TBytes read FBits write FBits;
  end;

  TQFilterCharEvent = procedure(const AChar, AIndex: Cardinal;
    var Accept: Boolean; ATag: Pointer) of object;
{$IFDEF UNICODE}
  TQFilterCharEventA = reference to procedure(const c, AIndex: Cardinal;
    var Accept: Boolean; ATag: Pointer);
{$ENDIF}
  TQNumberType = (nftFloat, nftHexPrec, nftDelphiHex, nftCHex, nftBasicHex,
    nftNegative, nftPositive);
  TQNumberTypes = set of TQNumberType;

  TPasswordStrongLevel = (pslLowest, pslLower, pslNormal, pslHigher,
    pslHighest);
  TPasswordRule = (prIncNumber, prIncLowerCase, prIncUpperCase, prIncChart,
    prIncUnicode, prRepeat, prSimpleOrder);
  TPasswordRules = set of TPasswordRule;

  // ���뷽����mrmNone - �����룬mrmSimple - ��������,mrmBank - ���м����뷨�������������˫��
  TMoneyRoundMethod = (mrmNone, mrmSimple, mrmBank);

  // UTF8������Unicode����ת��������ʹ���Լ���ʵ��
function Utf8Decode(p: PQCharA; l: Integer): QStringW; overload;
function Utf8Decode(const p: QStringA): QStringW; overload;
function Utf8Encode(p: PQCharW; l: Integer): QStringA; overload;
function Utf8Encode(const p: QStringW): QStringA; overload;
// Ansi������Unicode����ת��������ʹ��ϵͳ��TEncodingʵ��
function AnsiEncode(p: PQCharW; l: Integer): QStringA; overload;
function AnsiEncode(const p: QStringW): QStringA; overload;
function AnsiDecode(p: PQCharA; l: Integer): QStringW; overload;
function AnsiDecode(const p: QStringA): QStringW; overload;

function CNSpellChars(S: QStringA; AIgnoreEnChars: Boolean): QStringW; overload;
function CNSpellChars(S: QStringW; AIgnoreEnChars: Boolean): QStringW; overload;

// ���㵱ǰ�ַ��ĳ���
function CharSizeA(c: PQCharA): Integer;
function CharSizeU(c: PQCharA): Integer;
function CharSizeW(c: PQCharW): Integer;
// �����ַ���������CharCountW��д�԰���UCS2��չ���ַ�����
function CharCountA(const source: QStringA): Integer;
function CharCountW(const S: QStringW): Integer;
function CharCountU(const source: QStringA): Integer;
function CharCodeA(c: PQCharA): Cardinal;
function CharCodeU(c: PQCharA): Cardinal;
function CharCodeW(c: PQCharW): Cardinal;
// ����ַ��Ƿ���ָ�����б���
function CharInA(const c: PQCharA; const List: array of QCharA;
  ACharLen: PInteger = nil): Boolean;
function CharInW(const c: PQCharW; const List: array of QCharW;
  ACharLen: PInteger = nil): Boolean; overload;
function CharInW(const c, List: PQCharW; ACharLen: PInteger = nil)
  : Boolean; overload;
function CharInU(const c: PQCharA; const List: array of QCharA;
  ACharLen: PInteger = nil): Boolean;

// ����Ƿ��ǿհ��ַ�
function IsSpaceA(const c: PQCharA; ASpaceSize: PInteger = nil): Boolean;
function IsSpaceW(const c: PQCharW; ASpaceSize: PInteger = nil): Boolean;
function IsSpaceU(const c: PQCharA; ASpaceSize: PInteger = nil): Boolean;

// ȫ�ǰ��ת��
function CNFullToHalf(const S: QStringW): QStringW;
function CNHalfToFull(const S: QStringW): QStringW;

// ���Ŵ���
function QuotedStrA(const S: QStringA; const AQuoter: QCharA = $27): QStringA;
function QuotedStrW(const S: QStringW; const AQuoter: QCharW = #$27): QStringW;
function SQLQuoted(const S: QStringW): QStringW;
function DequotedStrA(const S: QStringA; const AQuoter: QCharA = $27): QStringA;
function DequotedStrW(const S: QStringW; const AQuoter: QCharW = #$27)
  : QStringW;

// �����б��е��ַ�
function SkipCharA(var p: PQCharA; const List: array of QCharA): Integer;
function SkipCharU(var p: PQCharA; const List: array of QCharA): Integer;
function SkipCharW(var p: PQCharW; const List: array of QCharA)
  : Integer; overload;
function SkipCharW(var p: PQCharW; const List: PQCharW): Integer; overload;

// �����հ��ַ������� Ansi���룬��������#9#10#13#161#161������UCS���룬��������#9#10#13#$3000
function SkipSpaceA(var p: PQCharA): Integer;
function SkipSpaceU(var p: PQCharA): Integer;
function SkipSpaceW(var p: PQCharW): Integer;
// ����һ��,��#10Ϊ�н�β
function SkipLineA(var p: PQCharA): Integer;
function SkipLineU(var p: PQCharA): Integer;
function SkipLineW(var p: PQCharW): Integer;
// ����ֱ������ָ�����ַ�
function SkipUntilA(var p: PQCharA; AExpects: array of QCharA;
  AQuoter: QCharA = 0): Integer;
function SkipUntilU(var p: PQCharA; AExpects: array of QCharA;
  AQuoter: QCharA = 0): Integer;
function SkipUntilW(var p: PQCharW; AExpects: array of QCharW;
  AQuoter: QCharW = #0): Integer; overload;
function SkipUntilW(var p: PQCharW; AExpects: PQCharW; AQuoter: QCharW = #0)
  : Integer; overload;
// �����ַ��������кţ������е���ʼ��ַ
function StrPosA(Start, Current: PQCharA; var ACol, ARow: Integer): PQCharA;
function StrPosU(Start, Current: PQCharA; var ACol, ARow: Integer): PQCharA;
function StrPosW(Start, Current: PQCharW; var ACol, ARow: Integer): PQCharW;

// �ַ����ֽ�
function DecodeTokenA(var p: PQCharA; ADelimiters: array of QCharA;
  AQuoter: QCharA; AIgnoreSpace: Boolean): QStringA;
function DecodeTokenU(var p: PQCharA; ADelimiters: array of QCharA;
  AQuoter: QCharA; AIgnoreSpace: Boolean): QStringA;
function DecodeTokenW(var p: PQCharW; ADelimiters: array of QCharW;
  AQuoter: QCharW; AIgnoreSpace: Boolean; ASkipDelimiters: Boolean = True)
  : QStringW; overload;
function DecodeTokenW(var p: PQCharW; ADelimiters: PQCharW; AQuoter: QCharW;
  AIgnoreSpace: Boolean; ASkipDelimiters: Boolean = True): QStringW; overload;
function DecodeTokenW(var S: QStringW; ADelimiters: PQCharW; AQuoter: QCharW;
  AIgnoreCase, ARemove: Boolean; ASkipDelimiters: Boolean = True)
  : QStringW; overload;
function SplitTokenW(AList: TStrings; p: PQCharW; ADelimiters: PQCharW;
  AQuoter: QCharW; AIgnoreSpace: Boolean): Integer; overload;
function SplitTokenW(AList: TStrings; const S: QStringW; ADelimiters: PQCharW;
  AQuoter: QCharW; AIgnoreSpace: Boolean): Integer; overload;

function LeftStrW(const S: QStringW; AMaxCount: Integer; ACheckExt: Boolean)
  : QStringW;
function RightStrW(const S: QStringW; AMaxCount: Integer; ACheckExt: Boolean)
  : QStringW;
function StrBetween(var S: PQCharW; AStartTag, AEndTag: QStringW;
  AIgnoreCase: Boolean): QStringW;
function TokenWithIndex(var S: PQCharW; AIndex: Integer; ADelimiters: PQCharW;
  AQuoter: QCharW; AIgnoreSapce: Boolean): QStringW;
function UpperFirstW(const S: QStringW): QStringW;
// ��ȡһ��
function DecodeLineA(var p: PQCharA; ASkipEmpty: Boolean = True;
  AMaxSize: Integer = MaxInt): QStringA;
function DecodeLineU(var p: PQCharA; ASkipEmpty: Boolean = True;
  AMaxSize: Integer = MaxInt): QStringA;
function DecodeLineW(var p: PQCharW; ASkipEmpty: Boolean = True;
  AMaxSize: Integer = MaxInt): QStringW;

// �ж��Ƿ�����ָ�����ַ�����ʼ
function CharUpperA(c: QCharA): QCharA;
function CharUpperW(c: QCharW): QCharW;
function CharLowerA(c: QCharA): QCharA;
function CharLowerW(c: QCharW): QCharW;
function StartWithA(S, startby: PQCharA; AIgnoreCase: Boolean): Boolean;
function StartWithU(S, startby: PQCharA; AIgnoreCase: Boolean): Boolean;
function StartWithW(S, startby: PQCharW; AIgnoreCase: Boolean): Boolean;
function EndWithA(const S, endby: QStringA; AIgnoreCase: Boolean): Boolean;
function EndWithU(const S, endby: QStringA; AIgnoreCase: Boolean): Boolean;
function EndWithW(const S, endby: QStringW; AIgnoreCase: Boolean): Boolean;
function SameCharsA(s1, s2: PQCharA; AIgnoreCase: Boolean): Integer;
function SameCharsU(s1, s2: PQCharA; AIgnoreCase: Boolean): Integer;
function SameCharsW(s1, s2: PQCharW; AIgnoreCase: Boolean): Integer;
// �����ı�
function LoadTextA(AFileName: String; AEncoding: TTextEncoding = teUnknown)
  : QStringA; overload;
function LoadTextA(AStream: TStream; AEncoding: TTextEncoding = teUnknown)
  : QStringA; overload;
function LoadTextU(AFileName: String; AEncoding: TTextEncoding = teUnknown)
  : QStringA; overload;
function LoadTextU(AStream: TStream; AEncoding: TTextEncoding = teUnknown)
  : QStringA; overload;
function LoadTextW(AFileName: String; AEncoding: TTextEncoding = teUnknown)
  : QStringW; overload;
function LoadTextW(AStream: TStream; AEncoding: TTextEncoding = teUnknown)
  : QStringW; overload;
// ����ı����벢�����ı����ݣ�ע�����û��BOM���ı��ļ�ⲻ��100%��������û��BOM
// ʱ��������Unicode��Ansi������ַ�
function DecodeText(p: Pointer; ASize: Integer;
  AEncoding: TTextEncoding = teUnknown): QStringW;
// �����ı�
procedure SaveTextA(AFileName: String; const S: QStringA); overload;
procedure SaveTextA(AStream: TStream; const S: QStringA); overload;
procedure SaveTextU(AFileName: String; const S: QStringA;
  AWriteBom: Boolean = True); overload;
procedure SaveTextU(AFileName: String; const S: QStringW;
  AWriteBom: Boolean = True); overload;
procedure SaveTextU(AStream: TStream; const S: QStringA;
  AWriteBom: Boolean = True); overload;
procedure SaveTextU(AStream: TStream; const S: QStringW;
  AWriteBom: Boolean = True); overload;
procedure SaveTextW(AFileName: String; const S: QStringW;
  AWriteBom: Boolean = True); overload;
procedure SaveTextW(AStream: TStream; const S: QStringW;
  AWriteBom: Boolean = True); overload;
procedure SaveTextWBE(AStream: TStream; const S: QStringW;
  AWriteBom: Boolean = True); overload;

function StrStrA(s1, s2: PQCharA): PQCharA;
function StrIStrA(s1, s2: PQCharA): PQCharA;
function StrStrU(s1, s2: PQCharA): PQCharA;
function StrIStrU(s1, s2: PQCharA): PQCharA;
function StrStrW(s1, s2: PQCharW): PQCharW;
function StrIStrW(s1, s2: PQCharW): PQCharW;
function StrLikeW(S, pat: PQCharW; AIgnoreCase: Boolean): Boolean; overload;
/// <summary>Pos��������ǿ�汾ʵ��</summary>
/// <param name="sub">Ҫ���ҵ����ַ���</param>
/// <param name="S">�������ҵ�ԭ�ַ���</param>
/// <param name="AIgnoreCase">�Ƿ���Դ�Сд</param>
/// <param name="AStartPos">��ʼλ�ã���һ���ַ�λ��Ϊ1</param>
/// <returns>�ҵ��������Ӵ�����ʼλ�ã�ʧ�ܣ�����0<returns>
function PosW(sub, S: PQCharW; AIgnoreCase: Boolean; AStartPos: Integer = 1)
  : Integer; overload;
/// <param name="sub">Ҫ���ҵ����ַ���</param>
/// <param name="S">�������ҵ�ԭ�ַ���</param>
/// <param name="AIgnoreCase">�Ƿ���Դ�Сд</param>
/// <param name="AStartPos">��ʼλ�ã���һ���ַ�λ��Ϊ1</param>
/// <returns>�ҵ��������Ӵ�����ʼλ�ã�ʧ�ܣ�����0<returns>
function PosW(sub, S: QStringW; AIgnoreCase: Boolean; AStartPos: Integer = 1)
  : Integer; overload;
function StrDupX(const S: PQCharW; ACount: Integer): QStringW;
function StrDupW(const S: PQCharW; AOffset: Integer;
  const ACount: Integer = MaxInt): QStringW;
procedure StrCpyW(d: PQCharW; S: PQCharW; ACount: Integer = -1);
function StrCmpA(const s1, s2: PQCharA; AIgnoreCase: Boolean): Integer;
function StrCmpW(const s1, s2: PQCharW; AIgnoreCase: Boolean): Integer;
function StrNCmpW(const s1, s2: PQCharW; AIgnoreCase: Boolean;
  ALength: Integer): Integer;
function NaturalCompareW(s1, s2: PQCharW; AIgnoreCase: Boolean;
  AIgnoreSpace: Boolean = True): Integer;
function IsHexChar(c: QCharW): Boolean; inline;
function HexValue(c: QCharW): Integer;
function HexChar(V: Byte): QCharW;
function TryStrToGuid(const S: QStringW; var AGuid: TGuid): Boolean;
function TryStrToIPV4(const S: QStringW; var AIPV4:
{$IFDEF MSWINDOWS}Integer{$ELSE}Cardinal{$ENDIF}): Boolean;
function StringReplaceW(const S, Old, New: QStringW; AFlags: TReplaceFlags)
  : QStringW; overload;
/// <summary>�滻ָ����Χ�ڵ��ַ�Ϊָ�����ַ�</summary>
/// <param name="AChar">ռλ�ַ�</param>
/// <param name="AFrom">��ʼλ�ã���0��ʼ</param>
/// <param name="ACount">�滻����</param>
/// <returns>�����滻����ַ���</returns>
function StringReplaceW(const S: QStringW; const AChar: QCharW;
  AFrom, ACount: Integer): QStringW; overload;
/// <summary>ʹ��ָ���������滻AStartTag��EndTag֮�������</summary>
/// <params>
/// <param name="S">Ҫ�����滻���ַ���</param>
/// <param name="AStartTag">��ʼ�ı�ǩ����</param>
/// <param name="AEndTag">�����ı�ǩ����</param>
/// <param name="AReplaced">�滻�Ľ��</param>
/// <param name="AWithTag">�Ƿ���ͬAStartTag��AEndTag��ǩһ���滻��</param>
/// <param name="AIgnoreCase">�Ƚϱ�ǩ����ʱ�Ƿ���Դ�С</param>
/// <param name="AMaxTimes">����滻������Ĭ��Ϊ1</param>
/// </params>
/// <returns>�����滻�������</returns>
function StringReplaceWithW(const S, AStartTag, AEndTag, AReplaced: QStringW;
  AWithTag, AIgnoreCase: Boolean; AMaxTimes: Cardinal = 1): QStringW;

function StringReplicateW(const S: QStringW; ACount: Integer): QStringW;

/// <summary>���˵��ַ��������в���Ҫ���ַ�</summary>
/// <param name="S">Ҫ���˵��ַ���</param>
/// <param name="AcceptChars">������ַ��б�</param>
/// <returns>���ع��˺�Ľ��</returns>
function FilterCharW(const S: QStringW; AcceptChars: QStringW)
  : QStringW; overload;
/// <summary>���˵��ַ��������в���Ҫ���ַ�</summary>
/// <param name="S">Ҫ���˵��ַ���</param>
/// <param name="AOnValidate">���ڹ��˵Ļص�����</param>
/// <param name="ATag">�û��Զ���ĸ��Ӳ������ᴫ�ݸ�AOnValidate�¼�</param>
/// <returns>���ع��˺�Ľ��</returns>
function FilterCharW(const S: QStringW; AOnValidate: TQFilterCharEvent;
  ATag: Pointer = nil): QStringW; overload;
{$IFDEF UNICODE}
/// <summary>���˵��ַ��������в���Ҫ���ַ�</summary>
/// <param name="S">Ҫ���˵��ַ���</param>
/// <param name="AOnValidate">���ڹ��˵Ļص�����</param>
/// <param name="ATag">�û��Զ���ĸ��Ӳ������ᴫ�ݸ�AOnValidate�¼�</param>
/// <returns>���ع��˺�Ľ��</returns>
function FilterCharW(const S: QStringW; AOnValidate: TQFilterCharEventA;
  ATag: Pointer = nil): QStringW; overload;
{$ENDIF}
/// <summary>���˵����з���ֵ���͵��ַ����Ӷ������ʽ��һ����Ա�׼�ĸ�����</summary>
/// <param name="S">Ҫ���˵��ַ���</param>
/// <param name="Accepts">�����������</param>
/// <returns>���ع��˺�Ľ��</returns>
/// <remarks>
/// FilterNoNumberW ���˺�Ľ������ʹ�� ParseNumeric ����Ϊ���飬�󲿷������Ҳ
/// ���Ա�StrToFloat��������StrToFloat��֧����Щ�����ʽ��

function FilterNoNumberW(const S: QStringW; Accepts: TQNumberTypes): QStringW;
/// <summary>��������ת��Ϊ��������</summary>
/// <param name="S">Ҫת�����ַ���</param>
/// <returns>����ת����Ľ��</returns>
function SimpleChineseToTraditional(S: QStringW): QStringW;
/// <summary>��������ת��Ϊ��������</summary>
/// <param name="S">Ҫת�����ַ���</param>
/// <returns>����ת����Ľ��</returns>
function TraditionalChineseToSimple(S: QStringW): QStringW;
/// <summary> ������ֵת��Ϊ���ִ�д</summary>
/// <param name="AVal">����ֵ</param>
/// <param name="AFlags">��־λ��ϣ��Ծ����������ĸ�ʽ</param>
/// <param name="ANegText">������ֵΪ����ʱ����ʾ��ǰ׺</param>
/// <param name="AStartText">ǰ���ַ������硰����ң���</param>
/// <param name="AEndText">�����ַ������硰����</param>
/// <param name="AGroupNum">������ÿ���������䵥λ����һ�����飬AGroupNumָ��Ҫ�������������Ϊ0ʱ������Ա�־λ�е�MC_HIDE_ZERO��MC_MERGE_ZERO</param>
/// <param name="ARoundMethod">������뵽��ʱ���㷨</param>
/// <param name="AEndDigts">С������λ����-16~4 ֮��</param>
/// <returns>���ظ�ʽ������ַ���</returns>
function CapMoney(AVal: Currency; AFlags: Integer;
  ANegText, AStartText, AEndText: QStringW; AGroupNum: Integer;
  ARoundMethod: TMoneyRoundMethod; AEndDigits: Integer = 2): QStringW;

function MemScan(S: Pointer; len_s: Integer; sub: Pointer;
  len_sub: Integer): Pointer;
function BinaryCmp(const p1, p2: Pointer; len: Integer): Integer;
// ����ĺ���ֻ��Unicode�汾��û��Ansi��UTF-8�汾�������Ҫ���ټ���
function NameOfW(const S: QStringW; ASpliter: QCharW): QStringW;
function ValueOfW(const S: QStringW; ASpliter: QCharW): QStringW;
function IndexOfNameW(AList: TStrings; const AName: QStringW;
  ASpliter: QCharW): Integer;
function IndexOfValueW(AList: TStrings; const AValue: QStringW;
  ASpliter: QCharW): Integer;
function DeleteCharW(const ASource, ADeletes: QStringW): QStringW;
function DeleteRightW(const S, ADelete: QStringW; AIgnoreCase: Boolean = False;
  ACount: Integer = MaxInt): QStringW;
function DeleteLeftW(const S, ADelete: QStringW; AIgnoreCase: Boolean = False;
  ACount: Integer = MaxInt): QStringW;
function ContainsCharW(const S, ACharList: QStringW): Boolean;
function HtmlEscape(const S: QStringW): QStringW;
function HtmlUnescape(const S: QStringW): QStringW;
function HtmlTrimText(const S: QStringW): QStringW;
function LeftStrCount(const S: QStringW; const sub: QStringW;
  AIgnoreCase: Boolean): Integer;
function RightStrCount(const S: QStringW; const sub: QStringW;
  AIgnoreCase: Boolean): Integer;
// ������һЩ��������
function ParseInt(var S: PQCharW; var ANum: Int64): Integer;
function ParseHex(var p: PQCharW; var Value: Int64): Integer;
function ParseNumeric(var S: PQCharW; var ANum: Extended): Boolean;
function ParseDateTime(S: PWideChar; var AResult: TDateTime): Boolean;
function ParseWebTime(p: PWideChar; var AResult: TDateTime): Boolean;
function RollupSize(ASize: Int64): QStringW;
function RollupTime(ASeconds: Int64; AHideZero: Boolean = True): QStringW;
function DetectTextEncoding(const p: Pointer; l: Integer; var b: Boolean)
  : TTextEncoding;
procedure ExchangeByteOrder(p: PQCharA; l: Integer); overload;
function ExchangeByteOrder(V: Smallint): Smallint; overload; inline;
function ExchangeByteOrder(V: Word): Word; overload; inline;
function ExchangeByteOrder(V: Integer): Integer; overload; inline;
function ExchangeByteOrder(V: Cardinal): Cardinal; overload; inline;
function ExchangeByteOrder(V: Int64): Int64; overload; inline;
function ExchangeByteOrder(V: Single): Single; overload; inline;
function ExchangeByteOrder(V: Double): Double; overload; // inline;

procedure FreeObject(AObject: TObject); inline;
// ԭ�Ӳ�������
function AtomicAnd(var Dest: Integer; const AMask: Integer): Integer;
function AtomicOr(var Dest: Integer; const AMask: Integer): Integer;
{$IF RTLVersion<24}
// Ϊ��XE6���ݣ�InterlockedCompareExchange�ȼ�
function AtomicCmpExchange(var Target: Integer; Value: Integer;
  Comparand: Integer): Integer; inline; overload;
function AtomicCmpExchange(var Target: Pointer; Value: Pointer;
  Comparand: Pointer): Pointer; inline; overload;
// �ȼ���InterlockedExchanged
function AtomicExchange(var Target: Integer; Value: Integer): Integer;
  inline; overload;
function AtomicExchange(var Target: Pointer; Value: Pointer): Pointer;
  inline; overload;

function AtomicIncrement(var Target: Integer; const Value: Integer = 1)
  : Integer; inline;
function AtomicDecrement(var Target: Integer): Integer; inline;
{$IFEND <XE5}
//
function BinToHex(p: Pointer; l: Integer; ALowerCase: Boolean = False)
  : QStringW; overload;
function BinToHex(const ABytes: TBytes; ALowerCase: Boolean = False)
  : QStringW; overload;
function HexToBin(const S: QStringW): TBytes; overload;
procedure HexToBin(const S: QStringW; var AResult: TBytes); overload;
// ����ָ�����ݵĹ�ϣֵ
function HashOf(p: Pointer; l: Integer): Cardinal;
function NewId: TGuid;
function SameId(const V1, V2: TGuid): Boolean;

/// <summary>����ָ�����ݵ�����ǿ��</summary>
/// <param name="S">����</param>
/// <returns>����һ��>=0������ǿ��ֵ</returns>
function PasswordScale(const S: QStringW): Integer;
/// <summary>��ָ��������ǿ��ϵ��ת��Ϊǿ�ȵȼ�</summary>
/// <param name="AScale">ͨ��PasswordScale�õ���ǿ�ȵȼ�</param>
/// <returns>����ת�����ǿ�ȵȼ�</returns>
function CheckPassword(const AScale: Integer): TPasswordStrongLevel; overload;
/// <summary>����ָ�����ݵ������ǿ�ȵȼ�</summary>
/// <param name="S">����</param>
/// <returns>���ؼ���õ���ǿ�ȵȼ�</returns>
function CheckPassword(const S: QStringW): TPasswordStrongLevel; overload;
/// <summary>���ָ�����й����֤�ŵ���Ч��</summary>
/// <param name="CardNo">���֤��</param>
/// <returns>������Ϲ��򣬷���true�����򣬷���false</returns>
function IsChineseIdNo(CardNo: QStringW): Boolean;
/// <summary>����ָ�����й���½���֤�ŵ���ɲ���</summary>
/// <param name="CardNo">���֤��</param>
/// <param name="AreaCode">������������</param>
/// <param name="Birthday">��������</param>
/// <param name="IsFemale">�Ա���Ϊtrue��ŮΪfalse</param>
/// <returns>���֤����Ч������true����ͨ���������ظ������֣����򣬷���false</returns>
function DecodeChineseId(CardNo: QStringW; var AreaCode: QStringW;
  var Birthday: TDateTime; var IsFemale: Boolean): Boolean;
/// <summary>���ָ�����ַ����Ƿ���ϵ��������ʽ</summary>
/// <param name="S">Ҫ���ĵ��������ַ</param>
/// <returns>�����x@y.z��ʽ���򷵻�true�����򣬷���false</returns>
function IsEmailAddr(S: QStringW): Boolean;
/// <summary>����Ƿ����й��ֻ������ʽ</summary>
/// <param name="S">Ҫ�����ֻ�����</param>
/// <returns>�����11λ���֣�������1��ͷ���򷵻�true�����򷵻�false</returns>
function IsChineseMobile(S: QStringW): Boolean;
function SizeOfFile(const S: QStringW): Int64;

var
  JavaFormatUtf8: Boolean;
  IsFMXApp: Boolean;

const
  SLineBreak: PQCharW = {$IFDEF MSWINDOWS}#13#10{$ELSE}#10{$ENDIF};
  DefaultNumberSet = [nftFloat, nftDelphiHex, nftCHex, nftBasicHex, nftHexPrec,
    nftNegative, nftPositive];

implementation

uses dateutils, math, variants
{$IFDEF MSWINDOWS}
    , windows
{$ENDIF}
{$IF (RTLVersion>=25) and (not Defined(NEXTGEN))}
    , AnsiStrings
{$IFEND >=XE4}
    ;

resourcestring
  SBadUnicodeChar = '��Ч��Unicode�ַ�:%d';
  SBadUtf8Char = '��Ч��UTF8�ַ�:%d';
  SOutOfIndex = '����Խ�磬ֵ %d ����[%d..%d]�ķ�Χ�ڡ�';
  SDayName = '��';
  SHourName = 'Сʱ';
  SMinuteName = '����';
  SSecondName = '��';
  SCharNeeded = '��ǰλ��Ӧ���� "%s" �������� "%s"��';
  SRangeEndNeeded = '�ַ���Χ�߽�����ַ�δָ����';
  STooSmallCapMoneyGroup = '�����ķ����� %d С��ʵ����Ҫ����С���ҷ����� %d��';
  SUnsupportNow = 'ָ���ĺ��� %s Ŀǰ����֧��';

type
  TGBKCharSpell = record
    SpellChar: QCharW;
    StartChar, EndChar: Word;
  end;

  TStrStrFunction = function(s1, s2: PQCharW): PQCharW;
{$IF RTLVersion>=21}
  TIntArray = TArray<Integer>;
{$ELSE}
  TIntArray = array of Integer;
{$IFEND >=2010}
{$IFDEF MSWINDOWS}
  TMSVCStrStr = function(s1, s2: PQCharA): PQCharA; cdecl;
  TMSVCStrStrW = function(s1, s2: PQCharW): PQCharW; cdecl;
  TMSVCMemCmp = function(s1, s2: Pointer; len: Integer): Integer; cdecl;
{$ENDIF}

var
  // GBK����ƴ������ĸ��
  GBKSpells: array [0 .. 22] of TGBKCharSpell = (
    (
      SpellChar: 'A'; StartChar: $B0A1; EndChar: $B0C4;
    ), (SpellChar: 'B'; StartChar: $B0C5; EndChar: $B2C0;
    ), (SpellChar: 'C'; StartChar: $B2C1; EndChar: $B4ED;
    ), (SpellChar: 'D'; StartChar: $B4EE; EndChar: $B6E9;
    ), (SpellChar: 'E'; StartChar: $B6EA; EndChar: $B7A1;
    ), (SpellChar: 'F'; StartChar: $B7A2; EndChar: $B8C0;
    ), (SpellChar: 'G'; StartChar: $B8C1; EndChar: $B9FD;
    ), (SpellChar: 'H'; StartChar: $B9FE; EndChar: $BBF6;
    ), (SpellChar: 'J'; StartChar: $BBF7; EndChar: $BFA5;
    ), (SpellChar: 'K'; StartChar: $BFA6; EndChar: $C0AB;
    ), (SpellChar: 'L'; StartChar: $C0AC; EndChar: $C2E7;
    ), (SpellChar: 'M'; StartChar: $C2E8; EndChar: $C4C2;
    ), (SpellChar: 'N'; StartChar: $C4C3; EndChar: $C5B5;
    ), (SpellChar: 'O'; StartChar: $C5B6; EndChar: $C5BD;
    ), (SpellChar: 'P'; StartChar: $C5BE; EndChar: $C6D9;
    ), (SpellChar: 'Q'; StartChar: $C6DA; EndChar: $C8BA;
    ), (SpellChar: 'R'; StartChar: $C8BB; EndChar: $C8F5;
    ), (SpellChar: 'S'; StartChar: $C8F6; EndChar: $CBF0;
    ), (SpellChar: 'T'; StartChar: $CBFA; EndChar: $CDD9;
    ), (SpellChar: 'W'; StartChar: $CDDA; EndChar: $CEF3;
    ), (SpellChar: 'X'; StartChar: $CEF4; EndChar: $D188;
    ), (SpellChar: 'Y'; StartChar: $D1B9; EndChar: $D4D0;
    ), (SpellChar: 'Z'; StartChar: $D4D1; EndChar: $D7F9;));
{$IFDEF MSWINDOWS}
  hMsvcrtl: HMODULE;
  VCStrStr: TMSVCStrStr;
  VCStrStrW: TMSVCStrStrW;
  VCMemCmp: TMSVCMemCmp;
{$ENDIF}

const
  HtmlEscapeChars: array [0 .. 185] of QStringW = (QCharW(32), '&nbsp;',
    QCharW(34), '&quot;', QCharW(38), '&amp;', QCharW(39), '&apos;', QCharW(60),
    '&lt;', QCharW(62), '&gt;', QCharW(161), '&iexcl;', QCharW(162), '&cent;',
    QCharW(163), '&pound;', QCharW(164), '&curren;', QCharW(165), '&yen;',
    QCharW(166), '&brvbar;', QCharW(167), '&sect;', QCharW(168), '&uml;',
    QCharW(169), '&copy;', QCharW(170), '&ordf;', QCharW(171), '&laquo;',
    QCharW(172), '&not;', QCharW(173), '&shy;', QCharW(174), '&reg;',
    QCharW(175), '&macr;', QCharW(176), '&deg;', QCharW(177), '&plusmn;',
    QCharW(180), '&acute;', QCharW(181), '&micro;', QCharW(182), '&para;',
    QCharW(183), '&middot;', QCharW(184), '&cedil;', QCharW(186), '&ordm;',
    QCharW(187), '&raquo;', QCharW(191), '&iquest;', QCharW(192), '&Agrave;',
    QCharW(193), '&Aacute;', QCharW(194), '&circ;', QCharW(195), '&Atilde;',
    QCharW(197), '&ring;', QCharW(198), '&AElig;', QCharW(199), '&Ccedil;',
    QCharW(200), '&Egrave;', QCharW(201), '&Eacute;', QCharW(202), '&Ecirc;',
    QCharW(203), '&Euml;', QCharW(204), '&Igrave;', QCharW(205), '&Iacute;',
    QCharW(206), '&Icirc;', QCharW(207), '&Iuml;', QCharW(208), '&ETH;',
    QCharW(209), '&Ntilde;', QCharW(210), '&Ograve;', QCharW(211), '&Oacute;',
    QCharW(212), '&Ocirc;', QCharW(213), '&Otilde;', QCharW(214), '&Ouml;',
    QCharW(215), '&times;', QCharW(216), '&Oslash;', QCharW(217), '&Ugrave;',
    QCharW(218), '&Uacute;', QCharW(219), '&Ucirc;', QCharW(220), '&Uuml;',
    QCharW(221), '&Yacute;', QCharW(222), '&THORN;', QCharW(223), '&szlig;',
    QCharW(224), '&agrave;', QCharW(225), '&aacute;', QCharW(227), '&atilde;',
    QCharW(228), '&auml;', QCharW(229), '&aring;', QCharW(230), '&aelig;',
    QCharW(231), '&ccedil;', QCharW(232), '&egrave;', QCharW(233), '&eacute;',
    QCharW(234), '&ecirc;', QCharW(235), '&euml;', QCharW(236), '&igrave;',
    QCharW(237), '&iacute;', QCharW(238), '&icirc;', QCharW(239), '&iuml;',
    QCharW(240), '&ieth;', QCharW(241), '&ntilde;', QCharW(242), '&ograve;',
    QCharW(243), '&oacute;', QCharW(244), '&ocirc;', QCharW(245), '&otilde;',
    QCharW(246), '&ouml;', QCharW(247), '&divide;', QCharW(248), '&oslash;',
    QCharW(249), '&ugrave;', QCharW(250), '&uacute;', QCharW(251), '&ucirc;',
    QCharW(252), '&uuml;', QCharW(253), '&yacute;', QCharW(254), '&thorn;',
    QCharW(255), '&yuml;');
  // QString����

function Utf8Decode(const p: QStringA): QStringW;
begin
  if p.IsUtf8 then
    Result := Utf8Decode(PQCharA(p), p.Length)
  else if p.Length > 0 then
    Result := AnsiDecode(p)
  else
    SetLength(Result, 0);
end;

function Utf8Encode(const p: QStringW): QStringA;
var
  l: NativeInt;
begin
  l := Length(p);
  if l > 0 then
    Result := Utf8Encode(PQCharW(p), l)
  else
  begin
    Result.Length := 0;
    Result.FValue[0] := 1;
  end;
end;

function Utf8Decode(p: PQCharA; l: Integer; var AResult: QStringW;
  var ABadAt: PQCharA): Boolean; overload;
var
  ps, pe: PByte;
  pd, pds: PWord;
  c: Cardinal;
begin
  if l <= 0 then
  begin
    ps := PByte(p);
    while ps^ <> 0 do
      Inc(ps);
    l := IntPtr(ps) - IntPtr(p);
  end;
  ps := PByte(p);
  pe := ps;
  Inc(pe, l);
  System.SetLength(AResult, l);
  pd := PWord(PQCharW(AResult));
  pds := pd;
  Result := True;
  while IntPtr(ps) < IntPtr(pe) do
  begin
    if (ps^ and $80) <> 0 then
    begin
      if (ps^ and $FC) = $FC then // 4000000+
      begin
        c := (ps^ and $03) shl 30;
        Inc(ps);
        c := c or ((ps^ and $3F) shl 24);
        Inc(ps);
        c := c or ((ps^ and $3F) shl 18);
        Inc(ps);
        c := c or ((ps^ and $3F) shl 12);
        Inc(ps);
        c := c or ((ps^ and $3F) shl 6);
        Inc(ps);
        c := c or (ps^ and $3F);
        Inc(ps);
        c := c - $10000;
        pd^ := $D800 + ((c shr 10) and $3FF);
        Inc(pd);
        pd^ := $DC00 + (c and $3FF);
        Inc(pd);
      end
      else if (ps^ and $F8) = $F8 then // 200000-3FFFFFF
      begin
        c := (ps^ and $07) shl 24;
        Inc(ps);
        c := c or ((ps^ and $3F) shl 18);
        Inc(ps);
        c := c or ((ps^ and $3F) shl 12);
        Inc(ps);
        c := c or ((ps^ and $3F) shl 6);
        Inc(ps);
        c := c or (ps^ and $3F);
        Inc(ps);
        c := c - $10000;
        pd^ := $D800 + ((c shr 10) and $3FF);
        Inc(pd);
        pd^ := $DC00 + (c and $3FF);
        Inc(pd);
      end
      else if (ps^ and $F0) = $F0 then // 10000-1FFFFF
      begin
        c := (ps^ and $0F) shl 18;
        Inc(ps);
        c := c or ((ps^ and $3F) shl 12);
        Inc(ps);
        c := c or ((ps^ and $3F) shl 6);
        Inc(ps);
        c := c or (ps^ and $3F);
        Inc(ps);
        c := c - $10000;
        pd^ := $D800 + ((c shr 10) and $3FF);
        Inc(pd);
        pd^ := $DC00 + (c and $3FF);
        Inc(pd);
      end
      else if (ps^ and $E0) = $E0 then // 800-FFFF
      begin
        c := (ps^ and $1F) shl 12;
        Inc(ps);
        c := c or ((ps^ and $3F) shl 6);
        Inc(ps);
        c := c or (ps^ and $3F);
        Inc(ps);
        pd^ := c;
        Inc(pd);
      end
      else if (ps^ and $C0) = $C0 then // 80-7FF
      begin
        pd^ := (ps^ and $3F) shl 6;
        Inc(ps);
        pd^ := pd^ or (ps^ and $3F);
        Inc(pd);
        Inc(ps);
      end
      else
      begin
        ABadAt := PQCharA(ps);
        Result := False;
        Exit;
      end;
    end
    else
    begin
      pd^ := ps^;
      Inc(ps);
      Inc(pd);
    end;
  end;
  System.SetLength(AResult, (IntPtr(pd) - IntPtr(pds)) shr 1);

end;

function Utf8Decode(p: PQCharA; l: Integer): QStringW;
var
  ABadChar: PQCharA;
begin
  if not Utf8Decode(p, l, Result, ABadChar) then
    raise Exception.Create(Format(SBadUtf8Char, [ABadChar^]));
end;

function WideCharUtf8Size(c: Integer): Integer;
begin
  if c < $7F then
    Result := 1
  else if c < $7FF then
    Result := 2
  else if c < $FFFF then
    Result := 3
  else if c < $1FFFFF then
    Result := 4
  else if c < $3FFFFFF then
    Result := 5
  else
    Result := 6;
end;

function Utf8BufferSize(p: PQCharW; var l: Integer): Integer;
var
  c: Cardinal;
  t: Integer;
begin
  Result := 0;
  if l < 0 then
  begin
    l := 0;
    while p^ <> #0 do
    begin
      if (p^ >= #$D800) and (p^ <= #$DFFF) then // Unicode ��չ���ַ�
      begin
        c := (Word(p^) - $D800);
        Inc(p);
        if (p^ >= #$DC00) and (p^ <= #$DFFF) then
        begin
          c := $10000 + (c shl 10) + Word(p^) - $DC00;
          Inc(p);
        end;
        Inc(Result, WideCharUtf8Size(c));
      end
      else
        Inc(Result, WideCharUtf8Size(Word(p^)));
      Inc(p);
      Inc(l);
    end;
  end
  else
  begin
    t := l;
    while t > 0 do
    begin
      if (p^ >= #$D800) and (p^ <= #$DFFF) then // Unicode ��չ���ַ�
      begin
        c := (Word(p^) - $D800);
        Inc(p);
        if (p^ >= #$DC00) and (p^ <= #$DFFF) then
        begin
          c := $10000 + (c shl 10) + Word(p^) - $DC00;
          Inc(p);
        end;
        Inc(Result, WideCharUtf8Size(c));
      end
      else
        Inc(Result, WideCharUtf8Size(Word(p^)));
      Inc(p);
      Dec(t);
    end;
  end;
end;

function Utf8Encode(p: PQCharW; l: Integer): QStringA;
var
  ps: PQCharW;
  pd, pds: PQCharA;
  c: Cardinal;
begin
  if p = nil then
  begin
    Result.Length := 0;
    Result.FValue[0] := 1;
  end
  else
  begin
    Result.Length := Utf8BufferSize(p, l);
    if l > 0 then
    begin
      Result.FValue[0] := 1;
      ps := p;
      pd := PQCharA(Result);
      pds := pd;
      while l > 0 do
      begin
        c := Cardinal(ps^);
        Inc(ps);
        if (c >= $D800) and (c <= $DFFF) then // Unicode ��չ���ַ�
        begin
          c := (c - $D800);
          if (ps^ >= #$DC00) and (ps^ <= #$DFFF) then
          begin
            c := $10000 + ((c shl 10) + (Cardinal(ps^) - $DC00));
            Inc(ps);
            Dec(l);
          end
          else
            raise Exception.Create(Format(SBadUnicodeChar, [IntPtr(ps^)]));
        end;
        Dec(l);
        if c = $0 then
        begin
          if JavaFormatUtf8 then // ����Java��ʽ���룬��#$0�ַ�����Ϊ#$C080
          begin
            pd^ := $C0;
            Inc(pd);
            pd^ := $80;
            Inc(pd);
          end
          else
          begin
            pd^ := c;
            Inc(pd);
          end;
        end
        else if c <= $7F then // 1B
        begin
          pd^ := c;
          Inc(pd);
        end
        else if c <= $7FF then // $80-$7FF,2B
        begin
          pd^ := $C0 or (c shr 6);
          Inc(pd);
          pd^ := $80 or (c and $3F);
          Inc(pd);
        end
        else if c <= $FFFF then // $8000 - $FFFF,3B
        begin
          pd^ := $E0 or (c shr 12);
          Inc(pd);
          pd^ := $80 or ((c shr 6) and $3F);
          Inc(pd);
          pd^ := $80 or (c and $3F);
          Inc(pd);
        end
        else if c <= $1FFFFF then // $01 0000-$1F FFFF,4B
        begin
          pd^ := $F0 or (c shr 18); // 1111 0xxx
          Inc(pd);
          pd^ := $80 or ((c shr 12) and $3F); // 10 xxxxxx
          Inc(pd);
          pd^ := $80 or ((c shr 6) and $3F); // 10 xxxxxx
          Inc(pd);
          pd^ := $80 or (c and $3F); // 10 xxxxxx
          Inc(pd);
        end
        else if c <= $3FFFFFF then // $20 0000 - $3FF FFFF,5B
        begin
          pd^ := $F8 or (c shr 24); // 1111 10xx
          Inc(pd);
          pd^ := $F0 or ((c shr 18) and $3F); // 10 xxxxxx
          Inc(pd);
          pd^ := $80 or ((c shr 12) and $3F); // 10 xxxxxx
          Inc(pd);
          pd^ := $80 or ((c shr 6) and $3F); // 10 xxxxxx
          Inc(pd);
          pd^ := $80 or (c and $3F); // 10 xxxxxx
          Inc(pd);
        end
        else if c <= $7FFFFFFF then // $0400 0000-$7FFF FFFF,6B
        begin
          pd^ := $FC or (c shr 30); // 1111 11xx
          Inc(pd);
          pd^ := $F8 or ((c shr 24) and $3F); // 10 xxxxxx
          Inc(pd);
          pd^ := $F0 or ((c shr 18) and $3F); // 10 xxxxxx
          Inc(pd);
          pd^ := $80 or ((c shr 12) and $3F); // 10 xxxxxx
          Inc(pd);
          pd^ := $80 or ((c shr 6) and $3F); // 10 xxxxxx
          Inc(pd);
          pd^ := $80 or (c and $3F); // 10 xxxxxx
          Inc(pd);
        end;
      end;
      pd^ := 0;
      Result.Length := IntPtr(pd) - IntPtr(pds);
    end;
  end;
end;

function AnsiEncode(p: PQCharW; l: Integer): QStringA;
var
  ps: PQCharW;
begin
  if l <= 0 then
  begin
    ps := p;
    while ps^ <> #0 do
      Inc(ps);
    l := ps - p;
  end;
  if l > 0 then
  begin
{$IFDEF MSWINDOWS}
    Result.Length := WideCharToMultiByte(CP_ACP, 0, p, l, nil, 0, nil, nil);
    WideCharToMultiByte(CP_ACP, 0, p, l, LPSTR(Result.Data), Result.Length,
      nil, nil);
{$ELSE}
    Result.Length := l shl 1;
    Result.FValue[0] := 0;
    Move(p^, PQCharA(Result)^, l shl 1);
    Result := TEncoding.Convert(TEncoding.Unicode, TEncoding.ANSI,
      Result.FValue, 1, l shl 1);
{$ENDIF}
  end
  else
    Result.Length := 0;
end;

function AnsiEncode(const p: QStringW): QStringA;
var
  l: NativeInt;
begin
  l := Length(p);
  if l > 0 then
    Result := AnsiEncode(PQCharW(p), l)
  else
    Result.Length := 0;
end;

function AnsiDecode(p: PQCharA; l: Integer): QStringW;
var
  ps: PQCharA;
{$IFNDEF MSWINDOWS}
  ABytes: TBytes;
{$ENDIF}
begin
  if l <= 0 then
  begin
    ps := p;
    while ps^ <> 0 do
      Inc(ps);
    l := IntPtr(ps) - IntPtr(p);
  end;
  if l > 0 then
  begin
{$IFDEF MSWINDOWS}
    System.SetLength(Result, MultiByteToWideChar(CP_ACP, 0, PAnsiChar(p),
      l, nil, 0));
    MultiByteToWideChar(CP_ACP, 0, PAnsiChar(p), l, PWideChar(Result),
      Length(Result));
{$ELSE}
    System.SetLength(ABytes, l);
    Move(p^, PByte(@ABytes[0])^, l);
    Result := TEncoding.ANSI.GetString(ABytes);
{$ENDIF}
  end
  else
    System.SetLength(Result, 0);
end;

function AnsiDecode(const p: QStringA): QStringW;
begin
  if p.IsUtf8 then
    Result := Utf8Decode(p)
  else if p.Length > 0 then
  begin
{$IFDEF MSWINDOWS}
    Result := AnsiDecode(PQCharA(p), p.Length);
{$ELSE}
    Result := TEncoding.ANSI.GetString(p.FValue, 1, p.Length);
{$ENDIF}
  end
  else
    SetLength(Result, 0);
end;

function CNSpellChars(S: QStringA; AIgnoreEnChars: Boolean): QStringW;
var
  p: PQCharA;
  pd, pds: PQCharW;
  function SpellOfChar: QCharW;
  var
    I: Integer;
    w: Word;
  begin
    w := p^ shl 8;
    Inc(p);
    w := w or p^;
    Inc(p);
    Result := #0;
    for I := 0 to 22 do
    begin
      if (w >= GBKSpells[I].StartChar) and (w <= GBKSpells[I].EndChar) then
      begin
        Result := GBKSpells[I].SpellChar;
        Break;
      end;
    end;
  end;

begin
  if S.Length > 0 then
  begin
    p := PQCharA(S);
    System.SetLength(Result, S.Length);
    pd := PQCharW(Result);
    pds := pd;
    while p^ <> 0 do
    begin
      if p^ in [1 .. 127] then
      begin
        if not AIgnoreEnChars then
        begin
          pd^ := QCharW(p^);
          Inc(pd);
        end;
        Inc(p);
      end
      else
      begin
        pd^ := SpellOfChar;
        if pd^ <> #0 then
          Inc(pd);
      end;
    end;
    System.SetLength(Result, pd - pds);
  end
  else
    System.SetLength(Result, 0);
end;

function CNSpellChars(S: QStringW; AIgnoreEnChars: Boolean): QStringW;
begin
  Result := CNSpellChars(AnsiEncode(S), AIgnoreEnChars);
end;

function CharSizeA(c: PQCharA): Integer;
begin
  { GB18030,����GBK��GB2312
    ���ֽڣ���ֵ��0��0x7F��
    ˫�ֽڣ���һ���ֽڵ�ֵ��0x81��0xFE���ڶ����ֽڵ�ֵ��0x40��0xFE��������0x7F����
    ���ֽڣ���һ���ֽڵ�ֵ��0x81��0xFE���ڶ����ֽڵ�ֵ��0x30��0x39���������ֽڴ�0x81��0xFE�����ĸ��ֽڴ�0x30��0x39��
  }
{$IFDEF MSWINDOWS}
  if GetACP = 936 then
{$ELSE}
  if TEncoding.ANSI.CodePage = 936 then
{$ENDIF}
  begin
    Result := 1;
    if (c^ >= $81) and (c^ <= $FE) then
    begin
      Inc(c);
      if (c^ >= $40) and (c^ <= $FE) and (c^ <> $7F) then
        Result := 2
      else if (c^ >= $30) and (c^ <= $39) then
      begin
        Inc(c);
        if (c^ >= $81) and (c^ <= $FE) then
        begin
          Inc(c);
          if (c^ >= $30) and (c^ <= $39) then
            Result := 4;
        end;
      end;
    end;
  end
  else
{$IFDEF QDAC_ANSISTRINGS}
    Result := AnsiStrings.StrCharLength(PAnsiChar(c));
{$ELSE}
{$IFDEF NEXTGEN}
    if TEncoding.ANSI.CodePage = CP_UTF8 then
      Result := CharSizeU(c)
    else if (c^ < 128) or (TEncoding.ANSI.CodePage = 437) then
      Result := 1
    else
      Result := 2;
{$ELSE}
{$IF RTLVersion>=25}
    Result := AnsiStrings.StrCharLength(PAnsiChar(c));
{$ELSE}
    Result := sysutils.StrCharLength(PAnsiChar(c));
{$IFEND}
{$ENDIF}
{$ENDIF !QDAC_ANSISTRINGS}
end;

function CharSizeU(c: PQCharA): Integer;
begin
  if (c^ and $80) = 0 then
    Result := 1
  else
  begin
    if (c^ and $FC) = $FC then // 4000000+
      Result := 6
    else if (c^ and $F8) = $F8 then // 200000-3FFFFFF
      Result := 5
    else if (c^ and $F0) = $F0 then // 10000-1FFFFF
      Result := 4
    else if (c^ and $E0) = $E0 then // 800-FFFF
      Result := 3
    else if (c^ and $C0) = $C0 then // 80-7FF
      Result := 2
    else
      Result := 1;
  end
end;

function CharSizeW(c: PQCharW): Integer;
begin
  if (c[0] >= #$D800) and (c[0] <= #$DBFF) and (c[1] >= #$DC00) and
    (c[1] <= #$DFFF) then
    Result := 2
  else
    Result := 1;
end;

function CharCodeA(c: PQCharA): Cardinal;
var
  t: QStringA;
begin
  t := AnsiDecode(c, CharSizeA(c));
  Result := CharCodeW(PQCharW(t));
end;

function CharCodeU(c: PQCharA): Cardinal;
begin
  if (c^ and $80) <> 0 then
  begin
    if (c^ and $FC) = $FC then // 4000000+
    begin
      Result := (c^ and $03) shl 30;
      Inc(c);
      Result := Result or ((c^ and $3F) shl 24);
      Inc(c);
      Result := Result or ((c^ and $3F) shl 18);
      Inc(c);
      Result := Result or ((c^ and $3F) shl 12);
      Inc(c);
      Result := Result or ((c^ and $3F) shl 6);
      Inc(c);
      Result := Result or (c^ and $3F);
    end
    else if (c^ and $F8) = $F8 then // 200000-3FFFFFF
    begin
      Result := (c^ and $07) shl 24;
      Inc(c);
      Result := Result or ((c^ and $3F) shl 18);
      Inc(c);
      Result := Result or ((c^ and $3F) shl 12);
      Inc(c);
      Result := Result or ((c^ and $3F) shl 6);
      Inc(c);
      Result := Result or (c^ and $3F);
    end
    else if (c^ and $F0) = $F0 then // 10000-1FFFFF
    begin
      Result := (c^ and $0F) shr 18;
      Inc(c);
      Result := Result or ((c^ and $3F) shl 12);
      Inc(c);
      Result := Result or ((c^ and $3F) shl 6);
      Inc(c);
      Result := Result or (c^ and $3F);
    end
    else if (c^ and $E0) = $E0 then // 800-FFFF
    begin
      Result := (c^ and $1F) shl 12;
      Inc(c);
      Result := Result or ((c^ and $3F) shl 6);
      Inc(c);
      Result := Result or (c^ and $3F);
    end
    else if (c^ and $C0) = $C0 then // 80-7FF
    begin
      Result := (c^ and $3F) shl 6;
      Inc(c);
      Result := Result or (c^ and $3F);
    end
    else
      raise Exception.Create(Format(SBadUtf8Char, [IntPtr(c^)]));
  end
  else
    Result := c^;
end;

function CharCodeW(c: PQCharW): Cardinal;
begin
  if (c^ >= #$D800) and (c^ <= #$DFFF) then // Unicode ��չ���ַ�
  begin
    Result := (Ord(c^) - $D800);
    Inc(c);
    if (c^ >= #$DC00) and (c^ <= #$DFFF) then
    begin
      Result := $10000 + ((Result shl 10) + (Cardinal(Ord(c^)) - $DC00));
    end
    else
      Result := 0
  end
  else
    Result := Ord(c^);
end;

function CharCountA(const source: QStringA): Integer;
var
  p: PQCharA;
  l, ASize: Integer;
begin
  p := PQCharA(source);
  l := source.Length;
  Result := 0;
  while l > 0 do
  begin
    ASize := CharSizeA(p);
    Dec(l, ASize);
    Inc(p, ASize);
    Inc(Result);
  end;
  // Result:=TEncoding.ANSI.GetCharCount(source);
end;

function CharCountW(const S: QStringW): Integer;
var
  p, pe: PWord;
  ALen: Integer;
  procedure CountChar;
  begin
    if (p^ > $D800) and (p^ < $DFFF) then
    begin
      Inc(p);
      if (p^ >= $DC00) and (p^ < $DFFF) then
      begin
        Inc(p);
        Inc(Result);
      end
      else
        Result := -1;
    end
    else
    begin
      Inc(Result);
      Inc(p);
    end;
  end;

begin
  Result := 0;
  p := PWord(S);
  ALen := Length(S);
  pe := PWord(IntPtr(p) + (ALen shl 1));
  while IntPtr(p) < IntPtr(pe) do
    CountChar;
end;

function CharCountU(const source: QStringA): Integer;
var
  p, pe: PQCharA;
  procedure CountChar;
  begin
    if (p^ and $80) = 0 then
    begin
      Inc(Result);
      Inc(p);
    end
    else if (p^ and $FC) = $FC then
    begin
      Inc(Result);
      Inc(p, 6);
    end
    else if (p^ and $F8) = $F8 then
    begin
      Inc(Result);
      Inc(p, 5);
    end
    else if (p^ and $F0) = $F0 then
    begin
      Inc(Result);
      Inc(p, 4);
    end
    else if (p^ and $E0) = $E0 then
    begin
      Inc(Result);
      Inc(p, 3);
    end
    else if (p^ and $C0) = $C0 then
    begin
      Inc(Result);
      Inc(p, 2);
    end
    else
      Result := -1;
  end;

begin
  Result := 0;
  p := PQCharA(source);
  pe := PQCharA(IntPtr(p) + source.Length);
  while (IntPtr(p) < IntPtr(pe)) and (Result >= 0) do
    CountChar;
end;

procedure CalcCharLengthA(var Lens: TIntArray; const List: array of QCharA);
var
  I, l: Integer;
begin
  I := Low(List);
  System.SetLength(Lens, Length(List));
  while I <= High(List) do
  begin
    l := CharSizeA(@List[I]);
    Lens[I] := l;
    Inc(I, l);
  end;
end;

function CharInA(const c: PQCharA; const List: array of QCharA;
  ACharLen: PInteger): Boolean;
var
  I, count: Integer;
  Lens: TIntArray;
begin
  count := High(List) + 1;
  Result := False;
  CalcCharLengthA(Lens, List);
  I := Low(List);
  while I < count do
  begin
    if CompareMem(c, @List[I], Lens[I]) then
    begin
      if ACharLen <> nil then
        ACharLen^ := Lens[I];
      Result := True;
      Break;
    end
    else
      Inc(I, Lens[I]);
  end;
end;

procedure CalcCharLengthW(var Lens: TIntArray; const List: array of QCharW);
var
  I, l: Integer;
begin
  I := Low(List);
  System.SetLength(Lens, Length(List));
  while I <= High(List) do
  begin
    l := CharSizeW(@List[I]);
    Lens[I] := l;
    Inc(I, l);
  end;
end;

function CharInW(const c: PQCharW; const List: array of QCharW;
  ACharLen: PInteger): Boolean;
var
  I, count: Integer;
  Lens: TIntArray;
begin
  count := High(List) + 1;
  Result := False;
  CalcCharLengthW(Lens, List);
  I := Low(List);
  while I < count do
  begin
    if c^ = List[I] then
    begin
      if Lens[I] = 2 then
      begin
        Result := c[1] = List[I + 1];
        if Assigned(ACharLen) and Result then
          ACharLen^ := 2;
        if Result then
          Break;
      end
      else
      begin
        Result := True;
        if Assigned(ACharLen) then
          ACharLen^ := 1;
        Break;
      end;
    end;
    Inc(I, Lens[I]);
  end;
end;

function CharInW(const c, List: PQCharW; ACharLen: PInteger): Boolean;
var
  p: PQCharW;
begin
  Result := False;
  p := List;
  while p^ <> #0 do
  begin
    if p^ = c^ then
    begin
      if (p[0] >= #$D800) and (p[0] <= #$DBFF) then
      begin
        // (p[1] >= #$DC00) and (p[1] <= #$DFFF)
        if p[1] = c[1] then
        begin
          Result := True;
          if ACharLen <> nil then
            ACharLen^ := 2;
          Break;
        end;
      end
      else
      begin
        Result := True;
        if ACharLen <> nil then
          ACharLen^ := 1;
        Break;
      end;
    end;
    Inc(p);
  end;
end;

procedure CalcCharLengthU(var Lens: TIntArray; const List: array of QCharA);
var
  I, l: Integer;
begin
  I := Low(List);
  System.SetLength(Lens, Length(List));
  while I <= High(List) do
  begin
    l := CharSizeU(@List[I]);
    Lens[I] := l;
    Inc(I, l);
  end;
end;

function CharInU(const c: PQCharA; const List: array of QCharA;
  ACharLen: PInteger): Boolean;
var
  I, count: Integer;
  Lens: TIntArray;
begin
  count := High(List) + 1;
  Result := False;
  CalcCharLengthU(Lens, List);
  I := Low(List);
  while I < count do
  begin
    if CompareMem(c, @List[I], Lens[I]) then
    begin
      if ACharLen <> nil then
        ACharLen^ := Lens[I];
      Result := True;
      Break;
    end
    else
      Inc(I, Lens[I]);
  end;
end;

function IsSpaceA(const c: PQCharA; ASpaceSize: PInteger): Boolean;
begin
  if c^ in [9, 10, 13, 32] then
  begin
    Result := True;
    if Assigned(ASpaceSize) then
      ASpaceSize^ := 1;
  end
  else if (c^ = 161) and (PQCharA(IntPtr(c) + 1)^ = 161) then
  begin
    Result := True;
    if Assigned(ASpaceSize) then
      ASpaceSize^ := 2;
  end
  else
    Result := False;
end;

function IsSpaceW(const c: PQCharW; ASpaceSize: PInteger): Boolean;
begin
  Result := (c^ = #9) or (c^ = #10) or (c^ = #13) or (c^ = #32) or
    (c^ = #$3000);
  if Result and Assigned(ASpaceSize) then
    ASpaceSize^ := 1;
end;

function IsSpaceU(const c: PQCharA; ASpaceSize: PInteger): Boolean;
begin
  // ȫ�ǿո�$3000��UTF-8������227,128,128
  if c^ in [9, 10, 13, 32] then
  begin
    Result := True;
    if Assigned(ASpaceSize) then
      ASpaceSize^ := 1;
  end
  else if (c^ = 227) and (PQCharA(IntPtr(c) + 1)^ = 128) and
    (PQCharA(IntPtr(c) + 2)^ = 128) then
  begin
    Result := True;
    if Assigned(ASpaceSize) then
      ASpaceSize^ := 3;
  end
  else
    Result := False;
end;

function CNFullToHalf(const S: QStringW): QStringW;
var
  p, pd: PWord;
  l: Integer;
begin
  l := Length(S);
  if l > 0 then
  begin
    System.SetLength(Result, l);
    p := PWord(PQCharW(S));
    pd := PWord(PQCharW(Result));
    while l > 0 do
    begin
      if (p^ = $3000) then // ȫ�ǿո�'��'
        pd^ := $20
      else if (p^ >= $FF01) and (p^ <= $FF5E) then
        pd^ := $21 + (p^ - $FF01)
      else
        pd^ := p^;
      Dec(l);
      Inc(p);
      Inc(pd);
    end;
  end
  else
    System.SetLength(Result, 0);
end;

function CNHalfToFull(const S: QStringW): QStringW;
var
  p, pd: PWord;
  l: Integer;
begin
  l := Length(S);
  if l > 0 then
  begin
    System.SetLength(Result, l);
    p := PWord(PQCharW(S));
    pd := PWord(PQCharW(Result));
    while l > 0 do
    begin
      if p^ = $20 then // ȫ�ǿո�'��'
        pd^ := $3000
      else if (p^ >= $21) and (p^ <= $7E) then
        pd^ := $FF01 + (p^ - $21)
      else
        pd^ := p^;
      Dec(l);
      Inc(p);
      Inc(pd);
    end;
  end
  else
    System.SetLength(Result, 0);
end;

function QuotedStrA(const S: QStringA; const AQuoter: QCharA): QStringA;
var
  p, pe, pd, pds: PQCharA;
begin
  p := PQCharA(S);
  Result.Length := S.Length shl 1;
  pe := p;
  Inc(pe, S.Length);
  pd := PQCharA(Result);
  pds := pd;
  pd^ := AQuoter;
  Inc(pd);
  while IntPtr(p) < IntPtr(pe) do
  begin
    if p^ = AQuoter then
    begin
      pd^ := AQuoter;
      Inc(pd);
      pd^ := AQuoter;
    end
    else
      pd^ := p^;
    Inc(pd);
    Inc(p);
  end;
  pd^ := AQuoter;
  Result.Length := IntPtr(pd) - IntPtr(pds) + 1;
end;

function QuotedStrW(const S: QStringW; const AQuoter: QCharW): QStringW;
var
  p, pe, pd, pds: PQCharW;
  l: Integer;
begin
  if AQuoter <> #0 then
  begin
    l := System.Length(S);
    p := PQCharW(S);
    SetLength(Result, (l + 1) shl 1);
    pe := p;
    Inc(pe, l);
    pd := PQCharW(Result);
    pds := pd;
    pd^ := AQuoter;
    Inc(pd);
    while IntPtr(p) < IntPtr(pe) do
    begin
      if p^ = AQuoter then
      begin
        pd^ := AQuoter;
        Inc(pd);
        pd^ := AQuoter;
      end
      else
        pd^ := p^;
      Inc(pd);
      Inc(p);
    end;
    pd^ := AQuoter;
    SetLength(Result, ((IntPtr(pd) - IntPtr(pds)) shr 1) + 1);
  end
  else
    Result := S;
end;

function SQLQuoted(const S: QStringW): QStringW;
begin
  Result := QuotedStrW(S);
end;

function DequotedStrA(const S: QStringA; const AQuoter: QCharA): QStringA;
var
  p, pe, pd, pds: PQCharA;
begin
  if (S.Length > 0) and (S[0] = AQuoter) and (S[S.Length - 1] = AQuoter) then
  begin
    p := PQCharA(S);
    pe := p;
    Inc(pe, S.Length);
    Inc(p);
    Result.Length := S.Length;
    pd := PQCharA(Result);
    pds := pd;
    while IntPtr(p) < IntPtr(pe) do
    begin
      if p^ = AQuoter then
      begin
        Inc(p);
        if p^ = AQuoter then
        begin
          pd^ := AQuoter;
        end
        else if IntPtr(p) < IntPtr(pe) then // ���治�ǵ�����,������ַ�����ֱ�ӿ�������
        begin
          pd^ := AQuoter;
          Inc(pd);
          pd^ := p^;
        end
        else
          Break;
      end
      else
        pd^ := p^;
      Inc(p);
      Inc(pd);
    end;
    Result.Length := IntPtr(pd) - IntPtr(pds);
  end
  else
    Result := S;
end;

function DequotedStrW(const S: QStringW; const AQuoter: QCharW): QStringW;
var
  p, pe, pd, pds: PQCharW;
begin
  if (Length(S) > 0) and (PQCharW(S)[0] = AQuoter) and
    (PQCharW(S)[Length(S) - 1] = AQuoter) then
  begin
    p := PQCharW(S);
    pe := p;
    Inc(pe, Length(S));
    Inc(p);
    SetLength(Result, Length(S));
    pd := PQCharW(Result);
    pds := pd;
    while IntPtr(p) < IntPtr(pe) do
    begin
      if p^ = AQuoter then
      begin
        Inc(p);
        if p^ = AQuoter then
        begin
          pd^ := AQuoter;
        end
        else if IntPtr(p) < IntPtr(pe) then // ���治�ǵ�����,������ַ�����ֱ�ӿ�������
        begin
          pd^ := AQuoter;
          Inc(pd);
          pd^ := p^;
        end
        else
          Break;
      end
      else
        pd^ := p^;
      Inc(p);
      Inc(pd);
    end;
    SetLength(Result, (IntPtr(pd) - IntPtr(pds)) shr 1);
  end
  else
    Result := S;
end;

function SkipCharA(var p: PQCharA; const List: array of QCharA): Integer;
var
  I, count: Integer;
  Lens: TIntArray;
  AFound: Boolean;
  ps: PQCharA;
begin
  count := High(List) + 1;
  Result := 0;
  if count > 0 then
  begin
    CalcCharLengthA(Lens, List);
    ps := p;
    while p^ <> 0 do
    begin
      I := Low(List);
      AFound := False;
      while I < count do
      begin
        if CompareMem(p, @List[I], Lens[I]) then
        begin
          AFound := True;
          Inc(p, Lens[I]);
          Break;
        end
        else
          Inc(I, Lens[I]);
      end;
      if not AFound then
      begin
        Result := IntPtr(p) - IntPtr(ps);
        Break;
      end;
    end;
  end;
end;

function SkipCharU(var p: PQCharA; const List: array of QCharA): Integer;
var
  I, count: Integer;
  Lens: TIntArray;
  AFound: Boolean;
  ps: PQCharA;
begin
  count := High(List) + 1;
  Result := 0;
  if count > 0 then
  begin
    CalcCharLengthU(Lens, List);
    ps := p;
    while p^ <> 0 do
    begin
      I := Low(List);
      AFound := False;
      while I < count do
      begin
        if CompareMem(p, @List[I], Lens[I]) then
        begin
          AFound := True;
          Inc(p, Lens[I]);
          Break;
        end
        else
          Inc(I, Lens[I]);
      end;
      if not AFound then
      begin
        Result := IntPtr(p) - IntPtr(ps);
        Break;
      end;
    end;
  end;
end;

function SkipCharW(var p: PQCharW; const List: array of QCharA): Integer;
var
  I, count: Integer;
  Lens: TIntArray;
  AFound: Boolean;
  ps: PQCharW;
begin
  count := High(List) + 1;
  Result := 0;
  if count > 0 then
  begin
    CalcCharLengthA(Lens, List);
    ps := p;
    while p^ <> #0 do
    begin
      I := Low(List);
      AFound := False;
      while I < count do
      begin
        if CompareMem(p, @List[I], Lens[I] shl 1) then
        begin
          AFound := True;
          Break;
        end
        else
          Inc(I, Lens[I]);
      end;
      if AFound then
        Inc(p)
      else
      begin
        Result := IntPtr(p) - IntPtr(ps);
        Break;
      end;
    end;
  end;
end;

function SkipCharW(var p: PQCharW; const List: PQCharW): Integer;
var
  l: Integer;
  ps: PQCharW;
begin
  Result := 0;
  if (List <> nil) and (List^ <> #0) then
  begin
    ps := p;
    while p^ <> #0 do
    begin
      if CharInW(p, List, @l) then
        Inc(p, l)
      else
      begin
        Result := IntPtr(p) - IntPtr(ps);
        Break;
      end;
    end;
  end;
end;

function SkipSpaceA(var p: PQCharA): Integer;
var
  ps: PQCharA;
  l: Integer;
begin
  ps := p;
  while p^ <> 0 do
  begin
    if IsSpaceA(p, @l) then
      Inc(p, l)
    else
      Break;
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;

function SkipSpaceU(var p: PQCharA): Integer;
var
  ps: PQCharA;
  l: Integer;
begin
  ps := p;
  while p^ <> 0 do
  begin
    if IsSpaceU(p, @l) then
      Inc(p, l)
    else
      Break;
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;

function SkipSpaceW(var p: PQCharW): Integer;
var
  ps: PQCharW;
  l: Integer;
begin
  ps := p;
  while p^ <> #0 do
  begin
    if IsSpaceW(p, @l) then
      Inc(p, l)
    else
      Break;
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;

// ����һ��,��#10Ϊ�н�β
function SkipLineA(var p: PQCharA): Integer;
var
  ps: PQCharA;
begin
  ps := p;
  while p^ <> 0 do
  begin
    if p^ = 10 then
    begin
      Inc(p);
      Break;
    end
    else
      Inc(p);
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;

function SkipLineU(var p: PQCharA): Integer;
begin
  Result := SkipLineA(p);
end;

function SkipLineW(var p: PQCharW): Integer;
var
  ps: PQCharW;
begin
  ps := p;
  while p^ <> #0 do
  begin
    if p^ = #10 then
    begin
      Inc(p);
      Break;
    end
    else
      Inc(p);
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;

function StrPosA(Start, Current: PQCharA; var ACol, ARow: Integer): PQCharA;
begin
  ACol := 1;
  ARow := 1;
  Result := Start;
  while IntPtr(Start) < IntPtr(Current) do
  begin
    if Start^ = 10 then
    begin
      Inc(ARow);
      ACol := 1;
      Inc(Start);
      Result := Start;
    end
    else
    begin
      Inc(Start, CharSizeA(Start));
      Inc(ACol);
    end;
  end;
end;

function StrPosU(Start, Current: PQCharA; var ACol, ARow: Integer): PQCharA;
begin
  ACol := 1;
  ARow := 1;
  Result := Start;
  while IntPtr(Start) < IntPtr(Current) do
  begin
    if Start^ = 10 then
    begin
      Inc(ARow);
      ACol := 1;
      Inc(Start);
      Result := Start;
    end
    else
    begin
      Inc(Start, CharSizeU(Start));
      Inc(ACol);
    end;
  end;
end;

function StrPosW(Start, Current: PQCharW; var ACol, ARow: Integer): PQCharW;
begin
  ACol := 1;
  ARow := 1;
  Result := Start;
  while Start < Current do
  begin
    if Start^ = #10 then
    begin
      Inc(ARow);
      ACol := 1;
      Inc(Start);
      Result := Start;
    end
    else
    begin
      Inc(Start, CharSizeW(Start));
      Inc(ACol);
    end;
  end;
end;

function DecodeTokenA(var p: PQCharA; ADelimiters: array of QCharA;
  AQuoter: QCharA; AIgnoreSpace: Boolean): QStringA;
var
  S: PQCharA;
  l: Integer;
begin
  if AIgnoreSpace then
    SkipSpaceA(p);
  S := p;
  while p^ <> 0 do
  begin
    if p^ = AQuoter then // ���õ����ݲ����
    begin
      Inc(p);
      while p^ <> 0 do
      begin
        if p^ = $5C then
        begin
          Inc(p);
          if p^ <> 0 then
            Inc(p);
        end
        else if p^ = AQuoter then
        begin
          Inc(p);
          if p^ = AQuoter then
            Inc(p)
          else
            Break;
        end
        else
          Inc(p);
      end;
    end
    else if CharInA(p, ADelimiters, @l) then
      Break
    else // \",\',"",''�ֱ����ת��
      Inc(p);
  end;
  l := IntPtr(p) - IntPtr(S);
  Result.Length := l;
  Move(S^, PQCharA(Result)^, l);
  while CharInA(p, ADelimiters, @l) do
    Inc(p, l);
end;

function DecodeTokenU(var p: PQCharA; ADelimiters: array of QCharA;
  AQuoter: QCharA; AIgnoreSpace: Boolean): QStringA;
var
  S: PQCharA;
  l: Integer;
begin
  if AIgnoreSpace then
    SkipSpaceU(p);
  S := p;
  while p^ <> 0 do
  begin
    if p^ = AQuoter then // ���õ����ݲ����
    begin
      Inc(p);
      while p^ <> 0 do
      begin
        if p^ = $5C then
        begin
          Inc(p);
          if p^ <> 0 then
            Inc(p);
        end
        else if p^ = AQuoter then
        begin
          Inc(p);
          if p^ = AQuoter then
            Inc(p)
          else
            Break;
        end
        else
          Inc(p);
      end;
    end
    else if CharInU(p, ADelimiters, @l) then
      Break
    else // \",\',"",''�ֱ����ת��
      Inc(p);
  end;
  l := IntPtr(p) - IntPtr(S);
  Result.Length := l;
  Move(S^, PQCharA(Result)^, l);
  while CharInU(p, ADelimiters, @l) do
    Inc(p, l);
end;

function DecodeTokenW(var p: PQCharW; ADelimiters: array of QCharW;
  AQuoter: QCharW; AIgnoreSpace: Boolean; ASkipDelimiters: Boolean): QStringW;
var
  S: PQCharW;
  l: Integer;
begin
  if AIgnoreSpace then
    SkipSpaceW(p);
  S := p;
  while p^ <> #0 do
  begin
    if p^ = AQuoter then // ���õ����ݲ����
    begin
      Inc(p);
      while p^ <> #0 do
      begin
        if p^ = #$5C then
        begin
          Inc(p);
          if p^ <> #0 then
            Inc(p);
        end
        else if p^ = AQuoter then
        begin
          Inc(p);
          if p^ = AQuoter then
            Inc(p)
          else
            Break;
        end
        else
          Inc(p);
      end;
    end
    else if CharInW(p, ADelimiters, @l) then
      Break
    else // \",\',"",''�ֱ����ת��
      Inc(p);
  end;
  l := p - S;
  SetLength(Result, l);
  Move(S^, PQCharW(Result)^, l shl 1);
  if ASkipDelimiters then
  begin
    while CharInW(p, ADelimiters, @l) do
      Inc(p, l);
  end;
  if AIgnoreSpace then
    SkipSpaceW(p);
end;

function DecodeTokenW(var p: PQCharW; ADelimiters: PQCharW; AQuoter: QCharW;
  AIgnoreSpace: Boolean; ASkipDelimiters: Boolean): QStringW;
var
  S: PQCharW;
  l: Integer;
begin
  if AIgnoreSpace then
    SkipSpaceW(p);
  S := p;
  while p^ <> #0 do
  begin
    if p^ = AQuoter then // ���õ����ݲ����
    begin
      Inc(p);
      while p^ <> #0 do
      begin
        if p^ = #$5C then
        begin
          Inc(p);
          if p^ <> #0 then
            Inc(p);
        end
        else if p^ = AQuoter then
        begin
          Inc(p);
          if p^ = AQuoter then
            Inc(p)
          else
            Break;
        end
        else
          Inc(p);
      end;
    end
    else if CharInW(p, ADelimiters, @l) then
      Break
    else // \",\',"",''�ֱ����ת��
      Inc(p);
  end;
  l := p - S;
  SetLength(Result, l);
  Move(S^, PQCharW(Result)^, l shl 1);
  if ASkipDelimiters then
  begin
    while CharInW(p, ADelimiters, @l) do
      Inc(p, l);
  end;
  if AIgnoreSpace then
    SkipSpaceW(p);
end;

function DecodeTokenW(var S: QStringW; ADelimiters: PQCharW; AQuoter: QCharW;
  AIgnoreCase, ARemove, ASkipDelimiters: Boolean): QStringW;
var
  p: PQCharW;
begin
  p := PQCharW(S);
  Result := DecodeTokenW(p, ADelimiters, AQuoter, AIgnoreCase);
  if ARemove then
    S := StrDupX(p, Length(S) - (p - PQCharW(S)));
end;

function SplitTokenW(AList: TStrings; p: PQCharW; ADelimiters: PQCharW;
  AQuoter: QCharW; AIgnoreSpace: Boolean): Integer;
begin
  Result := 0;
  AList.BeginUpdate;
  try
    while p^ <> #0 do
    begin
      AList.Add(DecodeTokenW(p, ADelimiters, AQuoter, AIgnoreSpace, True));
      Inc(Result);
    end;
  finally
    AList.EndUpdate;
  end;
end;

function SplitTokenW(AList: TStrings; const S: QStringW; ADelimiters: PQCharW;
  AQuoter: QCharW; AIgnoreSpace: Boolean): Integer;
begin
  Result := SplitTokenW(AList, PQCharW(S), ADelimiters, AQuoter, AIgnoreSpace);
end;

function UpperFirstW(const S: QStringW): QStringW;
var
  p, pd: PQCharW;
begin
  if Length(S) > 0 then
  begin
    p := PQCharW(S);
    SetLength(Result, Length(S));
    pd := PQCharW(Result);
    pd^ := CharUpperW(p^);
    Inc(p);
    Inc(pd);
    while p^ <> #0 do
    begin
      pd^ := CharLowerW(p^);
      Inc(p);
      Inc(pd);
    end;
  end
  else
    Result := S;
end;

function DecodeLineA(var p: PQCharA; ASkipEmpty: Boolean; AMaxSize: Integer)
  : QStringA;
var
  ps: PQCharA;
begin
  ps := p;
  while p^ <> 0 do
  begin
    if ((p^ = 13) and (PQCharA(IntPtr(p) + 1)^ = 10)) or (p^ = 10) then
    begin
      if ps = p then
      begin
        if ASkipEmpty then
        begin
          if p^ = 13 then
            Inc(p, 2)
          else
            Inc(p);
          ps := p;
        end
        else
        begin
          Result.Length := 0;
          Exit;
        end;
      end
      else
      begin
        Result.Length := IntPtr(p) - IntPtr(ps);
        Move(ps^, PQCharA(Result)^, IntPtr(p) - IntPtr(ps));
        if p^ = 13 then
          Inc(p, 2)
        else
          Inc(p);
        Exit;
      end;
    end
    else
      Inc(p);
  end;
  if ps = p then
    Result.Length := 0
  else
  begin
    Result.Length := IntPtr(p) - IntPtr(ps);
    Move(ps^, PQCharA(Result)^, IntPtr(p) - IntPtr(ps));
  end;
  if Result.Length > AMaxSize then
  begin
    Move(Result.FValue[Result.Length - AMaxSize + 3], Result.FValue[4],
      AMaxSize - 3);
    Result.FValue[1] := $2E; // ...
    Result.FValue[2] := $2E;
    Result.FValue[3] := $2E;
  end;
end;

function DecodeLineU(var p: PQCharA; ASkipEmpty: Boolean; AMaxSize: Integer)
  : QStringA;
begin
  Result := DecodeLineA(p, ASkipEmpty, MaxInt);
  if Result.Length > 0 then
  begin
    Result.FValue[0] := 1;
    if Result.Length > AMaxSize then
    begin
      Move(Result.FValue[Result.Length - AMaxSize + 3], Result.FValue[4],
        AMaxSize - 3);
      Result.FValue[1] := $2E; // ...
      Result.FValue[2] := $2E;
      Result.FValue[3] := $2E;
    end;
  end;
end;

function DecodeLineW(var p: PQCharW; ASkipEmpty: Boolean; AMaxSize: Integer)
  : QStringW;
var
  ps: PQCharW;
begin
  ps := p;
  while p^ <> #0 do
  begin
    if ((p[0] = #13) and (p[1] = #10)) or (p[0] = #10) then
    begin
      if ps = p then
      begin
        if ASkipEmpty then
        begin
          if p^ = #13 then
            Inc(p, 2)
          else
            Inc(p);
          ps := p;
        end
        else
        begin
          SetLength(Result, 0);
          Exit;
        end;
      end
      else
      begin
        SetLength(Result, p - ps);
        Move(ps^, PQCharW(Result)^, IntPtr(p) - IntPtr(ps));
        if p^ = #13 then
          Inc(p, 2)
        else
          Inc(p);
        Exit;
      end;
    end
    else
      Inc(p);
  end;
  if ps = p then
    SetLength(Result, 0)
  else
  begin
    SetLength(Result, p - ps);
    Move(ps^, PQCharW(Result)^, IntPtr(p) - IntPtr(ps));
  end;
  if Length(Result) > AMaxSize then
    Result := '...' + RightStrW(Result, AMaxSize - 3, True);
end;

function LeftStrW(const S: QStringW; AMaxCount: Integer; ACheckExt: Boolean)
  : QStringW;
var
  ps, p: PQCharW;
  l: Integer;
begin
  l := Length(S);
  if AMaxCount > l then
    Result := S
  else if AMaxCount > 0 then
  begin
    ps := PQCharW(S);
    if ACheckExt then
    begin
      p := ps;
      while (p^ <> #0) and (AMaxCount > 0) do
      begin
        if (p^ >= #$D800) and (p^ <= #$DBFF) then
        begin
          Inc(p);
          if (p^ >= #$DC00) and (p^ <= #$DFFF) then
            Inc(p);
          // else ��Ч����չ���ַ�����Ȼѭ������
        end
        else
          Inc(p);
        Dec(AMaxCount);
      end;
      l := p - ps;
      SetLength(Result, l);
      Move(ps^, PQCharW(Result)^, l shl 1);
    end
    else
    begin
      SetLength(Result, AMaxCount);
      Move(ps^, PQCharW(Result)^, AMaxCount shl 1);
    end;
  end
  else
    SetLength(Result, 0);
end;

function RightStrW(const S: QStringW; AMaxCount: Integer; ACheckExt: Boolean)
  : QStringW;
var
  ps, p: PQCharW;
  l: Integer;
begin
  l := Length(S);
  if AMaxCount > l then
    Result := S
  else if AMaxCount > 0 then
  begin
    ps := PQCharW(S);
    if ACheckExt then
    begin
      p := ps + l - 1;
      while (p > ps) and (AMaxCount > 0) do
      begin
        if (p^ >= #$DC00) and (p^ <= #$DFFF) then
        begin
          Dec(p);
          if (p^ >= #$D800) and (p^ <= #$DBFF) then
            Dec(p)
            // else ��Ч����չ���ַ�����Ȼѭ������
        end
        else
          Dec(p);
        Dec(AMaxCount);
      end;
      Inc(p);
      l := l - (p - ps);
      SetLength(Result, l);
      Move(p^, PQCharW(Result)^, l shl 1);
    end
    else
    begin
      Inc(ps, l - AMaxCount);
      SetLength(Result, AMaxCount);
      Move(ps^, PQCharW(Result)^, AMaxCount shl 1);
    end;
  end
  else
    SetLength(Result, 0);
end;

function StrBetween(var S: PQCharW; AStartTag, AEndTag: QStringW;
  AIgnoreCase: Boolean): QStringW;
var
  ps, pe: PQCharW;
  l: Integer;
begin
  if AIgnoreCase then
  begin
    ps := StrIStrW(S, PQCharW(AStartTag));
    if ps <> nil then
    begin
      Inc(ps, Length(AStartTag));
      pe := StrIStrW(ps, PQCharW(AEndTag));
      if pe <> nil then
      begin
        l := pe - ps;
        SetLength(Result, l);
        Move(ps^, PQCharW(Result)^, l shl 1);
        Inc(pe, Length(AEndTag));
        S := pe;
      end
      else
        SetLength(Result, 0);
    end
    else
      SetLength(Result, 0);
  end
  else
  begin
    ps := StrStrW(S, PQCharW(AStartTag));
    if ps <> nil then
    begin
      Inc(ps, Length(AStartTag));
      pe := StrStrW(ps, PQCharW(AEndTag));
      if pe <> nil then
      begin
        l := pe - ps;
        SetLength(Result, l);
        Move(ps, PQCharW(Result)^, l shl 1);
        Inc(pe, Length(AEndTag));
        S := pe;
      end
      else
        SetLength(Result, 0);
    end
    else
      SetLength(Result, 0);
  end;
end;

function TokenWithIndex(var S: PQCharW; AIndex: Integer; ADelimiters: PQCharW;
  AQuoter: QCharW; AIgnoreSapce: Boolean): QStringW;
begin
  while (AIndex >= 0) and (S^ <> #0) do
  begin
    if AIndex <> 0 then
      DecodeTokenW(S, ADelimiters, AQuoter, AIgnoreSapce)
    else
    begin
      Result := DecodeTokenW(S, ADelimiters, AQuoter, AIgnoreSapce);
      Break;
    end;
    Dec(AIndex);
  end;
end;

function SkipUntilA(var p: PQCharA; AExpects: array of QCharA;
  AQuoter: QCharA): Integer;
var
  ps: PQCharA;
begin
  ps := p;
  while p^ <> 0 do
  begin
    if (p^ = AQuoter) then
    begin
      Inc(p);
      while p^ <> 0 do
      begin
        if p^ = $5C then
        begin
          Inc(p);
          if p^ <> 0 then
            Inc(p);
        end
        else if p^ = AQuoter then
        begin
          Inc(p);
          if p^ = AQuoter then
            Inc(p)
          else
            Break;
        end
        else
          Inc(p);
      end;
    end
    else if CharInA(p, AExpects) then
      Break
    else
      Inc(p, CharSizeA(p));
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;

function SkipUntilU(var p: PQCharA; AExpects: array of QCharA;
  AQuoter: QCharA): Integer;
var
  ps: PQCharA;
begin
  ps := p;
  while p^ <> 0 do
  begin
    if (p^ = AQuoter) then
    begin
      Inc(p);
      while p^ <> 0 do
      begin
        if p^ = $5C then
        begin
          Inc(p);
          if p^ <> 0 then
            Inc(p);
        end
        else if p^ = AQuoter then
        begin
          Inc(p);
          if p^ = AQuoter then
            Inc(p)
          else
            Break;
        end
        else
          Inc(p);
      end;
    end
    else if CharInU(p, AExpects) then
      Break
    else
      Inc(p, CharSizeU(p));
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;

function SkipUntilW(var p: PQCharW; AExpects: array of QCharW;
  AQuoter: QCharW): Integer;
var
  ps: PQCharW;
begin
  ps := p;
  while p^ <> #0 do
  begin
    if (p^ = AQuoter) then
    begin
      Inc(p);
      while p^ <> #0 do
      begin
        if p^ = #$5C then
        begin
          Inc(p);
          if p^ <> #0 then
            Inc(p);
        end
        else if p^ = AQuoter then
        begin
          Inc(p);
          if p^ = AQuoter then
            Inc(p)
          else
            Break;
        end
        else
          Inc(p);
      end;
    end
    else if CharInW(p, AExpects) then
      Break
    else
      Inc(p, CharSizeW(p));
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;

function SkipUntilW(var p: PQCharW; AExpects: PQCharW; AQuoter: QCharW)
  : Integer;
var
  ps: PQCharW;
begin
  ps := p;
  while p^ <> #0 do
  begin
    if (p^ = AQuoter) then
    begin
      Inc(p);
      while p^ <> #0 do
      begin
        if p^ = #$5C then
        begin
          Inc(p);
          if p^ <> #0 then
            Inc(p);
        end
        else if p^ = AQuoter then
        begin
          Inc(p);
          if p^ = AQuoter then
            Inc(p)
          else
            Break;
        end
        else
          Inc(p);
      end;
    end
    else if CharInW(p, AExpects) then
      Break
    else
      Inc(p, CharSizeW(p));
  end;
  Result := (IntPtr(p) - IntPtr(ps)) shr 1;
end;

function CharUpperA(c: QCharA): QCharA;
begin
  if (c >= $61) and (c <= $7A) then
    Result := c xor $20
  else
    Result := c;
end;

function CharUpperW(c: QCharW): QCharW;
begin
  if (c >= #$61) and (c <= #$7A) then
    Result := QCharW(PWord(@c)^ xor $20)
  else
    Result := c;
end;

function CharLowerA(c: QCharA): QCharA;
begin
  if (c >= Ord('A')) and (c <= Ord('Z')) then
    Result := Ord('a') + Ord(c) - Ord('A')
  else
    Result := c;
end;

function CharLowerW(c: QCharW): QCharW;
begin
  if (c >= 'A') and (c <= 'Z') then
    Result := QCharW(Ord('a') + Ord(c) - Ord('A'))
  else
    Result := c;
end;

function StartWithA(S, startby: PQCharA; AIgnoreCase: Boolean): Boolean;
begin
  while (S^ <> 0) and (startby^ <> 0) do
  begin
    if AIgnoreCase then
    begin
      if CharUpperA(S^) <> CharUpperA(startby^) then
        Break;
    end
    else if S^ <> startby^ then
      Break;
    Inc(S);
    Inc(startby);
  end;
  Result := (startby^ = 0);
end;

function StartWithU(S, startby: PQCharA; AIgnoreCase: Boolean): Boolean;
begin
  Result := StartWithA(S, startby, AIgnoreCase);
end;

function StartWithW(S, startby: PQCharW; AIgnoreCase: Boolean): Boolean;
begin
  if AIgnoreCase then
  begin
    while (S^ <> #0) and (startby^ <> #0) do
    begin
      if CharUpperW(S^) <> CharUpperW(startby^) then
        Break;
      Inc(S);
      Inc(startby);
    end;
  end
  else
  begin
    while (S^ <> #0) and (S^ = startby^) do
    begin
      Inc(S);
      Inc(startby);
    end;
  end;
  Result := (startby^ = #0);
end;

function EndWithA(const S, endby: QStringA; AIgnoreCase: Boolean): Boolean;
var
  p: PQCharA;
begin
  if S.Length < endby.Length then
    Result := False
  else
  begin
    p := PQCharA(S);
    Inc(p, S.Length - endby.Length);
    if AIgnoreCase then
      Result := (StrIStrA(p, PQCharA(endby)) = p)
    else
      Result := (StrStrA(p, PQCharA(endby)) = p);
  end;
end;

function EndWithU(const S, endby: QStringA; AIgnoreCase: Boolean): Boolean;
begin
  Result := EndWithA(S, endby, AIgnoreCase);
end;

function EndWithW(const S, endby: QStringW; AIgnoreCase: Boolean): Boolean;
var
  p: PQCharW;
begin
  if System.Length(S) < System.Length(endby) then
    Result := False
  else
  begin
    p := PQCharW(S);
    Inc(p, System.Length(S) - System.Length(endby));
    if AIgnoreCase then
      Result := (StrIStrW(p, PQCharW(endby)) = p)
    else
      Result := (StrStrW(p, PQCharW(endby)) = p);
  end;
end;

function SameCharsA(s1, s2: PQCharA; AIgnoreCase: Boolean): Integer;
begin
  Result := 0;
  if (s1 <> nil) and (s2 <> nil) then
  begin
    if AIgnoreCase then
    begin
      while (s1^ <> 0) and (s2^ <> 0) and
        ((s1^ = s2^) or (CharUpperA(s1^) = CharUpperA(s2^))) do
        Inc(Result);
    end
    else
    begin
      while (s1^ <> 0) and (s2^ <> 0) and (s1^ = s2^) do
        Inc(Result);
    end;
  end;
end;

function SameCharsU(s1, s2: PQCharA; AIgnoreCase: Boolean): Integer;
  function CompareSubSeq: Boolean;
  var
    ACharSize1, ACharSize2: Integer;
  begin
    ACharSize1 := CharSizeU(s1) - 1;
    ACharSize2 := CharSizeU(s2) - 1;
    Result := ACharSize1 = ACharSize2;
    if Result then
    begin
      Inc(s1);
      Inc(s2);
      while (ACharSize1 > 0) and (s1^ = s2^) do
      begin
        Inc(s1);
        Inc(s2);
      end;
      Result := (ACharSize1 = 0);
    end;
  end;

begin
  Result := 0;
  if (s1 <> nil) and (s2 <> nil) then
  begin
    if AIgnoreCase then
    begin
      while (s1^ <> 0) and (s2^ <> 0) and
        ((s1^ = s2^) or (CharUpperA(s1^) = CharUpperA(s2^))) do
      begin
        if CompareSubSeq then
          Inc(Result)
        else
          Break;
      end;
    end
    else
    begin
      while (s1^ <> 0) and (s2^ <> 0) and (s1^ = s2^) do
      begin
        if CompareSubSeq then
          Inc(Result)
        else
          Break;
      end;
    end;
  end;
end;

function SameCharsW(s1, s2: PQCharW; AIgnoreCase: Boolean): Integer;
begin
  Result := 0;
  if (s1 <> nil) and (s2 <> nil) then
  begin
    if AIgnoreCase then
    begin
      while (s1^ <> #0) and (s2^ <> #0) and
        ((s1^ = s2^) or (CharUpperW(s1^) = CharUpperW(s2^))) do
        Inc(Result);
    end
    else
    begin
      while (s1^ <> #0) and (s2^ <> #0) and (s1^ = s2^) do
        Inc(Result);
    end;
  end;
end;

function DetectTextEncoding(const p: Pointer; l: Integer; var b: Boolean)
  : TTextEncoding;
var
  pAnsi: PByte;
  pWide: PWideChar;
  I, AUtf8CharSize: Integer;
const
  NoUtf8Char: array [0 .. 3] of Byte = ($C1, $AA, $CD, $A8); // ANSI�������ͨ
  function IsUtf8Order(var ACharSize: Integer): Boolean;
  var
    I: Integer;
    ps: PByte;
  const
    Utf8Masks: array [0 .. 4] of Byte = ($C0, $E0, $F0, $F8, $FC);
  begin
    ps := pAnsi;
    ACharSize := CharSizeU(PQCharA(ps));
    Result := False;
    if ACharSize > 1 then
    begin
      I := ACharSize - 2;
      if ((Utf8Masks[I] and ps^) = Utf8Masks[I]) then
      begin
        Inc(ps);
        Result := True;
        for I := 1 to ACharSize - 1 do
        begin
          if (ps^ and $80) <> $80 then
          begin
            Result := False;
            Break;
          end;
          Inc(ps);
        end;
      end;
    end;
  end;

begin
  Result := teAnsi;
  b := False;
  if l >= 2 then
  begin
    pAnsi := PByte(p);
    pWide := PWideChar(p);
    b := True;
    if pWide^ = #$FEFF then
      Result := teUnicode16LE
    else if pWide^ = #$FFFE then
      Result := teUnicode16BE
    else if l >= 3 then
    begin
      if (pAnsi^ = $EF) and (PByte(IntPtr(pAnsi) + 1)^ = $BB) and
        (PByte(IntPtr(pAnsi) + 2)^ = $BF) then // UTF-8����
        Result := teUTF8
      else // ����ַ����Ƿ��з���UFT-8���������ַ���11...
      begin
        b := False;
        Result := teUnknown; // ����ΪUTF8���룬Ȼ�����Ƿ��в�����UTF-8���������
        I := 0;
        Dec(l, 2);
        while I <= l do
        begin
          if (pAnsi^ and $80) <> 0 then // ��λΪ1
          begin
            if (l - I >= 4) then
            begin
              if CompareMem(pAnsi, @NoUtf8Char[0], 4) then
              // ��ͨ��������Ե�������UTF-8������ж�����
              begin
                Inc(pAnsi, 4);
                Inc(I, 4);
                Result := teAnsi;
                continue;
              end;
            end;
            if IsUtf8Order(AUtf8CharSize) then
            begin
              Inc(pAnsi, AUtf8CharSize);
              Result := teUTF8;
              Break;
            end
            else
            begin
              Result := teAnsi;
              Break;
            end;
          end
          else
          begin
            if pAnsi^ = 0 then // 00 xx (xx<128) ��λ��ǰ����BE����
            begin
              if PByte(IntPtr(pAnsi) + 1)^ < 128 then
              begin
                Result := teUnicode16BE;
                Break;
              end;
            end
            else if PByte(IntPtr(pAnsi) + 1)^ = 0 then // xx 00 ��λ��ǰ����LE����
            begin
              Result := teUnicode16LE;
              Break;
            end;
            Inc(pAnsi);
            Inc(I);
          end;
          if Result = teUnknown then
            Result := teAnsi;
        end;
      end;
    end;
  end;
end;

function LoadTextA(AFileName: String; AEncoding: TTextEncoding): QStringA;
var
  AStream: TStream;
begin
  AStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := LoadTextA(AStream, AEncoding);
  finally
    AStream.Free;
  end;
end;

procedure ExchangeByteOrder(p: PQCharA; l: Integer);
var
  pe: PQCharA;
  c: QCharA;
begin
  pe := p;
  Inc(pe, l);
  while IntPtr(p) < IntPtr(pe) do
  begin
    c := p^;
    p^ := PQCharA(IntPtr(p) + 1)^;
    PQCharA(IntPtr(p) + 1)^ := c;
    Inc(p, 2);
  end;
end;

function ExchangeByteOrder(V: Smallint): Smallint;
var
  pv: array [0 .. 1] of Byte absolute V;
  pd: array [0 .. 1] of Byte absolute Result;
begin
  pd[0] := pv[1];
  pd[1] := pv[0];
end;

function ExchangeByteOrder(V: Word): Word;
var
  pv: array [0 .. 1] of Byte absolute V;
  pd: array [0 .. 1] of Byte absolute Result;
begin
  pd[0] := pv[1];
  pd[1] := pv[0];
end;

function ExchangeByteOrder(V: Integer): Integer;
var
  pv: array [0 .. 3] of Byte absolute V;
  pd: array [0 .. 3] of Byte absolute Result;
begin
  pd[0] := pv[3];
  pd[1] := pv[2];
  pd[2] := pv[1];
  pd[3] := pv[0];
end;

function ExchangeByteOrder(V: Cardinal): Cardinal;
var
  pv: array [0 .. 3] of Byte absolute V;
  pd: array [0 .. 3] of Byte absolute Result;
begin
  pd[0] := pv[3];
  pd[1] := pv[2];
  pd[2] := pv[1];
  pd[3] := pv[0];
end;

function ExchangeByteOrder(V: Int64): Int64;
var
  pv: array [0 .. 7] of Byte absolute V;
  pd: array [0 .. 7] of Byte absolute Result;
begin
  pd[0] := pv[7];
  pd[1] := pv[6];
  pd[2] := pv[5];
  pd[3] := pv[4];
  pd[4] := pv[3];
  pd[5] := pv[2];
  pd[6] := pv[1];
  pd[7] := pv[0];
end;

function ExchangeByteOrder(V: Single): Single;
var
  pv: array [0 .. 3] of Byte absolute V;
  pd: array [0 .. 3] of Byte absolute Result;
begin
  pd[0] := pv[3];
  pd[1] := pv[2];
  pd[2] := pv[1];
  pd[3] := pv[0];
end;

function ExchangeByteOrder(V: Double): Double;
var
  pv: array [0 .. 7] of Byte absolute V;
  pd: array [0 .. 7] of Byte absolute Result;
begin
  pd[0] := pv[7];
  pd[1] := pv[6];
  pd[2] := pv[5];
  pd[3] := pv[4];
  pd[4] := pv[3];
  pd[5] := pv[2];
  pd[6] := pv[1];
  pd[7] := pv[0];
end;

function LoadTextA(AStream: TStream; AEncoding: TTextEncoding): QStringA;
var
  ASize: Integer;
  ABuffer: TBytes;
  ABomExists: Boolean;
begin
  ASize := AStream.Size - AStream.Position;
  if ASize > 0 then
  begin
    SetLength(ABuffer, ASize);
    AStream.ReadBuffer((@ABuffer[0])^, ASize);
    if AEncoding in [teUnknown, teAuto] then
      AEncoding := DetectTextEncoding(@ABuffer[0], ASize, ABomExists)
    else if ASize >= 2 then
    begin
      case AEncoding of
        teUnicode16LE:
          ABomExists := (ABuffer[0] = $FF) and (ABuffer[1] = $FE);
        teUnicode16BE:
          ABomExists := (ABuffer[1] = $FE) and (ABuffer[1] = $FF);
        teUTF8:
          begin
            if ASize >= 3 then
              ABomExists := (ABuffer[0] = $EF) and (ABuffer[1] = $BB) and
                (ABuffer[2] = $BF)
            else
              ABomExists := False;
          end;
      end;
    end
    else
      ABomExists := False;
    if AEncoding = teAnsi then
      Result := ABuffer
    else if AEncoding = teUTF8 then
    begin
      if ABomExists then
      begin
        if ASize > 3 then
          Result := AnsiEncode(Utf8Decode(@ABuffer[3], ASize - 3))
        else
          Result.Length := 0;
      end
      else
        Result := AnsiEncode(Utf8Decode(@ABuffer[0], ASize));
    end
    else
    begin
      if AEncoding = teUnicode16BE then
        ExchangeByteOrder(@ABuffer[0], ASize);
      if ABomExists then
        Result := AnsiEncode(PQCharW(@ABuffer[2]), (ASize - 2) shr 1)
      else
        Result := AnsiEncode(PQCharW(@ABuffer[0]), ASize shr 1);
    end;
  end
  else
    Result.Length := 0;
end;

function LoadTextU(AFileName: String; AEncoding: TTextEncoding): QStringA;
var
  AStream: TStream;
begin
  AStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := LoadTextU(AStream, AEncoding);
  finally
    AStream.Free;
  end;
end;

function LoadTextU(AStream: TStream; AEncoding: TTextEncoding): QStringA;
var
  ASize: Integer;
  ABuffer: TBytes;
  ABomExists: Boolean;
begin
  ASize := AStream.Size - AStream.Position;
  if ASize > 0 then
  begin
    SetLength(ABuffer, ASize);
    AStream.ReadBuffer((@ABuffer[0])^, ASize);
    if AEncoding in [teUnknown, teAuto] then
      AEncoding := DetectTextEncoding(@ABuffer[0], ASize, ABomExists)
    else if ASize >= 2 then
    begin
      case AEncoding of
        teUnicode16LE:
          ABomExists := (ABuffer[0] = $FF) and (ABuffer[1] = $FE);
        teUnicode16BE:
          ABomExists := (ABuffer[1] = $FE) and (ABuffer[1] = $FF);
        teUTF8:
          begin
            if ASize > 3 then
              ABomExists := (ABuffer[0] = $EF) and (ABuffer[1] = $BB) and
                (ABuffer[2] = $BF)
            else
              ABomExists := False;
          end;
      end;
    end
    else
      ABomExists := False;
    if AEncoding = teAnsi then
      Result := qstring.Utf8Encode(AnsiDecode(@ABuffer[0], ASize))
    else if AEncoding = teUTF8 then
    begin
      if ABomExists then
      begin
        Dec(ASize, 3);
        Result.From(@ABuffer[0], 3, ASize);
      end
      else
        Result := ABuffer;
      if ASize > 0 then
        Result.FValue[0] := 1; // UTF-8
    end
    else
    begin
      if AEncoding = teUnicode16BE then
        ExchangeByteOrder(@ABuffer[0], ASize);
      if ABomExists then
        Result := qstring.Utf8Encode(PQCharW(@ABuffer[2]), (ASize - 2) shr 1)
      else
        Result := qstring.Utf8Encode(PQCharW(@ABuffer[0]), ASize shr 1);
    end;
  end
  else
  begin
    Result.Length := 0;
    Result.FValue[0] := 1;
  end;
end;

function LoadTextW(AFileName: String; AEncoding: TTextEncoding): QStringW;
var
  AStream: TStream;
begin
  AStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := LoadTextW(AStream, AEncoding);
  finally
    AStream.Free;
  end;
end;

function DecodeText(p: Pointer; ASize: Integer; AEncoding: TTextEncoding)
  : QStringW;
var
  ABomExists: Boolean;
  pb: PByte;
  pe: PQCharA;
  function ByteOf(AOffset: Integer): Byte;
  begin
    Result := PByte(IntPtr(pb) + AOffset)^;
  end;

begin
  pb := p;
  if ASize >= 2 then
  begin
    // �����Ƿ�ָ�����룬ǿ�Ƽ��BOMͷ���������ڱ���ָ�������������
    if (ByteOf(0) = $FF) and (ByteOf(1) = $FE) then
    begin
      AEncoding := teUnicode16LE;
      Inc(pb, 2);
      Dec(ASize, 2);
    end
    else if (ByteOf(0) = $FE) and (ByteOf(1) = $FF) then
    begin
      AEncoding := teUnicode16BE;
      Inc(pb, 2);
      Dec(ASize, 2);
    end
    else if (ASize > 2) and (ByteOf(0) = $EF) and (ByteOf(1) = $BB) and
      (ByteOf(2) = $BF) then
    begin
      AEncoding := teUTF8;
      Inc(pb, 3);
      Dec(ASize, 3);
    end
    else if AEncoding in [teUnknown, teAuto] then // No BOM
      AEncoding := DetectTextEncoding(pb, ASize, ABomExists);
    if AEncoding = teAnsi then
      Result := AnsiDecode(PQCharA(pb), ASize)
    else if AEncoding = teUTF8 then
    begin
      if not Utf8Decode(PQCharA(pb), ASize, Result, pe) then
        Result := AnsiDecode(PQCharA(pb), ASize);
    end
    else
    begin
      if AEncoding = teUnicode16BE then
        ExchangeByteOrder(PQCharA(pb), ASize);
      SetLength(Result, ASize shr 1);
      Move(pb^, PQCharW(Result)^, ASize);
    end;
  end
  else if ASize > 0 then
    Result := WideChar(pb^)
  else
    SetLength(Result, 0);
end;

function LoadTextW(AStream: TStream; AEncoding: TTextEncoding)
  : QStringW; overload;
var
  ASize: Integer;
  ABuffer: TBytes;
begin
  ASize := AStream.Size - AStream.Position;
  if ASize > 0 then
  begin
    SetLength(ABuffer, ASize);
    AStream.ReadBuffer((@ABuffer[0])^, ASize);
    Result := DecodeText(@ABuffer[0], ASize, AEncoding);
  end
  else
    SetLength(Result, 0);
end;

procedure SaveTextA(AFileName: String; const S: QStringA);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(AFileName, fmCreate);
  try
    SaveTextA(AStream, S);
  finally
    AStream.Free;
  end;
end;

procedure SaveTextA(AStream: TStream; const S: QStringA);
  procedure Utf8Save;
  var
    t: QStringA;
  begin
    t := AnsiEncode(Utf8Decode(S));
    AStream.WriteBuffer(PQCharA(t)^, t.Length);
  end;

begin
  if not S.IsUtf8 then
    AStream.WriteBuffer(PQCharA(S)^, S.Length)
  else
    Utf8Save;
end;

procedure SaveTextU(AFileName: String; const S: QStringA; AWriteBom: Boolean);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(AFileName, fmCreate);
  try
    SaveTextU(AStream, S, AWriteBom);
  finally
    AStream.Free;
  end;
end;

procedure SaveTextU(AFileName: String; const S: QStringW;
  AWriteBom: Boolean); overload;
begin
  SaveTextU(AFileName, qstring.Utf8Encode(S), AWriteBom);
end;

procedure SaveTextU(AStream: TStream; const S: QStringA; AWriteBom: Boolean);
  procedure WriteBom;
  var
    ABom: TBytes;
  begin
    SetLength(ABom, 3);
    ABom[0] := $EF;
    ABom[1] := $BB;
    ABom[2] := $BF;
    AStream.WriteBuffer(ABom[0], 3);
  end;
  procedure SaveAnsi;
  var
    t: QStringA;
  begin
    t := qstring.Utf8Encode(AnsiDecode(S));
    AStream.WriteBuffer(PQCharA(t)^, t.Length);
  end;

begin
  if AWriteBom then
    WriteBom;
  if S.IsUtf8 then
    AStream.WriteBuffer(PQCharA(S)^, S.Length)
  else
    SaveAnsi;
end;

procedure SaveTextU(AStream: TStream; const S: QStringW;
  AWriteBom: Boolean); overload;
begin
  SaveTextU(AStream, qstring.Utf8Encode(S), AWriteBom);
end;

procedure SaveTextW(AFileName: String; const S: QStringW; AWriteBom: Boolean);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(AFileName, fmCreate);
  try
    SaveTextW(AStream, S, AWriteBom);
  finally
    AStream.Free;
  end;
end;

procedure SaveTextW(AStream: TStream; const S: QStringW; AWriteBom: Boolean);
  procedure WriteBom;
  var
    bom: Word;
  begin
    bom := $FEFF;
    AStream.WriteBuffer(bom, 2);
  end;

begin
  if AWriteBom then
    WriteBom;
  AStream.WriteBuffer(PQCharW(S)^, System.Length(S) shl 1);
end;

procedure SaveTextWBE(AStream: TStream; const S: QStringW; AWriteBom: Boolean);
var
  pw, pe: PWord;
  w: Word;
  ABuilder: TQStringCatHelperW;
begin
  pw := PWord(PQCharW(S));
  pe := pw;
  Inc(pe, Length(S));
  ABuilder := TQStringCatHelperW.Create(IntPtr(pe) - IntPtr(pw));
  try
    while IntPtr(pw) < IntPtr(pe) do
    begin
      w := (pw^ shr 8) or (pw^ shl 8);
      ABuilder.Cat(@w, 1);
      Inc(pw);
    end;
    if AWriteBom then
      AStream.WriteBuffer(#$FE#$FF, 2);
    AStream.WriteBuffer(ABuilder.FStart^, Length(S) shl 1);
  finally
    FreeObject(ABuilder);
  end;
end;

function StrStrA(s1, s2: PQCharA): PQCharA;
  function DoSearch: PQCharA;
  var
    ps1, ps2: PQCharA;
  begin
    ps1 := s1;
    ps2 := s2;
    Inc(ps1);
    Inc(ps2);
    while ps2^ <> 0 do
    begin
      if ps1^ = ps2^ then
      begin
        Inc(ps1);
        Inc(ps2);
      end
      else
        Break;
    end;
    if ps2^ = 0 then
      Result := s1
    else
      Result := nil;
  end;

begin
{$IFDEF MSWINDOWS}
  if Assigned(VCStrStr) then
  begin
    Result := VCStrStr(s1, s2);
    Exit;
  end;
{$ENDIF}
  Result := nil;
  if (s1 <> nil) and (s2 <> nil) then
  begin
    while s1^ <> 0 do
    begin
      if s1^ = s2^ then
      begin
        Result := DoSearch;
        if Result <> nil then
          Exit;
      end;
      Inc(s1);
    end;
  end;
end;

function StrIStrA(s1, s2: PQCharA): PQCharA;
  function DoSearch: PQCharA;
  var
    ps1, ps2: PQCharA;
  begin
    ps1 := s1;
    ps2 := s2;
    Inc(ps1);
    Inc(ps2);
    while ps2^ <> 0 do
    begin
      if CharUpperA(ps1^) = ps2^ then
      begin
        Inc(ps1);
        Inc(ps2);
      end
      else
        Break;
    end;
    if ps2^ = 0 then
      Result := s1
    else
      Result := nil;
  end;

begin
  Result := nil;
  if (s1 <> nil) and (s2 <> nil) then
  begin
    while s1^ <> 0 do
    begin
      if s1^ = s2^ then
      begin
        Result := DoSearch;
        if Result <> nil then
          Exit;
      end;
      Inc(s1);
    end;
  end;
end;

function StrStrU(s1, s2: PQCharA): PQCharA;
begin
  Result := StrStrA(s1, s2);
end;

function StrIStrU(s1, s2: PQCharA): PQCharA;
begin
  Result := StrIStrA(s1, s2);
end;

function StrStrW(s1, s2: PQCharW): PQCharW;
var
  I: Integer;
begin
{$IFDEF MSWINDOWS}
  if Assigned(VCStrStrW) then
  begin
    Result := VCStrStrW(s1, s2);
    Exit;
  end;
{$ENDIF}
  if (s2 = nil) or (s2^ = #0) then
    Result := s1
  else
  begin
    Result := nil;
    while s1^ <> #0 do
    begin
      if s1^ = s2^ then
      begin
        I := 1;
        while s2[I] <> #0 do
        begin
          if s1[I] = s2[I] then
            Inc(I)
          else
            Break;
        end;
        if s2[I] = #0 then
        begin
          Result := s1;
          Break;
        end;
      end;
      Inc(s1);
    end;
  end;
end;

function StrIStrW(s1, s2: PQCharW): PQCharW;
var
  I: Integer;
  ws2: QStringW;
begin
  Result := nil;
  if (s1 = nil) or (s2 = nil) then
    Exit;
  ws2 := UpperCase(s2);
  s2 := PWideChar(ws2);
  while s1^ <> #0 do
  begin
    if CharUpperW(s1^) = s2^ then
    begin
      I := 1;
      while s2[I] <> #0 do
      begin
        if CharUpperW(s1[I]) = s2[I] then
          Inc(I)
        else
          Break;
      end;
      if s2[I] = #0 then
      begin
        Result := s1;
        Break;
      end;
    end;
    Inc(s1);
  end;
end;

function PosW(sub, S: PQCharW; AIgnoreCase: Boolean;
  AStartPos: Integer): Integer;
begin
  if AStartPos > 0 then
    Inc(S, AStartPos - 1);
  if AIgnoreCase then
    sub := StrIStrW(S, sub)
  else
    sub := StrStrW(S, sub);
  if Assigned(sub) then
    Result := ((IntPtr(sub) - IntPtr(S)) shr 1) + AStartPos
  else
    Result := 0;
end;

function PosW(sub, S: QStringW; AIgnoreCase: Boolean; AStartPos: Integer)
  : Integer; overload;
begin
  Result := PosW(PQCharW(sub), PQCharW(S), AIgnoreCase, AStartPos);
end;

function StrDupX(const S: PQCharW; ACount: Integer): QStringW;
begin
  SetLength(Result, ACount);
  Move(S^, PQCharW(Result)^, ACount shl 1);
end;

function StrDupW(const S: PQCharW; AOffset: Integer; const ACount: Integer)
  : QStringW;
var
  c, ACharSize: Integer;
  p, pds, pd: PQCharW;
begin
  c := 0;
  p := S + AOffset;
  SetLength(Result, 16384);
  pd := PQCharW(Result);
  pds := pd;
  while (p^ <> #0) and (c < ACount) do
  begin
    ACharSize := CharSizeW(p);
    AOffset := pd - pds;
    if AOffset + ACharSize = Length(Result) then
    begin
      SetLength(Result, Length(Result) shl 1);
      pds := PQCharW(Result);
      pd := pds + AOffset;
    end;
    Inc(c);
    pd^ := p^;
    if ACharSize = 2 then
      pd[1] := p[1];
    Inc(pd, ACharSize);
    Inc(p, ACharSize);
  end;
  SetLength(Result, pd - pds);
end;

function StrCmpA(const s1, s2: PQCharA; AIgnoreCase: Boolean): Integer;
var
  p1, p2: PQCharA;
  c1, c2: QCharA;
begin
  p1 := s1;
  p2 := s2;
  if AIgnoreCase then
  begin
    while (p1^ <> 0) and (p2^ <> 0) do
    begin
      if p1^ <> p2^ then
      begin
        if (p1^ >= Ord('a')) and (p1^ <= Ord('z')) then
          c1 := p1^ xor $20
        else
          c1 := p1^;
        if (p2^ >= Ord('a')) and (p2^ <= Ord('z')) then
          c2 := p2^ xor $20
        else
          c2 := p2^;
        Result := Ord(c1) - Ord(c2);
        if Result <> 0 then
          Exit;
      end;
      Inc(p1);
      Inc(p2);
    end;
    Result := Ord(p1^) - Ord(p2^);
  end
  else
  begin
    while (p1^ <> 0) and (p2^ <> 0) do
    begin
      Result := p1^ - p2^;
      if Result <> 0 then
        Exit;
      Inc(p1);
      Inc(p2);
    end;
    Result := Ord(p1^) - Ord(p2^);
  end;
end;

function StrCmpW(const s1, s2: PQCharW; AIgnoreCase: Boolean): Integer;
var
  p1, p2: PQCharW;
  c1, c2: QCharW;
begin
  p1 := s1;
  p2 := s2;
  if AIgnoreCase then
  begin
    while (p1^ <> #0) and (p2^ <> #0) do
    begin
      if p1^ <> p2^ then
      begin
        if (p1^ >= 'a') and (p1^ <= 'z') then
          c1 := WideChar(Word(p1^) xor $20)
        else
          c1 := p1^;
        if (p2^ >= 'a') and (p2^ <= 'z') then
          c2 := WideChar(Word(p2^) xor $20)
        else
          c2 := p2^;
        Result := Ord(c1) - Ord(c2);
        if Result <> 0 then
          Exit;
      end;
      Inc(p1);
      Inc(p2);
    end;
    Result := Ord(p1^) - Ord(p2^);
  end
  else
  begin
    while (p1^ <> #0) and (p2^ <> #0) do
    begin
      if p1^ <> p2^ then
      begin
        Result := Ord(p1^) - Ord(p2^);
        if Result <> 0 then
          Exit;
      end;
      Inc(p1);
      Inc(p2);
    end;
    Result := Ord(p1^) - Ord(p2^);
  end;
end;

function StrNCmpW(const s1, s2: PQCharW; AIgnoreCase: Boolean;
  ALength: Integer): Integer;
var
  p1, p2: PQCharW;
  c1, c2: QCharW;
begin
  p1 := s1;
  p2 := s2;
  if AIgnoreCase then
  begin
    while ALength > 0 do
    begin
      if p1^ <> p2^ then
      begin
        if (p1^ >= 'a') and (p1^ <= 'z') then
          c1 := WideChar(Word(p1^) xor $20)
        else
          c1 := p1^;
        if (p2^ >= 'a') and (p2^ <= 'z') then
          c2 := WideChar(Word(p2^) xor $20)
        else
          c2 := p2^;
        Result := Ord(c1) - Ord(c2);
        if Result <> 0 then
          Exit;
      end;
      Inc(p1);
      Inc(p2);
      Dec(ALength);
    end;
  end
  else
  begin
    while ALength > 0 do
    begin
      if p1^ <> p2^ then
      begin
        Result := Ord(p1^) - Ord(p2^);
        if Result <> 0 then
          Exit;
      end;
      Inc(p1);
      Inc(p2);
      Dec(ALength);
    end;
  end;
  if ALength = 0 then
    Result := 0
  else
    Result := Ord(p1^) - Ord(p2^);
end;

/// <summary>ʹ����Ȼ���Թ���Ƚ��ַ���</summary>
/// <param name="s1">��һ��Ҫ�Ƚϵ��ַ���</param>
/// <param name="s2">�ڶ���Ҫ�Ƚϵ��ַ���</param>
/// <param name="AIgnoreCase">�Ƚ�ʱ�Ƿ���Դ�Сд</param>
/// <param name="AIgnoreSpace">�Ƚ�ʱ�Ƿ���Կհ��ַ�</param>
/// <remarks>���ȽϿ�������ȫ�ǵ��������Ϊ����ȫ�Ƿ��źͶ�Ӧ�İ�Ƿ�������ȵ�ֵ</remarks>
function NaturalCompareW(s1, s2: PQCharW;
  AIgnoreCase, AIgnoreSpace: Boolean): Integer;
var
  N1, N2: Int64;
  L1, L2: Integer;
  c1, c2: QCharW;
  function FetchNumeric(p: PQCharW; var AResult: Int64;
    var ALen: Integer): Boolean;
  var
    ps: PQCharW;
  const
    Full0: WideChar = #65296; // ȫ��0
    Full9: WideChar = #65305; // ȫ��9
  begin
    AResult := 0;
    ps := p;
    while p^ <> #0 do
    begin
      while IsSpaceW(p) do
        Inc(p);
      if (p^ >= '0') and (p^ <= '9') then // �������
        AResult := AResult * 10 + Ord(p^) - Ord('0')
      else if (p^ >= Full0) and (p^ <= Full9) then // ȫ������
        AResult := AResult * 10 + Ord(p^) - Ord(Full0)
      else
        Break;
      Inc(p);
    end;
    Result := ps <> p;
    ALen := (IntPtr(p) - IntPtr(ps)) shr 1;
  end;
  function FullToHalfChar(c: Word): QCharW;
  begin
    if (c = $3000) then // ȫ�ǿո�'��'
      Result := QCharW($20)
    else if (c >= $FF01) and (c <= $FF5E) then
      Result := QCharW($21 + (c - $FF01))
    else
      Result := QCharW(c);
  end;
  function CompareChar: Integer;
  begin
    if AIgnoreCase then
    begin
      c1 := CharUpperW(FullToHalfChar(Ord(s1^)));
      c2 := CharUpperW(FullToHalfChar(Ord(s2^)));
    end
    else
    begin
      c1 := FullToHalfChar(Ord(s1^));
      c2 := FullToHalfChar(Ord(s2^));
    end;
    Result := Ord(c1) - Ord(c2);
  end;

begin
  if Assigned(s1) then
  begin
    if not Assigned(s2) then
    begin
      Result := 1;
      Exit;
    end;
    while (s1^ <> #0) and (s2^ <> #0) do
    begin
      if s1^ <> s2^ then
      begin
        while IsSpaceW(s1) do
          Inc(s1);
        while IsSpaceW(s1) do
          Inc(s2);
        // ����Ƿ�������
        L1 := 0;
        L2 := 0;
        if FetchNumeric(s1, N1, L1) and FetchNumeric(s2, N2, L2) then
        begin
          Result := N1 - N2;
          if Result <> 0 then
            Exit
          else
          begin
            Inc(s1, L1);
            Inc(s2, L2);
          end;
        end
        else
        begin
          Result := CompareChar;
          if Result = 0 then
          begin
            Inc(s1);
            Inc(s2);
          end
          else
            Exit;
        end;
      end
      else // �����ȣ���ʹ�����֣��϶�Ҳ����ȵ�
      begin
        Inc(s1);
        Inc(s2);
      end;
    end;
    Result := CompareChar;
  end
  else if Assigned(s2) then
    Result := -1
  else
    Result := 0;
end;

function IsHexChar(c: QCharW): Boolean; inline;
begin
  Result := ((c >= '0') and (c <= '9')) or ((c >= 'a') and (c <= 'f')) or
    ((c >= 'A') and (c <= 'F'));
end;

function HexValue(c: QCharW): Integer;
begin
  if (c >= '0') and (c <= '9') then
    Result := Ord(c) - Ord('0')
  else if (c >= 'a') and (c <= 'f') then
    Result := 10 + Ord(c) - Ord('a')
  else
    Result := 10 + Ord(c) - Ord('A');
end;

function HexChar(V: Byte): QCharW;
begin
  if V < 10 then
    Result := QCharW(V + Ord('0'))
  else
    Result := QCharW(V - 10 + Ord('A'));
end;

function TryStrToGuid(const S: QStringW; var AGuid: TGuid): Boolean;
var
  p, ps: PQCharW;
  l: Int64;
begin
  l := Length(S);
  p := PWideChar(S);
  if (l = 38) or (l = 36) then
  begin
    // {0BCBAAFF-15E6-451D-A8E8-0D98AC48C364}
    ps := p;
    if p^ = '{' then
      Inc(p);
    if (ParseHex(p, l) <> 8) or (p^ <> '-') then
    begin
      Result := False;
      Exit;
    end;
    AGuid.D1 := l;
    Inc(p);
    if (ParseHex(p, l) <> 4) or (p^ <> '-') then
    begin
      Result := False;
      Exit;
    end;
    AGuid.D2 := l;
    Inc(p);
    if (ParseHex(p, l) <> 4) or (p^ <> '-') then
    begin
      Result := False;
      Exit;
    end;
    AGuid.D3 := l;
    Inc(p);
    // 0102-030405060708
    // ʣ�µ�16���ַ�
    l := 0;
    while IsHexChar(p[0]) do
    begin
      if IsHexChar(p[1]) then
      begin
        AGuid.D4[l] := (HexValue(p[0]) shl 4) + HexValue(p[1]);
        Inc(l);
        Inc(p, 2);
      end
      else
      begin
        Result := False;
        Exit;
      end;
    end;
    if (l <> 2) or (p^ <> '-') then
    begin
      Result := False;
      Exit;
    end;
    Inc(p);
    while IsHexChar(p[0]) do
    begin
      if IsHexChar(p[1]) then
      begin
        AGuid.D4[l] := (HexValue(p[0]) shl 4) + HexValue(p[1]);
        Inc(l);
        Inc(p, 2);
      end
      else
      begin
        Result := False;
        Exit;
      end;
    end;
    if (l = 8) then
    begin
      if ps^ = '{' then
        Result := (p[0] = '}') and (p[1] = #0)
      else
        Result := (p[0] = #0);
    end
    else
      Result := False;
  end
  else
    Result := False;
end;

function TryStrToIPV4(const S: QStringW; var AIPV4:
{$IFDEF MSWINDOWS}Integer{$ELSE}Cardinal{$ENDIF}): Boolean;
var
  p: PQCharW;
  dc: Integer;
  pd: PByte;
begin
  dc := 0;
  AIPV4 := 0;
  p := PQCharW(S);
  pd := PByte(@AIPV4);
  while p^ <> #0 do
  begin
    if (p^ >= '0') and (p^ <= '9') then
      pd^ := pd^ * 10 + Ord(p^) - Ord('0')
    else if p^ = '.' then
    begin
      Inc(dc);
      if dc > 3 then
        Break;
      Inc(pd);
    end
    else
      Break;
    Inc(p);
  end;
  Result := (dc = 3) and (p^ = #0);
end;

function StringReplaceW(const S, Old, New: QStringW; AFlags: TReplaceFlags)
  : QStringW;
var
  ps, pse, pds, pr, pd, po, pn: PQCharW;
  l, LO, LN, LS, LR: Integer;
  AReplaceOnce: Boolean;
begin
  LO := Length(Old);
  LN := Length(New);
  LS := Length(S);
  if (LO > 0) and (LS >= LO) then
  begin
    AReplaceOnce := not(rfReplaceAll in AFlags);
    // LO=LN���򲻱�LR=LS������ȫ�滻��Ҳ������ԭ����
    // LO<LN����LR=LS+(LS*LN)/LO������ȫ�滻�ĳ���
    // LO>LN����LR=LS������һ�ζ����滻��Ҳ������ԭ����
    if LO >= LN then
      LR := LS
    else if AReplaceOnce then
      LR := LS + (LN - LO)
    else
      LR := LS + 1 + LS * LN div LO;
    SetLength(Result, LR);
    ps := PQCharW(S);
    pse := ps + LS;
    pd := PQCharW(Result);
    pds := pd;
    po := PQCharW(Old);
    pn := PQCharW(New);
    repeat
      if rfIgnoreCase in AFlags then
        pr := StrIStrW(ps, po)
      else
        pr := StrStrW(ps, po);
      if pr <> nil then
      begin
        l := IntPtr(pr) - IntPtr(ps);
        Move(ps^, pd^, l);
        Inc(pd, l shr 1);
        Inc(pr, LO);
        Move(pn^, pd^, LN shl 1);
        Inc(pd, LN);
        ps := pr;
      end;
    until (pr = nil) or AReplaceOnce;
    // ��ʣ�ಿ�ֺϲ���Ŀ��
    l := IntPtr(pse) - IntPtr(ps);
    Move(ps^, pd^, l);
    Inc(pd, l shr 1);
    SetLength(Result, pd - pds);
  end
  else
    Result := S;
end;

function StringReplaceW(const S: QStringW; const AChar: QCharW;
  AFrom, ACount: Integer): QStringW;
var
  p, pd: PQCharW;
  l: Integer;
begin
  l := Length(S);
  SetLength(Result, l);
  if (l > 0) and (l > AFrom + 1) then
  begin
    p := PQCharW(S);
    pd := PQCharW(Result);
    while (p^ <> #0) and (AFrom > 0) do
    begin
      pd^ := p^;
      if (p^ > #$D800) and (p^ <= #$DFFF) then
      begin
        Inc(pd);
        Inc(p);
        pd^ := p^;
      end;
      Inc(p);
      Inc(pd);
      Dec(AFrom);
    end;
    while (p^ <> #0) and (ACount > 0) do
    begin
      pd^ := AChar;
      if (p^ > #$D800) and (p^ <= #$DFFF) then
        Inc(p);
      Inc(p);
      Inc(pd);
      Dec(ACount);
    end;
    while p^ <> #0 do
    begin
      pd^ := p^;
      Inc(p);
      Inc(pd);
    end;
  end;
end;

function StringReplaceWithW(const S, AStartTag, AEndTag, AReplaced: QStringW;
  AWithTag, AIgnoreCase: Boolean; AMaxTimes: Cardinal): QStringW;
var
  po, pe, pws, pwe, pd, pStart, pEnd, pReplaced: PQCharW;
  l, DL, LS, LE, LR: Integer;
  StrStrFunc: TStrStrFunction;
begin
  l := Length(S);
  LS := Length(AStartTag);
  LE := Length(AEndTag);
  if (l >= LS + LE) and (AMaxTimes > 0) then
  begin
    LR := Length(AReplaced);
    po := PQCharW(S);
    pe := po + l;
    pStart := PQCharW(AStartTag);
    pEnd := PQCharW(AEndTag);
    pReplaced := PQCharW(AReplaced);
    if LR > l then
      SetLength(Result, l * LR) // �����������ÿ�������滻ΪĿ��,��Ȼ�ⲻ����
    else
      SetLength(Result, l);
    pd := PQCharW(Result);
    if AIgnoreCase then
      StrStrFunc := StrIStrW
    else
      StrStrFunc := StrStrW;
    repeat
      pws := StrStrFunc(po, pStart);
      if pws = nil then
      begin
        DL := (pe - po);
        Move(po^, pd^, DL shl 1);
        SetLength(Result, pd - PQCharW(Result) + DL);
        Exit;
      end
      else
      begin
        pwe := StrStrFunc(pws + LS, pEnd);
        if pwe = nil then // û�ҵ���β
        begin
          DL := pe - po;
          Move(po^, pd^, DL shl 1);
          SetLength(Result, pd - PQCharW(Result) + DL);
          Exit;
        end
        else
        begin
          DL := pws - po;
          if AWithTag then
          begin
            Move(po^, pd^, (LS + DL) shl 1);
            Inc(pd, LS + DL);
            Move(pReplaced^, pd^, LR shl 1);
            Inc(pd, LR);
            Move(pwe^, pd^, LE shl 1);
            Inc(pd, LE);
          end
          else
          begin
            Move(po^, pd^, DL shl 1);
            Inc(pd, DL);
            Move(pReplaced^, pd^, LR shl 1);
            Inc(pd, LR);
          end;
          po := pwe + LE;
          Dec(AMaxTimes);
        end;
      end;
    until (AMaxTimes = 0) and (IntPtr(po) < IntPtr(pe));
    if IntPtr(po) < IntPtr(pe) then
    begin
      DL := pe - po;
      Move(po^, pd^, DL shl 1);
      Inc(pd, DL);
      SetLength(Result, pd - PQCharW(Result));
    end;
  end
  else
    Result := S;
end;

function StringReplicateW(const S: QStringW; ACount: Integer): QStringW;
var
  l: Integer;
  p, ps, pd: PQCharW;
begin
  l := Length(S);
  if (l > 0) and (ACount > 0) then
  begin
    SetLength(Result, ACount * l);
    ps := PQCharW(S);
    pd := PQCharW(Result);
    for l := 0 to ACount - 1 do
    begin
      p := ps;
      while p^ <> #0 do
      begin
        pd^ := p^;
        Inc(pd);
        Inc(p);
      end;
    end;
  end
  else
    SetLength(Result, 0);
end;

function FilterCharW(const S: QStringW; AcceptChars: QStringW)
  : QStringW; overload;
var
  ps, pd, pc, pds: PQCharW;
  l: Integer;
begin
  SetLength(Result, Length(S));
  if Length(S) > 0 then
  begin
    ps := PQCharW(S);
    pd := PQCharW(Result);
    pds := pd;
    pc := PQCharW(AcceptChars);
    while ps^ <> #0 do
    begin
      if CharInW(ps, pc, @l) then
      begin
        pd^ := ps^;
        Inc(ps);
        Inc(pd);
        if l > 1 then
        begin
          pd^ := ps^;
          Inc(ps);
          Inc(pd);
        end;
      end
      else
        Inc(ps);
    end;
    SetLength(Result, (IntPtr(pd) - IntPtr(pds)) shr 1);
  end;
end;

function FilterCharW(const S: QStringW; AOnValidate: TQFilterCharEvent;
  ATag: Pointer): QStringW; overload;
var
  ps, pd, pds: PQCharW;
  l, I: Integer;
  Accept: Boolean;
begin
  if (Length(S) > 0) and Assigned(AOnValidate) then
  begin
    SetLength(Result, Length(S));
    ps := PQCharW(S);
    pd := PQCharW(Result);
    pds := pd;
    I := 0;
    while ps^ <> #0 do
    begin
      Accept := True;
      if CharSizeW(ps) = 2 then
      begin
        l := Ord(ps^);
        Inc(ps);
        l := (l shl 16) or Ord(ps^);
        AOnValidate(l, I, Accept, ATag);
      end
      else
        AOnValidate(Ord(ps^), I, Accept, ATag);
      if Accept then
      begin
        pd^ := ps^;
        Inc(pd);
      end;
      Inc(ps);
      Inc(I);
    end;
    SetLength(Result, (IntPtr(pd) - IntPtr(pds)) shr 1);
  end
  else
    SetLength(Result, 0);
end;
{$IFDEF UNICODE}

function FilterCharW(const S: QStringW; AOnValidate: TQFilterCharEventA;
  ATag: Pointer): QStringW; overload;
var
  ps, pd, pds: PQCharW;
  l, I: Integer;
  Accept: Boolean;
begin
  if (Length(S) > 0) and Assigned(AOnValidate) then
  begin
    SetLength(Result, Length(S));
    ps := PQCharW(S);
    pd := PQCharW(Result);
    pds := pd;
    I := 0;
    while ps^ <> #0 do
    begin
      Accept := True;
      if CharSizeW(ps) = 2 then
      begin
        l := Ord(ps^);
        Inc(ps);
        l := (l shl 16) or Ord(ps^);
        AOnValidate(l, I, Accept, ATag);
      end
      else
        AOnValidate(Ord(ps^), I, Accept, ATag);
      Inc(I);
      if Accept then
      begin
        pd^ := ps^;
        Inc(pd);
      end;
      Inc(ps);
    end;
    SetLength(Result, (IntPtr(pd) - IntPtr(pds)) shr 1);
  end
  else
    SetLength(Result, 0);
end;
{$ENDIF}

function FilterNoNumberW(const S: QStringW; Accepts: TQNumberTypes): QStringW;
var
  p, pd, pds: PQCharW;
  d, e: Integer;
  AIsHex: Boolean;
  procedure NegPosCheck;
  begin
    if ((p^ = '+') and (nftPositive in Accepts)) or
      ((p^ = '-') and (nftNegative in Accepts)) then
    begin
      pd^ := p^;
      Inc(p);
      Inc(pd);
    end;
  end;

begin
  SetLength(Result, Length(S));
  p := PQCharW(S);
  pd := PQCharW(Result);
  pds := pd;
  AIsHex := False;
  NegPosCheck;
  if nftHexPrec in Accepts then // Check Hex prec
  begin
    if (p^ = '0') and (nftCHex in Accepts) then // C Style
    begin
      Inc(p);
      if (p^ = 'x') or (p^ = 'X') then
      begin
        pd^ := '0';
        Inc(pd);
        pd^ := p^;
        Inc(pd);
        Inc(p);
        AIsHex := True;
      end
      else
        Dec(p);
    end
    else if (p^ = '$') and (nftDelphiHex in Accepts) then
    begin
      pd^ := p^;
      Inc(p);
      Inc(pd);
      AIsHex := True;
    end
    else if (p^ = '&') and (nftBasicHex in Accepts) then
    begin
      Inc(p);
      if Ord(p^) in [Ord('h'), Ord('H')] then
      begin
        pd^ := '&';
        Inc(pd);
        pd^ := p^;
        Inc(pd);
        Inc(p);
        AIsHex := True;
      end
      else
        Dec(p);
    end;
  end;
  d := 0;
  e := 0;
  while p^ <> #0 do
  begin
    if Ord(p^) in [Ord('0') .. Ord('9')] then
    begin
      pd^ := p^;
      Inc(pd);
    end
    else if (p^ = '.') and (not AIsHex) then
    begin
      Inc(d);
      if (d = 1) and (nftFloat in Accepts) then
      begin
        pd^ := p^;
        Inc(pd);
      end;
    end
    else if (Ord(p^) in [Ord('e'), Ord('E')]) and (not AIsHex) then
    begin
      Inc(e);
      if (e = 1) and (nftFloat in Accepts) then
      begin
        if d <= 1 then
        begin
          pd^ := p^;
          Inc(pd);
          d := 0;
          NegPosCheck;
        end;
      end;
    end
    else if AIsHex and ((Ord(p^) in [Ord('a') .. Ord('f')]) or
      (Ord(p^) in [Ord('A') .. Ord('F')])) then
    begin
      pd^ := p^;
      Inc(pd);
    end;
    Inc(p);
  end;
  SetLength(Result, (IntPtr(pd) - IntPtr(pds)) shr 1);
end;

function MemScan(S: Pointer; len_s: Integer; sub: Pointer;
  len_sub: Integer): Pointer;
var
  pb_s, pb_sub, pc_sub, pc_s: PByte;
  remain: Integer;
begin
  if len_s > len_sub then
  begin
    pb_s := S;
    pb_sub := sub;
    Result := nil;
    while len_s >= len_sub do
    begin
      if pb_s^ = pb_sub^ then
      begin
        remain := len_sub - 1;
        pc_sub := pb_sub;
        pc_s := pb_s;
        Inc(pc_s);
        Inc(pc_sub);
        if BinaryCmp(pc_s, pc_sub, remain) = 0 then
        begin
          Result := pb_s;
          Break;
        end;
      end;
      Inc(pb_s);
      Dec(len_s);
    end;
  end
  else if len_s = len_sub then
  begin
    if CompareMem(S, sub, len_s) then
      Result := S
    else
      Result := nil;
  end
  else
    Result := nil;
end;

function BinaryCmp(const p1, p2: Pointer; len: Integer): Integer;
  function CompareByByte: Integer;
  var
    b1, b2: PByte;
  begin
    if (len <= 0) or (p1 = p2) then
      Result := 0
    else
    begin
      b1 := p1;
      b2 := p2;
      Result := 0;
      while len > 0 do
      begin
        if b1^ <> b2^ then
        begin
          Result := b1^ - b2^;
          Exit;
        end;
        Inc(b1);
        Inc(b2);
      end;
    end;
  end;

begin
{$IFDEF MSWINDOWS}
  if Assigned(VCMemCmp) then
    Result := VCMemCmp(p1, p2, len)
  else
    Result := CompareByByte;
{$ELSE}
  Result := memcmp(p1, p2, len);
{$ENDIF}
end;

procedure SkipHex(var S: PQCharW);
begin
  while ((S^ >= '0') and (S^ <= '9')) or ((S^ >= 'a') and (S^ <= 'f')) or
    ((S^ >= 'A') and (S^ <= 'F')) do
    Inc(S);
end;

procedure SkipDec(var S: PQCharW);
begin
  while (S^ >= '0') and (S^ <= '9') do
    Inc(S);
end;

function ParseHex(var p: PQCharW; var Value: Int64): Integer;
var
  ps: PQCharW;
begin
  Value := 0;
  ps := p;
  while IsHexChar(p^) do
  begin
    Value := (Value shl 4) + HexValue(p^);
    Inc(p);
  end;
  Result := p - ps;
end;

function LeftStrCount(const S: QStringW; const sub: QStringW;
  AIgnoreCase: Boolean): Integer;
var
  ps, psub: PQCharW;
  l: Integer;
begin
  l := Length(sub);
  Result := 0;
  if (l > 0) and (Length(S) >= l) then
  begin
    ps := PQCharW(S);
    psub := PQCharW(sub);
    if AIgnoreCase then
    begin
      repeat
        ps := StrIStrW(ps, psub);
        if ps <> nil then
        begin
          Inc(Result);
          Inc(ps, l);
        end;
      until ps = nil;
    end
    else
    begin
      repeat
        ps := StrStrW(ps, psub);
        if ps <> nil then
        begin
          Inc(Result);
          Inc(ps, l);
        end;
      until ps = nil;
    end;
  end;
end;

function RightStrCount(const S: QStringW; const sub: QStringW;
  AIgnoreCase: Boolean): Integer;
var
  ps, pe, psub: PQCharW;
  l: Integer;
begin
  l := Length(sub);
  Result := 0;
  if Length(S) > l then
  begin
    ps := PQCharW(S);
    pe := ps + Length(S) - 1;
    psub := PQCharW(sub);
    while pe >= ps do
    begin
      if StartWithW(pe, psub, AIgnoreCase) then
      begin
        Inc(Result);
        Dec(pe, l);
      end
      else
        Dec(pe);
    end;
  end;
end;

function ParseInt(var S: PQCharW; var ANum: Int64): Integer;
var
  ps: PQCharW;
  ANeg: Boolean;
begin
  ps := S;
  // ����16���ƿ�ʼ�ַ�
  if S[0] = '$' then
  begin
    Inc(S);
    Result := ParseHex(S, ANum);
  end
  else if (S[0] = '0') and ((S[1] = 'x') or (S[1] = 'X')) then
  begin
    Inc(S, 2);
    Result := ParseHex(S, ANum);
  end
  else
  begin
    if (S^ = '-') then
    begin
      ANeg := True;
      Inc(S);
    end
    else
    begin
      ANeg := False;
      if S^ = '+' then
        Inc(S);
    end;
    ANum := 0;
    while (S^ >= '0') and (S^ <= '9') do
    begin
      ANum := ANum * 10 + Ord(S^) - Ord('0');
      if ANum < 0 then // �����
      begin
        Result := 0;
        S := ps;
        Exit;
      end;
      Inc(S);
    end;
    if ANeg then
      ANum := -ANum;
    Result := S - ps;
  end;
end;

function ParseNumeric(var S: PQCharW; var ANum: Extended): Boolean;
var
  ps: PQCharW;
  function ParseHexInt: Boolean;
  var
    iVal: Int64;
  begin
    iVal := 0;
    while IsHexChar(S^) do
    begin
      iVal := (iVal shl 4) + HexValue(S^);
      Inc(S);
    end;
    Result := (S <> ps);
    ANum := iVal;
  end;

  function ParseDec: Boolean;
  var
    ACount: Integer;
    iVal: Int64;
    APow: Extended;
    ANeg: Boolean;
  begin
    try
      ANeg := S^ = '-';
      if ANeg then
        Inc(S);
      Result := ParseInt(S, iVal) > 0;
      if not Result then
        Exit;
      if ANeg then
        ANum := -iVal
      else
        ANum := iVal;
      if S^ = '.' then // С������
      begin
        Inc(S);
        ACount := ParseInt(S, iVal);
        if ACount > 0 then
        begin
          if (ANum < 0) or ANeg then
            ANum := ANum - iVal / IntPower(10, ACount)
          else
            ANum := ANum + iVal / IntPower(10, ACount);
        end;
      end;
      if (S^ = 'e') or (S^ = 'E') then
      begin
        Inc(S);
        if ParseNumeric(S, APow) then
        begin
          ANum := ANum * Power(10, APow);

        end;
      end;
      Result := (S <> ps);
    except
      on e: EOverflow do
        Result := False;
    end;
  end;

begin
  ps := S;
  if (S^ = '$') or (S^ = '&') then
  begin
    Inc(S);
    Result := ParseHexInt;
    Exit;
  end
  else if (S[0] = '0') and ((S[1] = 'x') or (S[1] = 'X')) then
  begin
    Inc(S, 2);
    Result := ParseHexInt;
    Exit;
  end
  else
    Result := ParseDec;
  if not Result then
    S := ps;
end;

function NameOfW(const S: QStringW; ASpliter: QCharW): QStringW;
var
  p: PQCharW;
begin
  p := PQCharW(S);
  Result := DecodeTokenW(p, [ASpliter], WideChar(0), False);
end;

function ValueOfW(const S: QStringW; ASpliter: QCharW): QStringW;
var
  p: PQCharW;
  l: Integer;
begin
  p := PQCharW(S);
  if p^ = ASpliter then
  begin
    l := Length(S);
    Dec(l);
    SetLength(Result, l);
    Inc(p);
    Move(p^, PQCharW(Result)^, l shl 1);
  end
  else
  begin
    DecodeTokenW(p, [ASpliter], WideChar(0), False);
    if p^ <> #0 then
      Result := p
    else
      Result := S;
  end;
end;

function IndexOfNameW(AList: TStrings; const AName: QStringW;
  ASpliter: QCharW): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to AList.count - 1 do
  begin
    if NameOfW(AList[I], ASpliter) = AName then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function IndexOfValueW(AList: TStrings; const AValue: QStringW;
  ASpliter: QCharW): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to AList.count - 1 do
  begin
    if ValueOfW(AList[I], ASpliter) = AValue then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function DeleteCharW(const ASource, ADeletes: QStringW): QStringW;
var
  ps, pd: PQCharW;
  l, ACharLen: Integer;
begin
  l := Length(ASource);
  if (l > 0) and (Length(ADeletes) > 0) then
  begin
    SetLength(Result, l);
    ps := PQCharW(ASource);
    pd := PQCharW(Result);
    while l > 0 do
    begin
      if not CharInW(ps, PQCharW(ADeletes), @ACharLen) then
      begin
        pd^ := ps^;
        Inc(pd);
        ACharLen := CharSizeW(ps);
      end;
      Inc(ps, ACharLen);
      Dec(l, ACharLen);
    end;
    SetLength(Result, pd - PQCharW(Result));
  end
  else
    Result := ASource;
end;

function DeleteRightW(const S, ADelete: QStringW; AIgnoreCase: Boolean = False;
  ACount: Integer = MaxInt): QStringW;
var
  ps, pd, pe: PQCharW;
  LS, LD: Integer;
begin
  LS := Length(S);
  LD := Length(ADelete);
  if LS < LD then
    Result := S
  else
  begin
    pe := PQCharW(S) + Length(S);
    pd := PQCharW(ADelete);
    if AIgnoreCase then
    begin
      while LS >= LD do
      begin
        ps := pe - LD;
        if StrIStrW(ps, pd) = ps then
        begin
          pe := ps;
          Dec(LS, LD);
        end
        else
          Break;
      end;
    end
    else
    begin
      while LS >= LD do
      begin
        ps := pe - LD;
        if CompareMem(ps, pd, LD shl 1) then
        begin
          pe := ps;
          Dec(LS, LD);
        end
        else
          Break;
      end;
    end;
    SetLength(Result, LS);
    if LS > 0 then
      Move(PWideChar(S)^, PQCharW(Result)^, LS shl 1);
  end;
end;

function DeleteLeftW(const S, ADelete: QStringW; AIgnoreCase: Boolean = False;
  ACount: Integer = MaxInt): QStringW;
var
  ps, pd: PQCharW;
  LS, LD: Integer;
begin
  LS := Length(S);
  LD := Length(ADelete);
  if LS < LD then
    Result := S
  else
  begin
    ps := PQCharW(S);
    pd := PQCharW(ADelete);
    if AIgnoreCase then
    begin
      while LS >= LD do
      begin
        if StartWithW(ps, pd, True) then
        begin
          Inc(ps, LD);
          Dec(LS, LD);
        end
        else
          Break;
      end;
    end
    else
    begin
      while LS >= LD do
      begin
        if CompareMem(ps, pd, LD shl 1) then
        begin
          Inc(ps, LD);
          Dec(LS, LD);
        end
        else
          Break;
      end;
    end;
    SetLength(Result, LS);
    if LS > 0 then
      Move(ps^, PQCharW(Result)^, LS shl 1);
  end;
end;

function ContainsCharW(const S, ACharList: QStringW): Boolean;
var
  ps: PQCharW;
  l: Integer;
begin
  l := Length(S);
  Result := False;
  if (l > 0) then
  begin
    if Length(ACharList) > 0 then
    begin
      ps := PQCharW(S);
      while l > 0 do
      begin
        if CharInW(ps, PQCharW(ACharList)) then
        begin
          Result := True;
          Break;
        end;
        Inc(ps);
        Dec(l);
      end;
    end;
  end;
end;

procedure StrCpyW(d: PQCharW; S: PQCharW; ACount: Integer);
begin
  while (S^ <> #0) and (ACount <> 0) do
  begin
    d^ := S^;
    Inc(d);
    Inc(S);
    Dec(ACount);
  end;
end;

function HtmlEscape(const S: QStringW): QStringW;
var
  p, pd: PQCharW;
  AFound: Boolean;
  I: Integer;
begin
  if Length(S) > 0 then
  begin
    System.SetLength(Result, Length(S) shl 3); // ת�崮�������8���ַ�������*8�϶�����
    p := PWideChar(S);
    pd := PWideChar(Result);
    while p^ <> #0 do
    begin
      AFound := False;
      for I := 0 to 92 do
      begin
        if HtmlEscapeChars[I shl 1] = p^ then
        begin
          AFound := True;
          StrCpyW(pd, PQCharW(HtmlEscapeChars[(I shl 1) + 1]));
          Break;
        end;
      end; // end for
      if not AFound then
      begin
        pd^ := p^;
        Inc(pd);
      end; // end if
      Inc(p);
    end; // end while
    SetLength(Result, pd - PQCharW(Result));
  end // end if
  else
    Result := '';
end;

function HtmlUnescape(const S: QStringW): QStringW;
var
  p, pd, ps: PQCharW;
  AFound: Boolean;
  I, l, H: Integer;
begin
  if Length(S) > 0 then
  begin
    System.SetLength(Result, Length(S));
    p := PQCharW(S);
    pd := PQCharW(Result);
    while p^ <> #0 do
    begin
      if p^ = '&' then
      begin
        if p[1] = '#' then
        begin
          ps := p;
          Inc(p, 2);
          l := 0;
          if p^ = 'x' then
          begin
            Inc(p);
            while IsHexChar(p^) do
            begin
              l := l shl 4 + HexValue(p^);
              Inc(p);
            end;
          end
          else
          begin
            while (p^ >= '0') and (p^ <= '9') do
            begin
              l := l * 10 + Ord(p^) - Ord('0');
              Inc(p);
            end;
          end;
          if p^ = ';' then
          begin
            pd^ := QCharW(l);
            Inc(pd);
          end
          else
          begin
            pd^ := ps^;
            Inc(pd);
            p := ps;
          end;
        end
        else
        begin
          AFound := False;
          H := (Length(HtmlEscapeChars) shr 1) - 1;
          for I := 0 to H do
          begin
            if StrStrW(p, PWideChar(HtmlEscapeChars[I shl 1 + 1])) = p then
            begin
              AFound := True;
              StrCpyW(pd, PQCharW(HtmlEscapeChars[(I shl 1)]));
              Inc(pd);
              Break;
            end;
          end; // end for
          if AFound then
          begin
            Inc(p, Length(HtmlEscapeChars[I shl 1 + 1]));
            continue;
          end
          else
          begin
            pd^ := p^;
            Inc(pd);
          end; // end if
        end; // end else
      end // end else
      else
      begin
        pd^ := p^;
        Inc(pd);
      end;
      Inc(p);
    end; // end while
    SetLength(Result, pd - PWideChar(Result));
  end // end if
  else
    Result := '';
end;

function HtmlTrimText(const S: QStringW): QStringW;
var
  ps, pe: PQCharW;
  l: Integer;
begin
  if Length(S) > 0 then
  begin
    ps := PQCharW(S);
    pe := ps + System.Length(S) - 1;
    while IsSpaceW(ps) do
      Inc(ps);
    while IsSpaceW(pe) do
      Dec(pe);
    l := pe - ps + 1;
    SetLength(Result, l);
    Move(ps^, PQCharW(Result)^, l shl 1);
  end
  else
    Result := '';
end;

// ������һЩ��������
function ParseDateTime(S: PWideChar; var AResult: TDateTime): Boolean;
var
  Y, M, d, H, N, Sec, MS: Word;
  AQuoter: WideChar;
  ADate: TDateTime;
  function ParseNum(var N: Word): Boolean;
  var
    neg: Boolean;
    ps: PQCharW;
  begin
    N := 0;
    ps := S;
    if S^ = '-' then
    begin
      neg := True;
      Inc(S);
    end
    else
      neg := False;
    while S^ <> #0 do
    begin
      if (S^ >= '0') and (S^ <= '9') then
      begin
        N := N * 10 + Ord(S^) - 48;
        Inc(S);
      end
      else
        Break;
    end;
    if neg then
      N := -N;
    Result := ps <> S;
  end;

begin
  if (S^ = '"') or (S^ = '''') then
  begin
    AQuoter := S^;
    Inc(S);
  end
  else
    AQuoter := #0;
  Result := ParseNum(Y);
  if not Result then
    Exit;
  if (S^ = '-') or (S^ = '/') then
  begin
    Inc(S);
    Result := ParseNum(M);
    if (not Result) or ((S^ <> '-') and (S^ <> '/')) then
    begin
      Result := False;
      Exit;
    end;
    Inc(S);
    Result := ParseNum(d);
    if (not Result) or ((S^ <> 'T') and (S^ <> ' ') and (S^ <> #0)) then
    begin
      Result := False;
      Exit;
    end;
    if S^ <> #0 then
      Inc(S);
    if d > 31 then // D -> Y
    begin
      if M > 12 then // M/D/Y M -> D, D->Y, Y->M
        Result := TryEncodeDate(d, Y, M, ADate)
      else // D/M/Y
        Result := TryEncodeDate(d, M, Y, ADate);
    end
    else
      Result := TryEncodeDate(Y, M, d, ADate);
    if not Result then
      Exit;
    SkipSpaceW(S);
    if S^ <> #0 then
    begin
      if not ParseNum(H) then // û��ʱ��ֵ
      begin
        AResult := ADate;
        Exit;
      end;
      if S^ <> ':' then
      begin
        if H in [0 .. 23] then
          AResult := ADate + EncodeTime(H, 0, 0, 0)
        else
          Result := False;
        Exit;
      end;
      Inc(S);
    end
    else
    begin
      AResult := ADate;
      Exit;
    end;
  end
  else if S^ = ':' then
  begin
    ADate := 0;
    H := Y;
    Inc(S);
  end
  else
  begin
    Result := False;
    Exit;
  end;
  if H > 23 then
  begin
    Result := False;
    Exit;
  end;
  if not ParseNum(N) then
  begin
    if AQuoter <> #0 then
    begin
      if S^ = AQuoter then
        AResult := ADate + EncodeTime(H, 0, 0, 0)
      else
        Result := False;
    end
    else
      AResult := ADate + EncodeTime(H, 0, 0, 0);
    Exit;
  end
  else if N > 59 then
  begin
    Result := False;
    Exit;
  end;
  Sec := 0;
  MS := 0;
  if S^ = ':' then
  begin
    Inc(S);
    if not ParseNum(Sec) then
    begin
      if AQuoter <> #0 then
      begin
        if S^ = AQuoter then
          AResult := ADate + EncodeTime(H, N, 0, 0)
        else
          Result := False;
      end
      else
        AResult := ADate + EncodeTime(H, N, 0, 0);
      Exit;
    end
    else if Sec > 59 then
    begin
      Result := False;
      Exit;
    end;
    if S^ = '.' then
    begin
      Inc(S);
      if not ParseNum(MS) then
      begin
        if AQuoter <> #0 then
        begin
          if AQuoter = S^ then
            AResult := ADate + EncodeTime(H, N, Sec, 0)
          else
            Result := False;
        end
        else
          AResult := ADate + EncodeTime(H, N, Sec, 0);
        Exit;
      end
      else if MS >= 1000 then // ����1000����΢��Ϊ��λ��ʱ�ģ�ת��Ϊ����
      begin
        while MS >= 1000 do
          MS := MS div 10;
      end;
      if AQuoter <> #0 then
      begin
        if AQuoter = S^ then
          AResult := ADate + EncodeTime(H, N, Sec, MS)
        else
          Result := False;
        Exit;
      end
      else
        AResult := ADate + EncodeTime(H, N, Sec, MS);
    end
    else
    begin
      if AQuoter <> #0 then
      begin
        if AQuoter = S^ then
          AResult := ADate + EncodeTime(H, N, Sec, 0)
        else
          Result := False;
      end
      else
        AResult := ADate + EncodeTime(H, N, Sec, 0)
    end;
  end
  else
  begin
    if AQuoter <> #0 then
    begin
      if AQuoter = S^ then
        AResult := ADate + EncodeTime(H, N, 0, 0)
      else
        Result := False;
    end
    else
      AResult := ADate + EncodeTime(H, N, 0, 0);
  end;
end;

function ParseWebTime(p: PWideChar; var AResult: TDateTime): Boolean;
var
  I: Integer;
  Y, M, d, H, N, S: Integer;
const
  MonthNames: array [0 .. 11] of QStringW = ('Jan', 'Feb', 'Mar', 'Apr', 'May',
    'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
  Comma: PWideChar = ',';
  Digits: PWideChar = '0123456789';
begin
  // �������ڣ��������ֱ��ͨ�����ڼ������������Ҫ
  SkipUntilW(p, Comma, WideChar(0));
  if p^ = #0 then
  begin
    Result := False;
    Exit;
  end
  else
    Inc(p);
  SkipUntilW(p, Digits, WideChar(0));
  d := 0;
  // ����
  while (p^ >= '0') and (p^ <= '9') do
  begin
    d := d * 10 + Ord(p^) - Ord('0');
    Inc(p);
  end;
  if (d < 1) or (d > 31) then
  begin
    Result := False;
    Exit;
  end;
  SkipSpaceW(p);
  M := 0;
  for I := 0 to 11 do
  begin
    if StartWithW(p, PWideChar(MonthNames[I]), True) then
    begin
      M := I + 1;
      Break;
    end;
  end;
  if (M < 1) or (M > 12) then
  begin
    Result := False;
    Exit;
  end;
  while (p^ <> #0) and ((p^ < '0') or (p^ > '9')) do
    Inc(p);
  Y := 0;
  while (p^ >= '0') and (p^ <= '9') do
  begin
    Y := Y * 10 + Ord(p^) - Ord('0');
    Inc(p);
  end;
  while p^ = ' ' do
    Inc(p);
  H := 0;
  while (p^ >= '0') and (p^ <= '9') do
  begin
    H := H * 10 + Ord(p^) - Ord('0');
    Inc(p);
  end;
  while p^ = ':' do
    Inc(p);
  N := 0;
  while (p^ >= '0') and (p^ <= '9') do
  begin
    N := N * 10 + Ord(p^) - Ord('0');
    Inc(p);
  end;
  while p^ = ':' do
    Inc(p);
  S := 0;
  while (p^ >= '0') and (p^ <= '9') do
  begin
    S := S * 10 + Ord(p^) - Ord('0');
    Inc(p);
  end;
  while p^ = ':' do
    Inc(p);
  Result := TryEncodeDateTime(Y, M, d, H, N, S, 0, AResult);
end;

function RollupSize(ASize: Int64): QStringW;
var
  AIdx, R1, s1: Int64;
  AIsNeg: Boolean;
const
  Units: array [0 .. 3] of QStringW = ('GB', 'MB', 'KB', 'B');
begin
  AIsNeg := (ASize < 0);
  AIdx := 3;
  R1 := 0;
  if AIsNeg then
    ASize := -ASize;
  Result := '';
  while (AIdx >= 0) do
  begin
    s1 := ASize mod 1024;
    ASize := ASize shr 10;
    if (ASize = 0) or (AIdx = 0) then
    begin
      R1 := R1 * 100 div 1024;
      if R1 > 0 then
      begin
        if R1 >= 10 then
          Result := IntToStr(s1) + '.' + IntToStr(R1) + Units[AIdx]
        else
          Result := IntToStr(s1) + '.' + '0' + IntToStr(R1) + Units[AIdx];
      end
      else
        Result := IntToStr(s1) + Units[AIdx];
      Break;
    end;
    R1 := s1;
    Dec(AIdx);
  end;
  if AIsNeg then
    Result := '-' + Result;
end;

function RollupTime(ASeconds: Int64; AHideZero: Boolean): QStringW;
var
  H, N, d: Integer;
begin
  if ASeconds = 0 then
  begin
    if AHideZero then
      Result := ''
    else
      Result := '0' + SSecondName;
  end
  else
  begin
    Result := '';
    d := ASeconds div 86400;
    ASeconds := ASeconds mod 86400;
    H := ASeconds div 3600;
    ASeconds := ASeconds mod 3600;
    N := ASeconds div 60;
    ASeconds := ASeconds mod 60;
    if d > 0 then
      Result := IntToStr(d) + SDayName
    else
      Result := '';
    if H > 0 then
      Result := Result + IntToStr(H) + SHourName;
    if N > 0 then
      Result := Result + IntToStr(N) + SMinuteName;
    if ASeconds > 0 then
      Result := Result + IntToStr(ASeconds) + SSecondName;
  end;
end;
{ QStringA }

function QStringA.From(p: PQCharA; AOffset, ALen: Integer): PQStringA;
begin
  SetLength(ALen);
  Inc(p, AOffset);
  Move(p^, PQCharA(@FValue[1])^, ALen);
  Result := @Self;
end;

function QStringA.From(const S: QStringA; AOffset: Integer): PQStringA;
begin
  Result := From(PQCharA(S), AOffset, S.Length);
end;

function QStringA.GetChars(AIndex: Integer): QCharA;
begin
  if (AIndex < 0) or (AIndex >= Length) then
    raise Exception.CreateFmt(SOutOfIndex, [AIndex, 0, Length - 1]);
  Result := FValue[AIndex + 1];
end;

function QStringA.GetData: PByte;
begin
  Result := @FValue[1];
end;

class operator QStringA.Implicit(const S: QStringW): QStringA;
begin
  Result := qstring.AnsiEncode(S);
end;

class operator QStringA.Implicit(const S: QStringA): Pointer;
begin
  Result := PQCharA(@S.FValue[1]);
end;

function QStringA.GetIsUtf8: Boolean;
begin
  if System.Length(FValue) > 0 then
    Result := (FValue[0] = 1)
  else
    Result := False;
end;

function QStringA.GetLength: Integer;
begin
  // QStringA.FValue[0]�����������ͣ�0-ANSI,1-UTF8��ĩβ�����ַ�����\0������
  Result := System.Length(FValue);
  if Result >= 2 then
    Dec(Result, 2)
  else
    Result := 0;
end;

class operator QStringA.Implicit(const S: QStringA): TBytes;
var
  l: Integer;
begin
  l := System.Length(S.FValue) - 1;
  System.SetLength(Result, l);
  if l > 0 then
    Move(S.FValue[1], Result[0], l);
end;

procedure QStringA.SetChars(AIndex: Integer; const Value: QCharA);
begin
  if (AIndex < 0) or (AIndex >= Length) then
    raise Exception.CreateFmt(SOutOfIndex, [AIndex, 0, Length - 1]);
  FValue[AIndex + 1] := Value;
end;

procedure QStringA.SetLength(const Value: Integer);
begin
  if Value < 0 then
  begin
    if System.Length(FValue) > 0 then
      System.SetLength(FValue, 1)
    else
    begin
      System.SetLength(FValue, 1);
      FValue[0] := 0; // ANSI
    end;
  end
  else
  begin
    System.SetLength(FValue, Value + 2);
    FValue[Value + 1] := 0;
  end;
end;

class operator QStringA.Implicit(const ABytes: TBytes): QStringA;
var
  l: Integer;
begin
  l := System.Length(ABytes);
  Result.Length := l;
  if l > 0 then
    Move(ABytes[0], Result.FValue[1], l);
end;

class operator QStringA.Implicit(const S: QStringA): QStringW;
begin
  Result := AnsiDecode(S);
end;

function BinToHex(p: Pointer; l: Integer; ALowerCase: Boolean): QStringW;
const
  B2HConvert: array [0 .. 15] of QCharW = ('0', '1', '2', '3', '4', '5', '6',
    '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
  B2HConvertL: array [0 .. 15] of QCharW = ('0', '1', '2', '3', '4', '5', '6',
    '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f');
var
  pd: PQCharW;
  pb: PByte;
begin
  SetLength(Result, l shl 1);
  pd := PQCharW(Result);
  pb := p;
  if ALowerCase then
  begin
    while l > 0 do
    begin
      pd^ := B2HConvertL[pb^ shr 4];
      Inc(pd);
      pd^ := B2HConvertL[pb^ and $0F];
      Inc(pd);
      Inc(pb);
      Dec(l);
    end;
  end
  else
  begin
    while l > 0 do
    begin
      pd^ := B2HConvert[pb^ shr 4];
      Inc(pd);
      pd^ := B2HConvert[pb^ and $0F];
      Inc(pd);
      Inc(pb);
      Dec(l);
    end;
  end;
end;

function BinToHex(const ABytes: TBytes; ALowerCase: Boolean): QStringW;
begin
  Result := BinToHex(@ABytes[0], Length(ABytes), ALowerCase);
end;

procedure HexToBin(const S: QStringW; var AResult: TBytes);
var
  l: Integer;
  p, ps: PQCharW;
  pd: PByte;
begin
  l := System.Length(S);
  SetLength(AResult, l shr 1);
  p := PQCharW(S);
  ps := p;
  pd := @AResult[0];
  while p - ps < l do
  begin
    if IsHexChar(p[0]) and IsHexChar(p[1]) then
    begin
      pd^ := (HexValue(p[0]) shl 4) + HexValue(p[1]);
      Inc(pd);
      Inc(p, 2);
    end
    else
    begin
      SetLength(AResult, 0);
      Exit;
    end;
  end;
end;

function HexToBin(const S: QStringW): TBytes;
begin
  HexToBin(S, Result);
end;

procedure FreeObject(AObject: TObject);
begin
{$IFDEF AUTOREFCOUNT}
  AObject.DisposeOf;
{$ELSE}
  AObject.Free;
{$ENDIF}
end;

function HashOf(p: Pointer; l: Integer): Cardinal;
{$IFDEF WIN32}
label A00, A01;
begin
  asm
    push ebx
    mov eax,l
    mov ebx,0
    cmp eax,ebx
    jz A01
    xor    eax, eax
    mov    edx, p
    mov    ebx,edx
    add    ebx,l
    A00:
    imul   eax,131
    movzx  ecx, BYTE ptr [edx]
    inc    edx
    add    eax, ecx
    cmp   ebx, edx
    jne    A00
    pop ebx
    A01:
    mov Result,eax
  end;
{$ELSE}
var
  pe: PByte;
  ps: PByte absolute p;
const
  seed = 131; // 31 131 1313 13131 131313 etc..
begin
  pe := p;
  Inc(pe, l);
  Result := 0;
  while IntPtr(ps) < IntPtr(pe) do
  begin
    Result := Result * seed + ps^;
    Inc(ps);
  end;
  Result := Result and $7FFFFFFF;
{$ENDIF}
end;

class operator QStringA.Implicit(const S: PQCharA): QStringA;
var
  p: PQCharA;
begin
  if S <> nil then
  begin
    p := S;
    while p^ <> 0 do
      Inc(p);
    Result.Length := IntPtr(p) - IntPtr(S);
    Move(S^, PQCharA(Result)^, Result.Length);
  end
  else
    Result.Length := 0;
end;
{$IFNDEF NEXTGEN}

class operator QStringA.Implicit(const S: AnsiString): QStringA;
begin
  Result.From(PQCharA(S), 0, System.Length(S));
end;

class operator QStringA.Implicit(const S: QStringA): AnsiString;
begin
  System.SetLength(Result, S.Length);
  if S.Length > 0 then
    Move(PQCharA(S)^, PAnsiChar(Result)^, S.Length);
end;
{$ENDIF}

function QStringA.Cat(p: PQCharA; ALen: Integer): PQStringA;
var
  l: Integer;
begin
  l := Length;
  SetLength(l + ALen);
  Move(p^, FValue[1 + l], ALen);
  Result := @Self;
end;

function QStringA.Cat(const S: QStringA): PQStringA;
begin
  Result := Cat(PQCharA(S), S.Length);
end;

{ TQStringCatHelperW }

function TQStringCatHelperW.Back(ALen: Integer): TQStringCatHelperW;
begin
  Result := Self;
  Dec(FDest, ALen);
  if FDest < FStart then
    FDest := FStart;
end;

function TQStringCatHelperW.BackIf(const S: PQCharW): TQStringCatHelperW;
var
  ps: PQCharW;
begin
  Result := Self;
  ps := FStart;
  while FDest > ps do
  begin
    if (FDest[-1] >= #$DC00) and (FDest[-1] <= #$DFFF) then
    begin
      if CharInW(FDest - 2, S) then
        Dec(FDest, 2)
      else
        Break;
    end
    else if CharInW(FDest - 1, S) then
      Dec(FDest)
    else
      Break;
  end;
end;

function TQStringCatHelperW.Cat(const S: QStringW): TQStringCatHelperW;
begin
  Result := Cat(PQCharW(S), Length(S));
end;

function TQStringCatHelperW.Cat(p: PQCharW; len: Integer): TQStringCatHelperW;
begin
  Result := Self;
  if len < 0 then
  begin
    while p^ <> #0 do
    begin
      if Position >= FSize then
        NeedSize(FSize + FBlockSize);
      FDest^ := p^;
      Inc(p);
      Inc(FDest);
    end;
  end
  else
  begin
    NeedSize(-len);
    Move(p^, FDest^, len shl 1);
    Inc(FDest, len);
  end;
end;

function TQStringCatHelperW.Cat(c: QCharW): TQStringCatHelperW;
begin
  if Position >= FSize then
    NeedSize(-1);
  FDest^ := c;
  Inc(FDest);
  Result := Self;
end;

function TQStringCatHelperW.Cat(const V: Double): TQStringCatHelperW;
begin
  Result := Cat(FloatToStr(V));
end;

function TQStringCatHelperW.Cat(const V: Int64): TQStringCatHelperW;
begin
  Result := Cat(IntToStr(V));
end;

function TQStringCatHelperW.Cat(const V: Boolean): TQStringCatHelperW;
begin
  Result := Cat(BoolToStr(V, True));
end;

function TQStringCatHelperW.Cat(const V: TGuid): TQStringCatHelperW;
begin
  Result := Cat(GuidToString(V));
end;

function TQStringCatHelperW.Cat(const V: Currency): TQStringCatHelperW;
begin
  Result := Cat(CurrToStr(V));
end;

constructor TQStringCatHelperW.Create(ASize: Integer);
begin
  inherited Create;
  if ASize < 8192 then
    ASize := 8192
  else if (ASize and $3FF) <> 0 then
    ASize := ((ASize shr 10) + 1) shr 1;
  FBlockSize := ASize;
  NeedSize(FBlockSize);
end;

constructor TQStringCatHelperW.Create;
begin
  inherited Create;
  FBlockSize := 8192;
  NeedSize(FBlockSize);
end;

function TQStringCatHelperW.GetChars(AIndex: Integer): QCharW;
begin
  Result := FStart[AIndex];
end;

function TQStringCatHelperW.GetPosition: Integer;
begin
  Result := FDest - FStart;
end;

function TQStringCatHelperW.GetValue: QStringW;
var
  l: Integer;
begin
  l := Position;
  SetLength(Result, l);
  Move(FStart^, PQCharW(Result)^, l shl 1);
end;

procedure TQStringCatHelperW.LoadFromFile(const AFileName: QStringW);
begin
  Reset;
  Cat(LoadTextW(AFileName));
end;

procedure TQStringCatHelperW.LoadFromStream(const AStream: TStream);
begin
  Reset;
  Cat(LoadTextW(AStream));
end;

procedure TQStringCatHelperW.NeedSize(ASize: Integer);
var
  Offset: Integer;
begin
  Offset := FDest - FStart;
  if ASize < 0 then
    ASize := Offset - ASize;
  if ASize > FSize then
  begin
{$IFDEF DEBUG}
    Inc(FAllocTimes);
{$ENDIF}
    FSize := ((ASize + FBlockSize) div FBlockSize) * FBlockSize;
    SetLength(FValue, FSize);
    FStart := PQCharW(@FValue[0]);
    FDest := FStart + Offset;
  end;
end;

function TQStringCatHelperW.Replicate(const S: QStringW; count: Integer)
  : TQStringCatHelperW;
var
  ps: PQCharW;
  l: Integer;
begin
  Result := Self;
  if count > 0 then
  begin
    ps := PQCharW(S);
    l := Length(S);
    while count > 0 do
    begin
      Cat(ps, l);
      Dec(count);
    end;
  end;
end;

procedure TQStringCatHelperW.Reset;
begin
  FDest := FStart;
end;

procedure TQStringCatHelperW.SetPosition(const Value: Integer);
begin
  if Value <= 0 then
    FDest := FStart
  else if Value > Length(FValue) then
  begin
    NeedSize(Value);
    FDest := FStart + Value;
  end
  else
    FDest := FStart + Value;
end;

procedure TQStringCatHelperW.TrimRight;
var
  pd: PQCharW;
begin
  pd := FDest;
  Dec(pd);
  while FStart < pd do
  begin
    if IsSpaceW(pd) then
      Dec(pd)
    else
      Break;
  end;
  Inc(pd);
  FDest := pd;
end;

function TQStringCatHelperW.Cat(const V: Variant): TQStringCatHelperW;
begin
  Result := Cat(VarToStr(V));
end;

{ TQPtr }

class function TQPtr.Bind(AObject: TObject): IQPtr;
begin
  Result := TQPtr.Create(AObject);
end;

class function TQPtr.Bind(AData: Pointer; AOnFree: TQPtrFreeEventG): IQPtr;
var
  ATemp: TQPtr;
begin
  ATemp := TQPtr.Create(AData);
  ATemp.FOnFree.Method.Data := nil;
  ATemp.FOnFree.OnFreeG := AOnFree;
  Result := ATemp;
end;

class function TQPtr.Bind(AData: Pointer; AOnFree: TQPtrFreeEvent): IQPtr;
var
  ATemp: TQPtr;
begin
  ATemp := TQPtr.Create(AData);
{$IFDEF NEXTGEN}
  PQPtrFreeEvent(@ATemp.FOnFree.OnFree)^ := AOnFree;
{$ELSE}
  ATemp.FOnFree.OnFree := AOnFree;
{$ENDIF}
  Result := ATemp;
end;

{$IFDEF UNICODE}

class function TQPtr.Bind(AData: Pointer; AOnFree: TQPtrFreeEventA): IQPtr;
var
  ATemp: TQPtr;
begin
  ATemp := TQPtr.Create(AData);
  ATemp.FOnFree.Method.Data := Pointer(-1);
  TQPtrFreeEventA(ATemp.FOnFree.OnFreeA) := AOnFree;
  Result := ATemp;
end;
{$ENDIF}

constructor TQPtr.Create(AObject: Pointer);
begin
  inherited Create;
  FObject := AObject;
end;

destructor TQPtr.Destroy;
begin
  if Assigned(FObject) then
  begin
    if Assigned(FOnFree.OnFree) then
    begin
      if FOnFree.Method.Data = nil then
        FOnFree.OnFreeG(FObject)
{$IFDEF UNICODE}
      else if FOnFree.Method.Data = Pointer(-1) then
        TQPtrFreeEventA(FOnFree.OnFreeA)(FObject)
{$ENDIF}
      else
{$IFDEF NEXTGEN}
      begin
        PQPtrFreeEvent(FOnFree.OnFree)^(FObject);
        PQPtrFreeEvent(FOnFree.OnFree)^ := nil;
      end;
{$ELSE}
      FOnFree.OnFree(FObject);
{$ENDIF}
    end
    else
      FreeAndNil(FObject);
  end;
  inherited;
end;

function TQPtr.Get: Pointer;
begin
  Result := FObject;
end;

// ����2007���ԭ�Ӳ����ӿ�
{$IF RTLVersion<24}

function AtomicCmpExchange(var Target: Integer; Value: Integer;
  Comparand: Integer): Integer; inline;
begin
{$IFDEF MSWINDOWS}
  Result := InterlockedCompareExchange(Target, Value, Comparand);
{$ELSE}
  Result := TInterlocked.CompareExchange(Target, Value, Comparand);
{$ENDIF}
end;

function AtomicCmpExchange(var Target: Pointer; Value: Pointer;
  Comparand: Pointer): Pointer; inline;
begin
{$IFDEF MSWINDOWS}
  Result := Pointer(InterlockedCompareExchange(PInteger(Target)^,
    Integer(Value), Integer(Comparand)));
{$ELSE}
  Result := TInterlocked.CompareExchange(Target, Value, Comparand);
{$ENDIF}
end;

function AtomicIncrement(var Target: Integer; const Value: Integer)
  : Integer; inline;
begin
{$IFDEF MSWINDOWS}
  if Value = 1 then
    Result := InterlockedIncrement(Target)
  else if Value = -1 then
    Result := InterlockedDecrement(Target)
  else
    Result := InterlockedExchangeAdd(Target, Value);
{$ELSE}
  if Value = 1 then
    Result := TInterlocked.Increment(Target)
  else if Value = -1 then
    Result := TInterlocked.Decrement(Target)
  else
    Result := TInterlocked.Add(Target, Value);
{$ENDIF}
end;

function AtomicDecrement(var Target: Integer): Integer; inline;
begin
  // Result := InterlockedDecrement(Target);
  Result := AtomicIncrement(Target, -1);
end;

function AtomicExchange(var Target: Integer; Value: Integer): Integer;
begin
{$IFDEF MSWINDOWS}
  Result := InterlockedExchange(Target, Value);
{$ELSE}
  Result := TInterlocked.Exchange(Target, Value);
{$ENDIF}
end;

function AtomicExchange(var Target: Pointer; Value: Pointer): Pointer;
begin
{$IFDEF MSWINDOWS}
{$IF RTLVersion>19}
  Result := InterlockedExchangePointer(Target, Value);
{$ELSE}
  Result := Pointer(IntPtr(InterlockedExchange(IntPtr(Target), IntPtr(Value))));
{$IFEND}
{$ELSE}
  Result := TInterlocked.Exchange(Target, Value);
{$ENDIF}
end;
{$IFEND <XE5}

// λ�룬����ԭֵ
function AtomicAnd(var Dest: Integer; const AMask: Integer): Integer; inline;
var
  I: Integer;
begin
  repeat
    Result := Dest;
    I := Result and AMask;
  until AtomicCmpExchange(Dest, I, Result) = Result;
end;

// λ�򣬷���ԭֵ
function AtomicOr(var Dest: Integer; const AMask: Integer): Integer; inline;
var
  I: Integer;
begin
  repeat
    Result := Dest;
    I := Result or AMask;
  until AtomicCmpExchange(Dest, I, Result) = Result;
end;

{ TQBytesCatHelper }

function TQBytesCatHelper.Back(ALen: Integer): TQBytesCatHelper;
begin
  Result := Self;
  Dec(FDest, ALen);
  if IntPtr(FDest) < IntPtr(FStart) then
    FDest := FStart;
end;

function TQBytesCatHelper.Cat(const V: Double): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Double));
end;

function TQBytesCatHelper.Cat(const V: Currency): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Currency));
end;

function TQBytesCatHelper.Cat(const V: Boolean): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Boolean));
end;

function TQBytesCatHelper.Cat(const S: QStringW): TQBytesCatHelper;
begin
  Result := Cat(PQCharW(S), System.Length(S) shl 1);
end;

function TQBytesCatHelper.Cat(const V: Byte): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Byte));
end;

function TQBytesCatHelper.Cat(const V: Int64): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Int64));
end;

function TQBytesCatHelper.Cat(const c: QCharW): TQBytesCatHelper;
begin
  Result := Cat(@c, SizeOf(QCharW));
end;

function TQBytesCatHelper.Cat(const V: Variant): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Variant));
end;

function TQBytesCatHelper.Cat(const V: QStringA; ACStyle: Boolean)
  : TQBytesCatHelper;
begin
  if ACStyle then
    Result := Cat(PQCharA(V), V.Length + 1)
  else
    Result := Cat(PQCharA(V), V.Length);
end;

{$IFNDEF NEXTGEN}

function TQBytesCatHelper.Cat(const V: AnsiChar): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(AnsiChar));
end;

function TQBytesCatHelper.Cat(const V: AnsiString): TQBytesCatHelper;
begin
  Result := Cat(PAnsiChar(V), System.Length(V));
end;
{$ENDIF}

function TQBytesCatHelper.Cat(const V: Single): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Single));
end;

function TQBytesCatHelper.Cat(const V: Cardinal): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Cardinal));
end;

function TQBytesCatHelper.Cat(const V: Smallint): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Smallint));
end;

function TQBytesCatHelper.Cat(const V: Word): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Word));
end;

function TQBytesCatHelper.Cat(const V: Shortint): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Shortint));
end;

function TQBytesCatHelper.Cat(const V: Integer): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(Integer));
end;

function TQBytesCatHelper.Cat(const ABytes: TBytes): TQBytesCatHelper;
begin
  if Length(ABytes) > 0 then
    Result := Cat(@ABytes[0], Length(ABytes))
  else
    Result := Self;
end;

function TQBytesCatHelper.Cat(const AData: Pointer; const ALen: Integer)
  : TQBytesCatHelper;
begin
  Result := Self;
  NeedSize(-ALen);
  Move(AData^, FDest^, ALen);
  Inc(FDest, ALen);
end;

function TQBytesCatHelper.Cat(const V: TGuid): TQBytesCatHelper;
begin
  Result := Cat(@V, SizeOf(TGuid));
end;

constructor TQBytesCatHelper.Create(ASize: Integer);
begin
  inherited Create;
  FBlockSize := ASize;
  NeedSize(FBlockSize);
end;

constructor TQBytesCatHelper.Create;
begin
  inherited Create;
  FBlockSize := 8192;
  NeedSize(FBlockSize);
end;

function TQBytesCatHelper.GetBytes(AIndex: Integer): Byte;
begin
  Result := FValue[AIndex];
end;

function TQBytesCatHelper.GetPosition: Integer;
begin
  Result := IntPtr(FDest) - IntPtr(FStart);
end;

function TQBytesCatHelper.GetValue: TBytes;
var
  ALen: Integer;
begin
  ALen := Position;
  SetLength(Result, ALen);
  if ALen > 0 then
    Move(FValue[0], Result[0], ALen);
end;

procedure TQBytesCatHelper.NeedSize(ASize: Integer);
var
  Offset: Integer;
begin
  Offset := IntPtr(FDest) - IntPtr(FStart);
  if ASize < 0 then
    ASize := Offset - ASize;
  if ASize > FSize then
  begin
    FSize := ((ASize + FBlockSize) div FBlockSize) * FBlockSize;
    SetLength(FValue, FSize);
    FStart := @FValue[0];
    FDest := PByte(IntPtr(FStart) + Offset);
  end;
end;

function TQBytesCatHelper.Replicate(const ABytes: TBytes; ACount: Integer)
  : TQBytesCatHelper;
var
  l: Integer;
begin
  Result := Self;
  l := Length(ABytes);
  if l > 0 then
  begin
    NeedSize(-l * ACount);
    while ACount > 0 do
    begin
      Move(ABytes[0], FDest^, l);
      Inc(FDest, l);
      Dec(ACount);
    end;
  end;
end;

procedure TQBytesCatHelper.Reset;
begin
  FDest := FStart;
end;

procedure TQBytesCatHelper.SetCapacity(const Value: Integer);
begin
  if FSize <> Value then
    NeedSize(Value);
end;

procedure TQBytesCatHelper.SetPosition(const Value: Integer);
begin
  if Value <= 0 then
    FDest := FStart
  else if Value > Length(FValue) then
  begin
    NeedSize(Value);
    FDest := Pointer(IntPtr(FStart) + Value);
  end
  else
    FDest := Pointer(IntPtr(FStart) + Value);
end;

function NewId: TGuid;
begin
  CreateGUID(Result);
end;

function SameId(const V1, V2: TGuid): Boolean;
var
  I1: array [0 .. 1] of Int64 absolute V1;
  I2: array [0 .. 1] of Int64 absolute V2;
begin
  Result := (I1[0] = I2[0]) and (I1[1] = I2[1]);
end;

function StrLikeX(var S: PQCharW; pat: PQCharW; AIgnoreCase: Boolean): PQCharW;
const
  CHAR_DIGITS = -1;
  CHAR_NODIGITS = -2;
  CHAR_SPACES = -3;
  CHAR_NOSPACES = -4;
var
  Accept: Boolean;
  ACharCode, AEndCode: Integer;
  AToken: QStringW;
  ps, pt, os: PQCharW;
  // >0 �������ַ�����
  // <0 ���ⷶΧ
  function Unescape(var t: PQCharW): Integer;
  begin
    if t^ = '\' then
    begin
      Inc(t);
      case t^ of
        'b':
          begin
            Inc(t);
            Result := 7;
          end;
        'd':
          begin
            Inc(t);
            Result := CHAR_DIGITS;
          end;
        'D':
          begin
            Inc(t);
            Result := CHAR_NODIGITS;
          end;
        'r':
          begin
            Inc(t);
            Result := 13;
          end;
        'n':
          begin
            Inc(t);
            Result := 10;
          end;
        't':
          begin
            Inc(t);
            Result := 9;
          end;
        'f': // \f
          begin
            Inc(t);
            Result := 12;
          end;
        'v': // \v
          begin
            Inc(t);
            Result := 11;
          end;
        's': // �հ��ַ�
          begin
            Inc(t);
            Result := CHAR_SPACES;
          end;
        'S': // �ǿհ�
          begin
            Inc(t);
            Result := CHAR_NOSPACES;
          end;
        'u': // Unicode�ַ�
          begin
            if IsHexChar(t[1]) and IsHexChar(t[2]) and IsHexChar(t[3]) and
              IsHexChar(t[4]) then
            begin
              Result := (HexValue(t[1]) shl 12) or (HexValue(t[2]) shl 8) or
                (HexValue(t[3]) shl 4) or HexValue(t[4]);
              Inc(t, 5);
            end
            else
              raise Exception.CreateFmt(SCharNeeded,
                ['0-9A-Fa-f', StrDupW(t, 0, 4)]);
          end
      else
        begin
          Inc(t);
          Result := Ord(S^);
        end;
      end;
    end
    else
    begin
      Result := Ord(t^);
    end
  end;

  function IsDigit: Boolean;
  begin
    Result := ((S^ >= '0') and (S^ <= '9')) or
      ((S^ >= #65296) and (S^ <= #65305));
  end;
  function IsMatch(AStart, AEnd: Integer): Boolean;
  var
    ACode: Integer;
  begin
    case AStart of
      CHAR_DIGITS:
        Result := IsDigit;
      CHAR_NODIGITS:
        Result := not IsDigit;
      CHAR_SPACES:
        Result := IsSpaceW(S);
      CHAR_NOSPACES:
        Result := not IsSpaceW(S)
    else
      begin
        ACode := Ord(S^);
        Result := (ACode >= AStart) and (ACode <= AEnd);
        if (not Result) and AIgnoreCase then
        begin
          ACode := Ord(CharUpperW(S^));
          Result := (ACode >= AStart) and (ACode <= AEnd);
        end;
        // �������չ���ַ�����Ҫ����������ת��
        if Result and ((ACode >= $D800) and (ACode <= $DFFF)) then
        begin
          Inc(S);
          if pat^ = '\' then
          begin
            ACode := Unescape(pat);
            Result := Ord(S^) = ACode;
          end
          else
            Result := False;
        end;
      end;
    end;
  end;

  function IsIn: Boolean;
  const
    SetEndChar: PQCharW = ']';
  begin
    Result := False;
    while (pat^ <> #0) and (pat^ <> ']') do
    begin
      ACharCode := Unescape(pat);
      if pat^ = '-' then // a-z���ַ�Χ
      begin
        Inc(pat);
        if pat^ <> ']' then
          AEndCode := Unescape(pat)
        else
        begin
          raise Exception.Create(SRangeEndNeeded);
        end;
      end
      else
        AEndCode := ACharCode;
      Result := IsMatch(ACharCode, AEndCode);
      if Result then // �����еĻ������Ե�������ж�
      begin
        Inc(S);
        SkipUntilW(pat, SetEndChar);
        if pat^ <> ']' then
          raise Exception.CreateFmt(SCharNeeded, [']']);
      end
      else
        Inc(pat);
    end;
  end;

begin
  // SQL Like �﷨��
  // _ ����һ���ַ�
  // % * ���������ַ�
  // [�ַ��б�] �б��������ַ�
  // [^�ַ��б�]/[!�ַ��б�] ���б��������ַ�
  // ����ΪQDAC��չ
  // \ ת��
  // \d ���֣�ȫ�ǺͰ�ǣ�
  // \D �����֣���ȫ�ǣ�
  // \s �հ��ַ�
  // \S �ǿհ��ַ�
  os := S;
  Result := nil;
  while (pat^ <> #0) and (S^ <> #0) do
  begin
    case pat^ of
      '_':
        begin
          Inc(S, CharSizeW(S));
          Inc(pat);
        end;
      '[': // �ַ��б�
        begin
          Inc(pat);
          if (pat^ = '!') or (pat^ = '^') then
          begin
            Inc(pat);
            Accept := not IsIn;
          end
          else
            Accept := IsIn;
          if pat^ = ']' then
          begin
            Inc(pat);
          end;
          if not Accept then
            Exit;
        end;
      '\':
        begin
          ACharCode := Unescape(pat);
          if not IsMatch(ACharCode, ACharCode) then
            Exit
          else
            Inc(S);
        end;
      '*', '%':
        begin
          Inc(pat);
          // ƥ�����ⳤ�ȵ������ַ�
          if pat^ = #0 then
          begin
            Result := os;
            while S^ <> #0 do
              Inc(S);
            Exit;
          end
          else
          begin
            // ���������*��%����Ϊ
            while (pat^ = '%') or (pat^ = '*') do
              Inc(pat);
            ps := pat;
            // �ҵ���һ������ƥ�����߽�
            while (pat^ <> #0) and (pat^ <> '*') do
              Inc(pat);
            // ƥ���Ӵ���ʣ�ಿ��
            AToken := StrDupX(ps, (IntPtr(pat) - IntPtr(ps)) shr 1);
            repeat
              pt := S;
              ps := StrLikeX(S, PQCharW(AToken), AIgnoreCase);
              if ps <> nil then
              begin
                if (pat^ <> #0) and (StrLikeX(S, pat, AIgnoreCase) = nil) then
                begin
                  Inc(pt);
                  S := pt;
                end
                else
                begin
                  Result := os;
                  while S^ <> #0 do
                    Inc(S);
                  Exit;
                end;
              end
              else
              begin
                Inc(pt);
                S := pt;
              end;
            until (S^ = #0);
            // �������û��ƥ�䵽��˵��ʧ����
            Exit;
          end;
        end
    else // ��ͨ�ַ��ıȽ�
      begin
        if not IsMatch(Ord(pat^), Ord(pat^)) then
          Exit;
        Inc(S);
        Inc(pat);
      end;
    end;
  end;
  if (pat^ = '%') or (pat^ = '*') then // ģʽƥ��
    Inc(pat);
  if pat^ = #0 then
    Result := os;
end;

function StrLikeW(S, pat: PQCharW; AIgnoreCase: Boolean): Boolean;
var
  ps: PQCharW;
begin
  ps := S;
  Result := (StrLikeX(S, pat, AIgnoreCase) = ps) and (S^ = #0);
end;

{ TQPagedList }

function TQPagedList.Add(const p: Pointer): Integer;
begin
  Result := FCount;
  Insert(Result, p);
end;
{$IF RTLVersion<26}

procedure TQPagedList.Assign(ListA: TList; AOperator: TListAssignOp;
  ListB: TList);
var
  I: Integer;
  LTemp: TQPagedList;
  LSource: TList;
begin
  // ListB given?
  if ListB <> nil then
  begin
    LSource := ListB;
    Assign(ListA);
  end
  else
    LSource := ListA;

  // on with the show
  case AOperator of

    // 12345, 346 = 346 : only those in the new list
    laCopy:
      begin
        Clear;
        for I := 0 to LSource.count - 1 do
          Add(LSource[I]);
      end;

    // 12345, 346 = 34 : intersection of the two lists
    laAnd:
      for I := count - 1 downto 0 do
        if LSource.IndexOf(Items[I]) = -1 then
          Delete(I);

    // 12345, 346 = 123456 : union of the two lists
    laOr:
      for I := 0 to LSource.count - 1 do
        if IndexOf(LSource[I]) = -1 then
          Add(LSource[I]);

    // 12345, 346 = 1256 : only those not in both lists
    laXor:
      begin
        LTemp := TQPagedList.Create; // Temp holder of 4 byte values
        try
          for I := 0 to LSource.count - 1 do
            if IndexOf(LSource[I]) = -1 then
              LTemp.Add(LSource[I]);
          for I := count - 1 downto 0 do
            if LSource.IndexOf(Items[I]) <> -1 then
              Delete(I);
          I := count + LTemp.count;
          if Capacity < I then
            Capacity := I;
          for I := 0 to LTemp.count - 1 do
            Add(LTemp[I]);
        finally
          LTemp.Free;
        end;
      end;

    // 12345, 346 = 125 : only those unique to source
    laSrcUnique:
      for I := count - 1 downto 0 do
        if LSource.IndexOf(Items[I]) <> -1 then
          Delete(I);

    // 12345, 346 = 6 : only those unique to dest
    laDestUnique:
      begin
        LTemp := TQPagedList.Create;
        try
          for I := LSource.count - 1 downto 0 do
            if IndexOf(LSource[I]) = -1 then
              LTemp.Add(LSource[I]);
          Assign(LTemp);
        finally
          LTemp.Free;
        end;
      end;
  end;
end;
{$IFEND}

procedure TQPagedList.BatchAdd(pp: PPointer; ACount: Integer);
begin
  BatchInsert(FCount, pp, ACount);
end;

procedure TQPagedList.BatchAdd(AList: TPointerList);
begin
  if Length(AList) > 0 then
    BatchInsert(FCount, @AList[0], Length(AList));
end;

procedure TQPagedList.Assign(ListA: TQPagedList; AOperator: TListAssignOp;
  ListB: TQPagedList);
var
  I: Integer;
  LTemp, LSource: TQPagedList;
begin
  // ListB given?
  if ListB <> nil then
  begin
    LSource := ListB;
    Assign(ListA);
  end
  else
    LSource := ListA;
  case AOperator of
    // 12345, 346 = 346 : only those in the new list
    laCopy:
      begin
        Clear;
        for I := 0 to LSource.count - 1 do
          Add(LSource[I]);
      end;
    // 12345, 346 = 34 : intersection of the two lists
    laAnd:
      for I := count - 1 downto 0 do
        if LSource.IndexOf(Items[I]) = -1 then
          Delete(I);
    // 12345, 346 = 123456 : union of the two lists
    laOr:
      for I := 0 to LSource.count - 1 do
        if IndexOf(LSource[I]) = -1 then
          Add(LSource[I]);
    // 12345, 346 = 1256 : only those not in both lists
    laXor:
      begin
        LTemp := TQPagedList.Create; // Temp holder of 4 byte values
        try
          for I := 0 to LSource.count - 1 do
            if IndexOf(LSource[I]) = -1 then
              LTemp.Add(LSource[I]);
          for I := count - 1 downto 0 do
            if LSource.IndexOf(Items[I]) <> -1 then
              Delete(I);
          I := count + LTemp.count;
          if Capacity < I then
            Capacity := I;
          for I := 0 to LTemp.count - 1 do
            Add(LTemp[I]);
        finally
          LTemp.Free;
        end;
      end;

    // 12345, 346 = 125 : only those unique to source
    laSrcUnique:
      for I := count - 1 downto 0 do
        if LSource.IndexOf(Items[I]) <> -1 then
          Delete(I);

    // 12345, 346 = 6 : only those unique to dest
    laDestUnique:
      begin
        LTemp := TQPagedList.Create;
        try
          for I := LSource.count - 1 downto 0 do
            if IndexOf(LSource[I]) = -1 then
              LTemp.Add(LSource[I]);
          Assign(LTemp);
        finally
          LTemp.Free;
        end;
      end;
  end;
end;

procedure TQPagedList.CheckLastPage;
begin
  while (FLastUsedPage > 0) and (FPages[FLastUsedPage].FUsedCount = 0) do
    Dec(FLastUsedPage);
end;

procedure TQPagedList.Clear;
var
  I: Integer;
  J: Integer;
begin
  for I := 0 to High(FPages) do
  begin
    for J := 0 to FPages[I].FUsedCount - 1 do
      DoDelete(FPages[I].FItems[J]);
    FPages[I].FUsedCount := 0;
  end;
  FFirstDirtyPage := 1;
  if Length(FPages) > 0 then
  begin
    FLastUsedPage := 0;
    FPages[0].FUsedCount := 0;
  end
  else
    FLastUsedPage := -1;
  FCount := 0;
end;

procedure TQPagedList.Pack;
var
  ASource, ADest, AStartMove, AToMove, APageCount: Integer;
  ADestPage, ASourcePage: TQListPage;
  procedure PackPages(AStartPage: Integer);
  var
    I: Integer;
  begin
    if AStartPage < APageCount then
    begin
      I := AStartPage;
      while I < APageCount do
      begin
        FreeAndNil(FPages[I]);
        Inc(I);
      end;
      SetLength(FPages, AStartPage);
      FLastUsedPage := AStartPage - 1;
      FFirstDirtyPage := AStartPage + 1;
    end;
  end;

  procedure NextDest;
  var
    APriorPage: TQListPage;
    ANewDest: Integer;
  begin
    ANewDest := ADest;
    repeat
      ADestPage := FPages[ANewDest];
      if ADestPage.FUsedCount = FPageSize then
        Inc(ANewDest)
      else
      begin
        if (ADest <> ANewDest) then
        begin
          ADest := ANewDest;
          if ASource <> ADest then
          begin
            APriorPage := FPages[ADest - 1];
            ADestPage.FStartIndex := APriorPage.FStartIndex +
              APriorPage.FUsedCount;
          end;
        end;
        Break;
      end;
    until ADest = ASource;
  end;

  function NextSource: Boolean;
  begin
    Inc(ASource);
    Result := False;
    while ASource <= FLastUsedPage do
    begin
      ASourcePage := FPages[ASource];
      if (ASourcePage.FUsedCount > 0) then
      begin
        Result := True;
        Break;
      end
      else
        Inc(ASource);
    end;
  end;

  procedure CleanPages;
  var
    I: Integer;
  begin
    I := FFirstDirtyPage;
    while I < APageCount do
    begin
      FPages[I].FStartIndex := FPages[I - 1].FStartIndex + FPages[I - 1]
        .FUsedCount;
      Inc(I);
    end;
  end;

begin
  APageCount := Length(FPages);
  if count > 0 then
  begin
    ADest := 0;
    ASource := 0;
    CleanPages;
    while NextSource do
    begin
      AStartMove := 0;
      NextDest;
      if ADestPage <> ASourcePage then
      begin
        while (ADestPage <> ASourcePage) do
        begin
          AToMove := ASourcePage.FUsedCount - AStartMove;
          if AToMove > FPageSize - ADestPage.FUsedCount then
            AToMove := FPageSize - ADestPage.FUsedCount;
          System.Move(ASourcePage.FItems[AStartMove],
            ADestPage.FItems[ADestPage.FUsedCount], AToMove * SizeOf(Pointer));
          Inc(AStartMove, AToMove);
          Inc(ADestPage.FUsedCount, AToMove);
          if ASourcePage.FUsedCount = AStartMove then
          begin
            ASourcePage.FStartIndex := ADestPage.FStartIndex +
              ADestPage.FUsedCount;
            ASourcePage.FUsedCount := 0;
            Break;
          end;
          if ADestPage.FUsedCount = FPageSize then
          begin
            System.Move(ASourcePage.FItems[AStartMove], ASourcePage.FItems[0],
              (ASourcePage.FUsedCount - AStartMove) * SizeOf(Pointer));
            Dec(ASourcePage.FUsedCount, AStartMove);
            Inc(ASourcePage.FStartIndex, AStartMove);
            AStartMove := 0;
            NextDest;
          end;
        end;
      end;
    end;
    if ADestPage.FUsedCount = 0 then
      PackPages(ADest)
    else
      PackPages(ADest + 1);
  end
  else
    PackPages(0);
end;

constructor TQPagedList.Create(APageSize: Integer);
begin
  inherited Create;
  if APageSize <= 0 then
    APageSize := 512;
  FPageSize := APageSize;
  FLastUsedPage := -1;
  FFirstDirtyPage := 1;
end;

constructor TQPagedList.Create;
begin
  Create(512);
end;

procedure TQPagedList.Delete(AIndex: Integer);
var
  APage: Integer;
  ATemp: TQListPage;
begin
  APage := FindPage(AIndex);
  if APage >= 0 then
  begin
    ATemp := FPages[APage];
    Dec(AIndex, ATemp.FStartIndex);
    DoDelete(ATemp.FItems[AIndex]);
    System.Move(ATemp.FItems[AIndex + 1], ATemp.FItems[AIndex],
      SizeOf(Pointer) * (ATemp.FUsedCount - AIndex - 1));
    Dec(ATemp.FUsedCount);
    CheckLastPage;
    Dec(FCount);
    Dirty(APage + 1);
  end;
end;

destructor TQPagedList.Destroy;
var
  I: Integer;
begin
  Clear;
  for I := 0 to High(FPages) do
    FreeObject(FPages[I]);
{$IFDEF UNICODE}
  if Assigned(FOnCompare) and (TMethod(FOnCompare).Data = Pointer(-1)) then
    TQPagedListSortCompareA(TMethod(FOnCompare).Code) := nil;
{$ENDIF}
  inherited;
end;

procedure TQPagedList.Dirty(APage: Integer);
begin
  if APage < FFirstDirtyPage then
    FFirstDirtyPage := APage;
end;

function TQPagedList.DoCompare(p1, p2: Pointer): Integer;
begin
  case IntPtr(TMethod(FOnCompare).Data) of
    0: // ȫ�ֺ���
      TQPagedListSortCompareG(TMethod(FOnCompare).Code)(p1, p2, Result);
{$IFDEF UNICODE}
    -1: // ��������
      TQPagedListSortCompareA(TMethod(FOnCompare).Code)(p1, p2, Result)
{$ENDIF}
  else
    FOnCompare(p1, p2, Result);
  end;
end;

procedure TQPagedList.DoDelete(const p: Pointer);
begin
  if (p <> nil) and (ClassType <> TQPagedList) then
    Notify(p, lnDeleted);
end;

procedure TQPagedList.Exchange(AIndex1, AIndex2: Integer);
var
  p1, p2: TQListPage;
  t: Pointer;
begin
  p1 := GetPage(AIndex1);
  p2 := GetPage(AIndex2);
  if (p1 <> nil) and (p2 <> nil) then
  begin
    Dec(AIndex1, p1.FStartIndex);
    Dec(AIndex2, p2.FStartIndex);
    t := p1.FItems[AIndex1];
    p1.FItems[AIndex1] := p2.FItems[AIndex2];
    p2.FItems[AIndex2] := t;
  end;
end;

function TQPagedList.Expand: TQPagedList;
begin
  // �������ֻ��Ϊ����TList�ӿڱ�����TQPagedList����Ҫ
  Result := Self;
end;

function TQPagedList.Extract(Item: Pointer): Pointer;
begin
  Result := ExtractItem(Item, FromBeginning);
end;

function TQPagedList.ExtractItem(Item: Pointer; Direction: TDirection): Pointer;
var
  I: Integer;
begin
  Result := nil;
  I := IndexOfItem(Item, Direction);
  if I >= 0 then
  begin
    Result := Item;
    Remove(I);
    if ClassType <> TQPagedList then
      Notify(Result, lnExtracted);
  end;
end;

function TQPagedList.Find(const p: Pointer; var AIdx: Integer): Boolean;
var
  l, H, I, c: Integer;
begin
  Result := False;
  l := 0;
  H := FCount - 1;
  while l <= H do
  begin
    I := (l + H) shr 1;
    c := DoCompare(Items[I], p);
    if c < 0 then
      l := I + 1
    else
    begin
      H := I - 1;
      if c = 0 then
        Result := True;
    end;
  end;
  AIdx := l;
end;

function TQPagedList.FindPage(AIndex: Integer): Integer;
var
  l, H, I, AMax, c: Integer;
  ATemp: TQListPage;
begin
  c := Length(FPages);
  ATemp := FPages[FFirstDirtyPage - 1];
  if (FFirstDirtyPage < c) and (AIndex >= ATemp.FStartIndex + ATemp.FUsedCount)
  then
  begin
    I := FFirstDirtyPage;
    while I < c do
    begin
      ATemp := FPages[I - 1];
      FPages[I].FStartIndex := ATemp.FStartIndex + ATemp.FUsedCount;
      if FPages[I].FStartIndex > AIndex then
      begin
        Result := I - 1;
        FFirstDirtyPage := I + 1;
        Exit;
      end
      else if FPages[I].FStartIndex = AIndex then
      begin
        Result := I;
        FFirstDirtyPage := I + 1;
        Exit;
      end;
      Inc(I);
    end;
    H := c - 1;
  end
  else
    H := FFirstDirtyPage - 1;
  l := AIndex div FPageSize;
  while l <= H do
  begin
    I := (l + H) shr 1;
    ATemp := FPages[I];
    AMax := ATemp.FStartIndex + ATemp.FUsedCount - 1; // ����������
    if AIndex > AMax then
      l := I + 1
    else
    begin
      H := I - 1;
      if (AIndex >= ATemp.FStartIndex) and (AIndex <= AMax) then
      begin
        Result := I;
        Exit;
      end;
    end;
  end;
  Result := -1;
end;

function TQPagedList.First: Pointer;
begin
  Result := Items[0];
end;

function TQPagedList.GetCapacity: Integer;
begin
  Result := Length(FPages) * FPageSize;
end;

function TQPagedList.GetEnumerator: TQPagedListEnumerator;
begin
  Result := TQPagedListEnumerator.Create(Self);
end;

function TQPagedList.GetItems(AIndex: Integer): Pointer;
var
  APage: TQListPage;
begin
  APage := GetPage(AIndex);
  if APage <> nil then
  begin
    Dec(AIndex, APage.FStartIndex);
    Result := APage.FItems[AIndex];
  end
  else
    raise Exception.Create('����Խ��:' + IntToStr(AIndex));
end;

function TQPagedList.GetList: TPointerList;
var
  I, K: Integer;
  APage: TQListPage;
begin
  SetLength(Result, count);
  K := 0;
  for I := 0 to High(FPages) do
  begin
    APage := FPages[I];
    if APage.FUsedCount > 0 then
    begin
      System.Move(APage.FItems[0], Result[K],
        APage.FUsedCount * SizeOf(Pointer));
      Inc(K, APage.FUsedCount);
    end;
  end;
end;

function TQPagedList.GetPage(AIndex: Integer): TQListPage;
var
  l, H, I, AMax, c: Integer;
  ATemp: TQListPage;
begin
  Result := nil;
  c := Length(FPages);
  ATemp := FPages[FFirstDirtyPage - 1];
  if (FFirstDirtyPage < c) and (AIndex >= ATemp.FStartIndex + ATemp.FUsedCount)
  then
  begin
    I := FFirstDirtyPage;
    while I < c do
    begin
      ATemp := FPages[I - 1];
      FPages[I].FStartIndex := ATemp.FStartIndex + ATemp.FUsedCount;
      if FPages[I].FStartIndex > AIndex then
      begin
        Result := ATemp;
        FFirstDirtyPage := I + 1;
        Exit;
      end
      else if FPages[I].FStartIndex = AIndex then
      begin
        Result := FPages[I];
        FFirstDirtyPage := I + 1;
        Exit;
      end;
      Inc(I);
    end;
    H := c - 1;
  end
  else
    H := FFirstDirtyPage - 1;
  // ��������˵������ÿҳ���������������λ��ΪAIndex div Page
  l := AIndex div FPageSize;
  while l <= H do
  begin
    I := (l + H) shr 1;
    ATemp := FPages[I];
    AMax := ATemp.FStartIndex + ATemp.FUsedCount - 1;
    // ����������
    if AIndex > AMax then
      l := I + 1
    else
    begin
      H := I - 1;
      if (AIndex >= ATemp.FStartIndex) and (AIndex <= AMax) then
      begin
        Result := ATemp;
        Exit;
      end;
    end;
  end;
end;

function TQPagedList.GetPageCount: Integer;
begin
  Result := Length(FPages);
end;

function TQPagedList.IndexOf(Item: Pointer): Integer;
var
  I, J: Integer;
begin
  if Assigned(FOnCompare) then
  begin
    if not Find(Item, Result) then
      Result := -1;
  end
  else
  begin
    Result := -1;
    for I := 0 to High(FPages) do
    begin
      for J := 0 to FPages[I].FUsedCount do
      begin
        if FPages[I].FItems[J] = Item then
        begin
          Result := FPages[I].FStartIndex + J;
          Exit;
        end;
      end;
    end;
  end;
end;

function TQPagedList.IndexOfItem(Item: Pointer; Direction: TDirection): Integer;
var
  I, J: Integer;
begin
  if Direction = FromBeginning then
    Result := IndexOf(Item)
  else
  begin
    Result := -1;
    for I := High(FPages) downto 0 do
    begin
      for J := FPages[I].FUsedCount - 1 downto 0 do
      begin
        if FPages[I].FItems[J] = Item then
        begin
          Result := FPages[I].FStartIndex + J;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TQPagedList.BatchInsert(AIndex: Integer; pp: PPointer;
  ACount: Integer);
var
  APage, ANeedPages, APageCount, AOffset, ARemain, AToMove: Integer;
  ASourcePage, ADestPage: TQListPage;
  ASplitNeeded: Boolean;
  procedure SplitPage;
  begin
    ADestPage := FPages[APage];
    ADestPage.FStartIndex := ASourcePage.FStartIndex;
    ADestPage.FUsedCount := AIndex - ASourcePage.FStartIndex;
    System.Move(ASourcePage.FItems[0], ADestPage.FItems[0],
      ADestPage.FUsedCount * SizeOf(Pointer));
    Dec(ASourcePage.FUsedCount, ADestPage.FUsedCount);
    System.Move(ASourcePage.FItems[ADestPage.FUsedCount], ASourcePage.FItems[0],
      ASourcePage.FUsedCount * SizeOf(Pointer));
    Inc(APage);
    Dec(ANeedPages);
  end;
  procedure NewPages;
  var
    ATempList: TPointerList;
    AEmptyPages: Integer;
  begin
    APageCount := Length(FPages);
    // ������Ҫ��ҳ��
    ANeedPages := ACount div FPageSize;
    if (ACount mod FPageSize) <> 0 then
      Inc(ANeedPages);
    AEmptyPages := APageCount;
    if FLastUsedPage >= 0 then
    begin
      if FPages[FLastUsedPage].FUsedCount = 0 then
        Dec(FLastUsedPage);
      Dec(AEmptyPages, FLastUsedPage + 1);
    end;
    if AIndex = 0 then
      APage := 0
    else if AIndex = FCount then
      APage := FLastUsedPage + 1
    else
    begin
      APage := FindPage(AIndex);
      ASourcePage := FPages[APage];
      ASplitNeeded := AIndex > ASourcePage.FStartIndex;
      if ASplitNeeded then
        // ��������λ����ҳ�м䣬��Ҫ����һҳ������ǰ���Ԫ��
        Inc(ANeedPages);
    end;
    if AEmptyPages >= ANeedPages then // ���е�ҳ�㹻�Ļ�
    begin
      if FCount = 0 then // û���κμ�¼����ʱAIndex=0,ֱ��Ԥ��ҳ�Ϳ�����
      begin
        FLastUsedPage := ANeedPages - 1;
        FFirstDirtyPage := ANeedPages;
      end
      else
      begin
        SetLength(ATempList, ANeedPages);
        System.Move(ATempList[0], FPages[APage], ANeedPages * SizeOf(Pointer));
        System.Move(FPages[APage], FPages[APage + ANeedPages],
          (FLastUsedPage - APage + 1) * SizeOf(Pointer));
        System.Move(ATempList[0], FPages[APage], ANeedPages * SizeOf(Pointer));
        if ASplitNeeded then
          SplitPage;
        Inc(FLastUsedPage, ANeedPages);
      end;
      Exit;
    end
    else // ����ҳ����
    begin
      SetLength(FPages, APageCount + ANeedPages - AEmptyPages);
      if FLastUsedPage >= APage then
      begin
        SetLength(ATempList, AEmptyPages);
        if AEmptyPages > 0 then
          System.Move(FPages[FLastUsedPage + 1], ATempList[0],
            AEmptyPages * SizeOf(Pointer));
        System.Move(FPages[APage], FPages[APage + ANeedPages],
          (FLastUsedPage - APage + 1) * SizeOf(Pointer));
        if AEmptyPages > 0 then
          System.Move(ATempList[0], FPages[APage],
            AEmptyPages * SizeOf(Pointer));
      end;
      AOffset := APage + AEmptyPages;
      AToMove := ANeedPages - AEmptyPages;
      while AToMove > 0 do
      begin
        FPages[AOffset] := TQListPage.Create(FPageSize);
        Inc(AOffset);
        Dec(AToMove);
      end;
      if ASplitNeeded then
        SplitPage;
      FLastUsedPage := High(FPages);
    end;
  end;

begin
  if AIndex < 0 then
    AIndex := 0
  else if AIndex > FCount then
    AIndex := FCount;
  NewPages;
  ARemain := ACount;
  while ARemain > 0 do
  begin
    ADestPage := FPages[APage];
    ADestPage.FStartIndex := AIndex;
    AToMove := ARemain;
    if AToMove >= FPageSize then
      AToMove := FPageSize;
    System.Move(pp^, ADestPage.FItems[0], AToMove * SizeOf(Pointer));
    ADestPage.FUsedCount := AToMove;
    Inc(pp, AToMove);
    Inc(AIndex, AToMove);
    Dec(ARemain, AToMove);
    Inc(APage);
  end;
  Inc(FCount, ACount);
  Dirty(APage + ANeedPages);
end;

procedure TQPagedList.BatchInsert(AIndex: Integer; const AList: TPointerList);
begin
  if Length(AList) > 0 then
    BatchInsert(AIndex, @AList[0], Length(AList));
end;

procedure TQPagedList.Insert(AIndex: Integer; const p: Pointer);
var
  APage, ANewPage, AMoved: Integer;
  ADestPage, ATemp: TQListPage;
begin
  if AIndex < 0 then
    AIndex := 0;
  if Assigned(FOnCompare) then
    Find(p, AIndex);
  if AIndex >= count then // ����ĩβ
  begin
    APage := FLastUsedPage;
    if (APage < 0) or (FPages[APage].FUsedCount = FPageSize) then
    begin
      Inc(APage);
      if APage >= Length(FPages) then
      begin
        SetLength(FPages, Length(FPages) + 1);
        ADestPage := TQListPage.Create(FPageSize);
        ADestPage.FStartIndex := count;
        FPages[APage] := ADestPage;
      end
      else
        ADestPage := FPages[APage];
      Inc(FLastUsedPage);
      if APage = 0 then
        FFirstDirtyPage := 1;
    end
    else
      ADestPage := FPages[APage];
    ADestPage.FItems[ADestPage.FUsedCount] := p;
    Inc(ADestPage.FUsedCount);
  end
  else if AIndex <= 0 then // ������ǰ��
  begin
    ADestPage := FPages[0];
    if ADestPage.FUsedCount < FPageSize then
    begin
      System.Move(ADestPage.FItems[0], ADestPage.FItems[1],
        ADestPage.FUsedCount * SizeOf(Pointer));
      ADestPage.FItems[0] := p;
      Inc(ADestPage.FUsedCount);
    end
    else // ��ǰҳ���ˣ���Ҫ������ҳ
    begin
      if FLastUsedPage < High(FPages) then
      begin
        Inc(FLastUsedPage);
        ADestPage := FPages[FLastUsedPage];
        System.Move(FPages[0], FPages[1], SizeOf(TQListPage) * FLastUsedPage);
        FPages[0] := ADestPage;
        ADestPage.FStartIndex := 0;
      end
      else
      begin
        ANewPage := Length(FPages);
        SetLength(FPages, ANewPage + 1);
        FLastUsedPage := ANewPage;
        System.Move(FPages[0], FPages[1], SizeOf(TQListPage) * FLastUsedPage);
        FPages[0] := TQListPage.Create(FPageSize);
        ADestPage := FPages[0];
      end;
      ADestPage.FUsedCount := 1;
      ADestPage.FItems[0] := p;
    end;
    Dirty(1);
  end
  else
  // �����м�
  begin
    APage := FindPage(AIndex);
    ADestPage := FPages[APage];
    if (ADestPage.FUsedCount = FPageSize) then // Ŀ��ҳ����
    begin
      ANewPage := APage + 1;
      if (FLastUsedPage = APage) or (FPages[ANewPage].FUsedCount = FPageSize)
      then
      // ��һҳҲ����
      begin
        Inc(FLastUsedPage);
        if FLastUsedPage = Length(FPages) then
        begin
          SetLength(FPages, FLastUsedPage + 1);
          System.Move(FPages[ANewPage], FPages[ANewPage + 1],
            SizeOf(TQListPage) * (FLastUsedPage - ANewPage));
          ATemp := TQListPage.Create(FPageSize);;
          FPages[ANewPage] := ATemp;
        end
        else if ANewPage = FLastUsedPage then
          ATemp := FPages[ANewPage]
        else
        begin
          ATemp := FPages[FLastUsedPage];
          System.Move(FPages[ANewPage], FPages[ANewPage + 1],
            SizeOf(TQListPage) * (FLastUsedPage - ANewPage));
          FPages[ANewPage] := ATemp;
        end;
        ATemp.FStartIndex := AIndex + 1;
        Dec(AIndex, ADestPage.FStartIndex);
        AMoved := ADestPage.FUsedCount - AIndex;
        System.Move(ADestPage.FItems[AIndex], ATemp.FItems[0],
          AMoved * SizeOf(Pointer));
        Dec(ADestPage.FUsedCount, AMoved - 1);
        ATemp.FUsedCount := AMoved;
        ADestPage.FItems[AIndex] := p;
        Dirty(ANewPage + 1);
      end
      else // ����ǰҳ������������һҳ
      begin
        ATemp := FPages[ANewPage];
        System.Move(ATemp.FItems[0], ATemp.FItems[1],
          ATemp.FUsedCount * SizeOf(Pointer));
        ATemp.FItems[0] := ADestPage.FItems[FPageSize - 1];
        Inc(ATemp.FUsedCount);
        Dirty(ANewPage);
        Dec(AIndex, ADestPage.FStartIndex);
        AMoved := ADestPage.FUsedCount - AIndex - 1;
        System.Move(ADestPage.FItems[AIndex], ADestPage.FItems[AIndex + 1],
          AMoved * SizeOf(Pointer));
        ADestPage.FItems[AIndex] := p;
      end;
    end
    else
    begin
      Dec(AIndex, ADestPage.FStartIndex);
      if AIndex < ADestPage.FUsedCount then
      begin
        AMoved := (ADestPage.FUsedCount - AIndex);
        System.Move(ADestPage.FItems[AIndex], ADestPage.FItems[AIndex + 1],
          AMoved * SizeOf(TQListPage));
      end;
      ADestPage.FItems[AIndex] := p;
      Inc(ADestPage.FUsedCount);
      Dirty(APage + 1);
    end;
  end;
  Inc(FCount);
  if (p <> nil) and (ClassType <> TQPagedList) then
    Notify(p, lnAdded);
end;

function TQPagedList.Last: Pointer;
begin
  Result := Items[count - 1];
end;

procedure TQPagedList.Move(AFrom, ATo: Integer);
begin
  MoveTo(AFrom, ATo);
end;

procedure TQPagedList.MoveTo(AFrom, ATo: Integer);
var
  ATemp: Pointer;
begin
  if AFrom <> ATo then
  begin
    ATemp := Items[AFrom];
    Remove(AFrom);
    Insert(ATo, ATemp);
  end;
end;

procedure TQPagedList.Notify(Ptr: Pointer; Action: TListNotification);
begin

end;

function TQPagedList.Remove(Item: Pointer): Integer;
begin
  Result := RemoveItem(Item, FromBeginning);
end;

procedure TQPagedList.Remove(AIndex: Integer);
var
  APage: Integer;
begin
  APage := FindPage(AIndex);
  if APage >= 0 then
  begin
    Dec(AIndex, FPages[APage].FStartIndex);
    System.Move(FPages[APage].FItems[AIndex + 1], FPages[APage].FItems[AIndex],
      SizeOf(Pointer) * (FPages[APage].FUsedCount - AIndex - 1));
    Dec(FPages[APage].FUsedCount);
    CheckLastPage;
    Assert(FPages[APage].FUsedCount >= 0);
    Dirty(APage + 1);
  end;
end;
{$IFDEF UNICODE}

procedure TQPagedList.Sort(AOnCompare: TQPagedListSortCompareA);
begin
  TQPagedListSortCompareA(TMethod(FOnCompare).Code) := AOnCompare;
  TMethod(FOnCompare).Data := Pointer(-1);
  Sort;
end;
{$ENDIF}

procedure TQPagedList.SetCapacity(const Value: Integer);
begin
  // ��Ϊ���ݱ�����ʵ�ʲ����κ�����
end;

procedure TQPagedList.SetItems(AIndex: Integer; const Value: Pointer);
var
  APage: TQListPage;
begin
  APage := GetPage(AIndex);
  if APage <> nil then
  begin
    Dec(AIndex, APage.FStartIndex);
    APage.FItems[AIndex] := Value;
  end
  else
    raise Exception.Create('����Խ��:' + IntToStr(AIndex));
end;

procedure TQPagedList.SetOnCompare(const Value: TQPagedListSortCompare);
begin
  if (TMethod(FOnCompare).Code <> TMethod(Value).Code) or
    (TMethod(FOnCompare).Data <> TMethod(Value).Data) then
  begin
    FOnCompare := Value;
    if Assigned(Value) then
      Sort;
  end;
end;

procedure TQPagedList.Sort(AOnCompare: TQPagedListSortCompareG);
begin
  TMethod(FOnCompare).Code := @AOnCompare;
  TMethod(FOnCompare).Data := nil;
  Sort;
end;

procedure TQPagedList.Sort;
  procedure QuickSort(l, R: Integer);
  var
    I, J, p: Integer;
  begin
    repeat
      I := l;
      J := R;
      p := (l + R) shr 1;
      repeat
        while DoCompare(Items[I], Items[p]) < 0 do
          Inc(I);
        while DoCompare(Items[J], Items[p]) > 0 do
          Dec(J);
        if I <= J then
        begin
          if I <> J then
            Exchange(I, J);
          if p = I then
            p := J
          else if p = J then
            p := I;
          Inc(I);
          Dec(J);
        end;
      until I > J;
      if l < J then
        QuickSort(l, J);
      l := I;
    until I >= R;
  end;

begin
  if not Assigned(FOnCompare) then
    raise Exception.Create('δָ���������');
  if count > 0 then
    QuickSort(0, count - 1);
end;

function TQPagedList.RemoveItem(Item: Pointer; Direction: TDirection): Integer;
begin
  Result := IndexOfItem(Item, Direction);
  if Result > 0 then
    Remove(Result);
end;

{ TQListPage }

constructor TQListPage.Create(APageSize: Integer);
begin
  SetLength(FItems, APageSize);
  // OutputDebugString(PChar(IntToHex(IntPtr(Self), 8) + ' Created'));
end;

destructor TQListPage.Destroy;
begin
  // OutputDebugString(PChar(IntToHex(IntPtr(Self), 8) + ' Freed'));
  inherited;
end;

{ TQPagedListEnumerator }

constructor TQPagedListEnumerator.Create(AList: TQPagedList);
begin
  inherited Create;
  FList := AList;
  FIndex := -1;
end;

function TQPagedListEnumerator.GetCurrent: Pointer;
begin
  Result := FList[FIndex];
end;

function TQPagedListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FList.count - 1;
  if Result then
    Inc(FIndex);
end;

{ TQPagedStream }
constructor TQPagedStream.Create;
begin
  Create(8192);
end;

function TQPagedStream.ActiveOffset: Integer;
begin
  Result := FPosition mod FPageSize;
end;

function TQPagedStream.ActivePage: Integer;
begin
  Result := FPosition div FPageSize;
end;

procedure TQPagedStream.Clear;
var
  I: Integer;
begin
  for I := 0 to High(FPages) do
    FreeMem(FPages[I]);
  SetLength(FPages, 0);
  FSize := 0;
  FPosition := 0;
end;

constructor TQPagedStream.Create(APageSize: Integer);
begin
  inherited Create;
  if APageSize <= 0 then
    APageSize := 8192;
  FPageSize := APageSize;
end;

destructor TQPagedStream.Destroy;
begin
  Clear;
  inherited;
end;

function TQPagedStream.GetAsBytes: TBytes;
begin
  if Size > 0 then
  begin
    SetLength(Result, FSize);
    FPosition := 0;
    Read(Result[0], FSize);
  end
  else
    FSize := 0;
end;

function TQPagedStream.GetBytes(AIndex: Int64): Byte;
begin
  if AIndex + 1 > FSize then
    Result := 0
  else
    Result := PByte(IntPtr(FPages[AIndex div FPageSize]) +
      (AIndex mod FPageSize))^;
end;

function TQPagedStream.GetSize: Int64;
begin
  Result := FSize;
end;

procedure TQPagedStream.LoadFromFile(const FileName: string);
var
  AStream: TStream;
begin
  AStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(AStream);
  finally
    FreeAndNil(AStream);
  end;
end;

procedure TQPagedStream.LoadFromStream(Stream: TStream);
var
  ACount: Int64;
begin
  ACount := Stream.Size - Stream.Position;
  Capacity := ACount;
  CopyFrom(Stream, ACount);
end;

procedure TQPagedStream.PageNeeded(APageIndex: Integer);
begin
  if High(FPages) < APageIndex then
    Capacity := (APageIndex + 1) * FPageSize - 1;
end;

function TQPagedStream.Read(var Buffer; count: Longint): Longint;
var
  ACanRead: Int64;
  pBuf: PByte;
  APage, APageSpace, APageOffset, AToRead: Integer;
begin
  ACanRead := FSize - FPosition;
  Result := 0;
  if ACanRead >= count then
  begin
    if ACanRead < count then
      count := ACanRead;
    pBuf := @Buffer;
    while count > 0 do
    begin
      APage := ActivePage;
      APageOffset := ActiveOffset;
      APageSpace := FPageSize - ActiveOffset;
      if count > APageSpace then
        AToRead := APageSpace
      else
        AToRead := count;
      Dec(count, AToRead);
      Move(PByte(IntPtr(FPages[APage]) + APageOffset)^, pBuf^, AToRead);
      Inc(pBuf, AToRead);
      Inc(Result, AToRead);
      Inc(FPosition, AToRead);
    end;
  end;
end;

function TQPagedStream.Read(Buffer: TBytes; Offset, count: Longint): Longint;
begin
  if count > 0 then
    Result := Read(Buffer[Offset], count)
  else
    Result := 0;
end;

procedure TQPagedStream.SaveToFile(const FileName: string);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(AStream);
  finally
    FreeAndNil(AStream);
  end;
end;

procedure TQPagedStream.SaveToStream(Stream: TStream);
begin
  Stream.CopyFrom(Self, 0);
end;

function TQPagedStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  case Origin of
    soBeginning:
      Result := Offset;
    soCurrent:
      Result := FPosition + Offset;
    soEnd:
      Result := FSize - Offset
  else
    Result := 0;
  end;
  if Result > FSize then
    Result := FSize
  else if Result < 0 then
    Result := 0;
  FPosition := Result;
end;

procedure TQPagedStream.SetSize(const NewSize: Int64);
begin
  Capacity := NewSize;
end;

procedure TQPagedStream.SetAsBytes(const Value: TBytes);
begin
  Size := Length(Value);
  if Size > 0 then
    WriteBuffer(Value[0], Size);
end;

procedure TQPagedStream.SetBytes(AIndex: Int64; const Value: Byte);
begin
  if FSize < AIndex + 1 then
    Size := AIndex + 1;
  PByte(IntPtr(FPages[AIndex div FPageSize]) + (AIndex mod FPageSize))^
    := Value;
end;

procedure TQPagedStream.SetCapacity(Value: Int64);
var
  APageNum: Int64;
  I: Integer;
begin
  if Value < 0 then
    Value := 0;
  APageNum := (Value div FPageSize);
  if (Value mod FPageSize) <> 0 then
    Inc(APageNum);
  if FCapacity <> APageNum * FPageSize then
  begin
    FCapacity := APageNum * FPageSize;
    if Length(FPages) > APageNum then
    begin
      I := High(FPages);
      while I >= APageNum do
      begin
        FreeMem(FPages[I]);
        Dec(I);
      end;
      SetLength(FPages, APageNum);
    end
    else
    begin
      I := Length(FPages);
      SetLength(FPages, APageNum);
      while I < APageNum do
      begin
        GetMem(FPages[I], FPageSize);
        Inc(I);
      end;
    end;
  end;
end;

procedure TQPagedStream.SetSize(NewSize: Longint);
begin
  Capacity := NewSize;
end;

function TQPagedStream.Write(const Buffer: TBytes;
  Offset, count: Longint): Longint;
begin
  if count > 0 then
    Result := Write(Buffer[Offset], count)
  else
    Result := 0;
end;

function TQPagedStream.Write(const Buffer; count: Longint): Longint;
var
  ADest: PByte;
  APageIndex, APageOffset, APageSpace: Integer;
  AOffset: Int64;
  pBuf: PByte;
begin
  Result := 0;
  if count > 0 then
  begin
    AOffset := FPosition + count;
    PageNeeded(AOffset div FPageSize);
    APageIndex := ActivePage;
    APageOffset := ActiveOffset;
    APageSpace := FPageSize - APageOffset;
    pBuf := @Buffer;
    while count > 0 do
    begin
      ADest := PByte(IntPtr(FPages[APageIndex]) + APageOffset);
      if APageSpace < count then
      begin
        Move(pBuf^, ADest^, APageSpace);
        Inc(APageIndex);
        Dec(count, APageSpace);
        Inc(Result, APageSpace);
        Inc(pBuf, APageSpace);
        APageOffset := 0;
        APageSpace := FPageSize;
      end
      else
      begin
        Move(pBuf^, ADest^, count);
        Inc(Result, count);
        Break;
      end;
    end;
    Inc(FPosition, Result);
    if FSize < FPosition then
      FSize := FPosition;
  end;
end;

const
  PR_ORDERED = 9; // �������˳������ʱ����12345����ʱÿ���ظ��ַ���С��Ȩֵ
  PR_REPEAT = 5; // ��������ظ�������ʱ����aaaa����ʱÿ���ظ����ٵ�Ȩֵ
  PR_CHARTYPE = 20; // ÿ����һ����ͬ���͵��ַ�ʱ�����ӵ�Ȩֵ
  PR_LENGTH = 10; // ÿ����һ���ַ�ʱ�����ӵ�Ȩֵ
  PR_CHART = 20; // ���������ֺ���ĸ�Ŀ����ַ�ʱ���������ӵ�Ȩֵ
  PR_UNICODE = 40; // ����Unicode�ַ�ʱ���������ӵ�Ȩֵ

function PasswordScale(const S: QStringW): Integer;
var
  p: PQCharW;
  ARules: TPasswordRules;
  AMaxOrder, AMaxRepeat, ACharTypes: Integer;
  function RepeatCount: Integer;
  var
    t: PQCharW;
  begin
    t := p;
    Inc(t);
    Result := 0;
    while t^ = p^ do
    begin
      Inc(Result);
      Inc(t);
    end;
    if Result > AMaxRepeat then
      AMaxRepeat := Result;
  end;

  function OrderCount: Integer;
  var
    t, tl: PQCharW;
    AStep: Integer;
  begin
    t := p;
    tl := p;
    Inc(t);
    AStep := Ord(t^) - Ord(p^);
    Result := 0;
    while Ord(t^) - Ord(tl^) = AStep do
    begin
      Inc(Result);
      tl := t;
      Inc(t);
    end;
    if Result > AMaxOrder then
      AMaxOrder := Result;
  end;

begin
  if LowerCase(S) = 'password' then
    Result := 0
  else
  begin
    Result := Length(S) * PR_LENGTH;
    p := PQCharW(S);
    ARules := [];
    AMaxOrder := 0;
    AMaxRepeat := 0;
    while p^ <> #0 do
    begin
      if (p^ >= '0') and (p^ <= '9') then
        ARules := ARules + [prIncNumber]
      else if (p^ >= 'a') and (p^ <= 'z') then
        ARules := ARules + [prIncLowerCase]
      else if (p^ >= 'A') and (p^ <= 'Z') then
        ARules := ARules + [prIncUpperCase]
      else if p^ > #$7F then
        ARules := ARules + [prIncUnicode]
      else
        ARules := ARules + [prIncChart];
      if RepeatCount > 2 then
        ARules := ARules + [prRepeat];
      if OrderCount > 2 then
        ARules := ARules + [prSimpleOrder];
      Inc(p);
    end;
    if prSimpleOrder in ARules then
      Result := Result - AMaxOrder * PR_ORDERED;
    if prRepeat in ARules then
      Result := Result - AMaxRepeat * PR_REPEAT;
    ACharTypes := 0;
    if prIncNumber in ARules then
      Inc(ACharTypes);
    if prIncLowerCase in ARules then
      Inc(ACharTypes);
    if prIncUpperCase in ARules then
      Inc(ACharTypes);
    if prIncChart in ARules then
    begin
      Inc(ACharTypes);
      Result := Result + PR_CHART;
    end;
    if prIncUnicode in ARules then
    begin
      Inc(ACharTypes);
      Result := Result + PR_UNICODE;
    end;
    Result := Result + (ACharTypes - 1) * PR_CHARTYPE;
    // ����ǿ�ȵ�ȡֵ��Χ��<0
    if Result < 0 then
      Result := 0;
  end;
end;

function CheckPassword(const AScale: Integer): TPasswordStrongLevel; overload;
begin
  if AScale < 60 then
    Result := pslLowest
  else if AScale < 100 then
    Result := pslLower
  else if AScale < 150 then
    Result := pslNormal
  else if AScale < 200 then
    Result := pslHigher
  else
    Result := pslHighest;
end;

function CheckPassword(const S: QStringW): TPasswordStrongLevel; overload;
begin
  Result := CheckPassword(PasswordScale(S));
end;

function SimpleChineseToTraditional(S: QStringW): QStringW;
begin
{$IFDEF MSWINDOWS}
  SetLength(Result, Length(S) shl 1);
  SetLength(Result, LCMapStringW(2052, LCMAP_TRADITIONAL_CHINESE, PWideChar(S),
    Length(S), PWideChar(Result), Length(Result)));
{$ELSE}
  raise Exception.CreateFmt(SUnsupportNow, ['SimpleChineseToTraditional']);
{$ENDIF}
end;

function TraditionalChineseToSimple(S: QStringW): QStringW;
begin
{$IFDEF MSWINDOWS}
  SetLength(Result, Length(S) shl 1);
  SetLength(Result, LCMapStringW(2052, LCMAP_SIMPLIFIED_CHINESE, PWideChar(S),
    Length(S), PWideChar(Result), Length(Result)));
{$ELSE}
  raise Exception.CreateFmt(SUnsupportNow, ['TraditionalChineseToSimple']);
{$ENDIF}
end;

function MoneyRound(const AVal: Currency; ARoundMethod: TMoneyRoundMethod)
  : Currency;
var
  V, R: Int64;
begin
  if ARoundMethod = mrmNone then
  begin
    Result := AVal;
    Exit;
  end;
  V := PInt64(@AVal)^;
  R := V mod 100;
  if ARoundMethod = mrmSimple then
  begin
    if R >= 50 then
      PInt64(@Result)^ := ((V div 100) + 1) * 100
    else
      PInt64(@Result)^ := (V div 100) * 100;
  end
  else
  begin
    {
      ���������忼�ǣ�
      ������ͽ�һ��
      �����㿴��ż��
      ��ǰΪżӦ��ȥ��
      ��ǰΪ��Ҫ��һ�� }
    if R > 50 then // ����
      PInt64(@Result)^ := ((V div 100) + 1) * 100
    else if R = 50 then //
    begin
      if (((V div 100)) and $1) <> 0 then // ����
        PInt64(@Result)^ := ((V div 100) + 1) * 100
      else
        PInt64(@Result)^ := (V div 100) * 100;
    end
    else
      PInt64(@Result)^ := (V div 100) * 100;
  end;
end;
{
  ������ֵת��Ϊ���ִ�д
  Parameters
  AVal : ����ֵ
  AFlags : ��־λ��ϣ��Ծ����������ĸ�ʽ
  ANegText : ������ֵΪ����ʱ����ʾ��ǰ׺
  AStartText : ǰ���ַ������硰����ң���
  AEndText : �����ַ������硰����
  AGroupNum : ������ÿ���������䵥λ����һ�����飬AGroupNumָ��Ҫ�����������
  ��Ϊ0ʱ������Ա�־λ�е�MC_HIDE_ZERO��MC_MERGE_ZERO
  ARoundMethod : ������뵽��ʱ���㷨
  AEndDigts : С������λ����-16~4 ֮��
  Returns
  ���ظ�ʽ������ַ���
  Examples
  MoneyCap(1.235,MC_READ,L"",L"",L"",0)=ҼԪ��������
  MoneyCap(1.235,MC_READ,L"",L"",L"",4)=��ʰҼԪ��������
  MoneyCap(100.24,MC_READ,L"",L"",L"",4)=Ҽ��Ԫ�㷡������
  MoneyCap(-10012.235,MC_READ,L"��",L"��",L"",0)=����Ҽ����Ҽʰ��Ԫ��������
  MoneyCap(101005,MC_READ,L"��",L"",L"",0)=Ҽʰ��ҼǪ����Ԫ
}

function CapMoney(AVal: Currency; AFlags: Integer;
  ANegText, AStartText, AEndText: QStringW; AGroupNum: Integer;
  ARoundMethod: TMoneyRoundMethod; AEndDigits: Integer = 2): QStringW;
const
  Nums: array [0 .. 9] of WideChar = (#$96F6 { �� } , #$58F9 { Ҽ } ,
    #$8D30 { �� } , #$53C1 { �� } , #$8086 { �� } , #$4F0D { �� } , #$9646 { ½ } ,
    #$67D2 { �� } , #$634C { �� } , #$7396 { �� } );
  Units: array [0 .. 19] of WideChar = (#$94B1 { Ǯ } , #$5398 { �� } ,
    #$5206 { �� } , #$89D2 { �� } , #$5706 { Բ } , #$62FE { ʰ } , #$4F70 { �� } ,
    #$4EDF { Ǫ } , #$4E07 { �� } , #$62FE { ʰ } , #$4F70 { �� } , #$4EDF { Ǫ } ,
    #$4EBF { �� } , #$62FE { ʰ } , #$4F70 { �� } , #$4EDF { Ǫ } , #$4E07 { �� } ,
    #$5146 { �� } , #$62FE { ʰ } , #$4F70 { �� } );
var
  R, V: Int64;
  I: Integer;
  ATemp: QStringW;
  pd, pe, p, pu: PWideChar;

begin
  AVal := MoneyRound(AVal, ARoundMethod);
  { -922,337,203,685,477.5808 ~ 922,337,203,685,477.5807 }
  V := PInt64(@AVal)^; // ��ȷ����
  if V < 0 then
    V := -V
  else
    SetLength(ANegText, 0);
  if (AFlags and MC_END_PATCH) <> 0 then // ���Ҫ����AEndText������������λ
    AFlags := AFlags or MC_UNIT;
  if AGroupNum > 0 then // ���Ҫ����
  begin
    AFlags := AFlags and (not(MC_MERGE_ZERO or MC_HIDE_ZERO));
    if AGroupNum > 20 then
      AGroupNum := 20;
  end;
  if AEndDigits < -16 then
    AEndDigits := -16
  else if AEndDigits > 4 then
    AEndDigits := 4;
  SetLength(ATemp, 40); // ��󳤶�Ϊ40
  pd := PWideChar(ATemp) + 39;
  I := 0;
  while V > 0 do
  begin
    R := V mod 10;
    V := V div 10;
    pd^ := Units[I];
    Dec(pd);
    pd^ := Nums[R];
    Dec(pd);
    Inc(I);
  end;
  if AGroupNum > 0 then
  begin
    if I > AGroupNum then
      raise Exception.CreateFmt(STooSmallCapMoneyGroup, [AGroupNum, I]);
    while AGroupNum > I do // Ҫ��ķ�������
    begin
      pd^ := Units[I];
      Dec(pd);
      pd^ := Nums[0];
      Dec(pd);
      Inc(I);
    end;
  end;
  Inc(pd);
  if (AFlags and MC_HIDE_ZERO) <> 0 then // �������������ֵ��������
  begin
    while pd^ <> #0 do
    begin
      if pd^ = Nums[0] then
        Inc(pd, 2)
      else
        Break;
    end;
  end;

  SetLength(Result, PWideChar(ATemp) + 40 - pd);
  p := PWideChar(Result);
  pe := PWideChar(ATemp) + 32 + AEndDigits * 2;
  while pd < pe do
  begin
    if (AFlags and MC_NUM) <> 0 then
    begin
      p^ := pd^;
      Inc(p);
      if ((AFlags and MC_MERGE_ZERO) <> 0) and (pd^ = Nums[0]) then
      begin
        pu := pd;
        Inc(pu);
        while pd^ = Nums[0] do
          Inc(pd, 2);
        if pd^ = #0 then
        begin
          Dec(p);
          if (AFlags and MC_UNIT) <> 0 then
          begin
            if pu^ = Units[4] then
            begin
              p^ := Units[4];
              Inc(p);
            end;
          end;
        end;
        continue;
      end;
    end;
    Inc(pd);
    if (AFlags and MC_UNIT) <> 0 then
    begin
      p^ := pd^;
      Inc(p);
    end;
    Inc(pd);
  end;
  SetLength(Result, p - PWideChar(Result));
  if (AFlags and MC_UNIT) <> 0 then
  begin
    if (AFlags and MC_END_PATCH) <> 0 then
    begin
      if PWideChar(Result)[Length(Result) - 1] = Units[2] then // ��
        Result := AStartText + ANegText + Result
      else
        Result := AStartText + ANegText + Result + AEndText;
    end
    else
      Result := AStartText + ANegText + Result;
  end
  else
    Result := AStartText + ANegText + Result;
end;

{ TQBits }

function TQBits.GetIsSet(AIndex: Integer): Boolean;
begin
  if (AIndex < 0) or (AIndex >= Size) then
    Result := False
  else
    Result := (FBits[AIndex shr 3] and ($80 shr (AIndex and $7))) <> 0;
end;

function TQBits.GetSize: Integer;
begin
  Result := Length(FBits) shl 3;
end;

procedure TQBits.SetIsSet(AIndex: Integer; const Value: Boolean);
var
  AByteIdx: Integer;
begin
  if (AIndex < 0) or (AIndex >= Size) then
    raise QException.CreateFmt(SOutOfIndex, [AIndex, 0, Size - 1]);
  AByteIdx := AIndex shr 3;
  if Value then
    FBits[AByteIdx] := FBits[AByteIdx] or ($80 shr (AIndex and $7))
  else
    FBits[AByteIdx] := FBits[AByteIdx] and (not($80 shr (AIndex and $7)));
end;

procedure TQBits.SetSize(const Value: Integer);
begin
  if (Value and $7) <> 0 then
    SetLength(FBits, (Value shr 3) + 1)
  else
    SetLength(FBits, Value shr 3);
end;

function CheckChineseId18(CardNo: QStringW): QCharW;
var
  Sum, Idx: Integer;
const
  Weight: array [1 .. 17] of Integer = (7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10,
    5, 8, 4, 2);
  Checksums: array [0 .. 10] of WideChar = ('1', '0', 'X', '9', '8', '7', '6',
    '5', '4', '3', '2');
begin
  if (Length(CardNo) >= 17) then
  begin
    Sum := 0;
    for Idx := 1 to 17 do
      Sum := Sum + (Ord(CardNo[Idx]) - Ord('0')) * Weight[Idx];
    Result := Checksums[Sum mod 11];
  end
  else
    Result := #0;
end;

function ChineseId15To18(CardNo: QStringW): QStringW;
begin
  if (Length(CardNo) <> 15) then
    raise Exception.Create('15λת18λ����Ҫ�����֤�ű���Ϊ15λ��');
  CardNo := LeftStrW(CardNo, 6, False) + '19' + RightStrW(CardNo, 9, False);
  Result := CardNo + CheckChineseId18(CardNo);
end;

function DecodeChineseId(CardNo: QStringW; var AreaCode: QStringW;
  var Birthday: TDateTime; var IsFemale: Boolean): Boolean;
var
  len: Integer;
  Y, M, d: Integer;
  p: PQCharW;
begin
  len := Length(CardNo);
  Result := False;
  if (len in [15, 18]) then // ���ȼ��
  begin
    if (Length(CardNo) = 15) then
      CardNo := ChineseId15To18(CardNo);
    if CheckChineseId18(CardNo) <> CardNo[18] then // ���֤��У������
      Exit;
    p := PQCharW(CardNo);
    AreaCode := StrDupX(p, 6);
    Inc(p, 6);
    if not TryStrToInt(StrDupX(p, 4), Y) then // ��
      Exit;
    Inc(p, 4);
    if not TryStrToInt(StrDupX(p, 2), M) then // ��
      Exit;
    Inc(p, 2);
    if not TryStrToInt(StrDupX(p, 2), d) then // ��
      Exit;
    Inc(p, 2);
    if not TryEncodeDate(Y, M, d, Birthday) then
      Exit;
    if Birthday > Now then
      Exit;
    if TryStrToInt(StrDupX(p, 3), Y) then
    begin
      Result := True;
      if (Y mod 2 = 1) then
        IsFemale := True
      else
        IsFemale := False;
    end
  end
  else
    Result := False;
end;

function IsChineseIdNo(CardNo: QStringW): Boolean;
var
  AreaCode: QStringW;
  Birthday: TDateTime;
  IsFemale: Boolean;
begin
  Result := DecodeChineseId(CardNo, AreaCode, Birthday, IsFemale);
end;

function IsEmailAddr(S: QStringW): Boolean;
var
  p: PQCharW;
  At: Integer;
  Dot: Integer;
begin
  p := PQCharW(S);
  At := 0;
  Dot := 0;
  while p^ <> #0 do
  begin
    if p^ = '@' then
      Inc(At)
    else if p^ = '.' then
      Inc(Dot);
    Inc(p);
  end;
  Result := (At = 1) and (Dot > 0);
end;

function IsChineseMobile(S: QStringW): Boolean;
var
  p: PQCharW;
begin
  if (Length(S) = 14) and StartWithW(PQCharW(S), '+86', False) then
    S := RightStrW(S, 11, False);
  if (Length(S) = 11) then
  begin
    p := PQCharW(S);
    if p^ = '1' then // �й��ֻ�����1��ͷ��
    begin
      Result := True;
      while p^ <> #0 do
      begin
        if (p^ >= '0') and (p^ <= '9') then
          Inc(p)
        else
        begin
          Result := False;
          Exit;
        end;
      end;
    end
    else
      Result := False;
  end
  else
    Result := False;
end;

function SizeOfFile(const S: QStringW): Int64;
var
  sr: TSearchRec;
begin
  if FindFirst(S, 0, sr) = 0 then
  begin
    Result := sr.Size;
    sysutils.FindClose(sr);
  end
  else
    Result := -1;
end;

initialization

{$IFDEF MSWINDOWS}
  hMsvcrtl := LoadLibrary('msvcrt.dll');
if hMsvcrtl <> 0 then
begin
  VCStrStr := TMSVCStrStr(GetProcAddress(hMsvcrtl, 'strstr'));
  VCStrStrW := TMSVCStrStrW(GetProcAddress(hMsvcrtl, 'wcsstr'));
  VCMemCmp := TMSVCMemCmp(GetProcAddress(hMsvcrtl, 'memcmp'));
end
else
begin
  VCStrStr := nil;
  VCStrStrW := nil;
  VCMemCmp := nil;
end;
{$ENDIF}
IsFMXApp := GetClass('TFmxObject') <> nil;

finalization

{$IFDEF MSWINDOWS}
if hMsvcrtl <> 0 then
  FreeLibrary(hMsvcrtl);
{$ENDIF}

end.
