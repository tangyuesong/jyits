unit qjson;
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
  2016.2.24
  ==========
  * ������ ItemByPath ʱ����������·���������ڵ����⣨�ֺ뱨�棩
  2016.1.25
  ==========
  * ������ TQHashedJson ������ʱ����ǰ�ͷ��� FHashTable ������
  2016.1.23
  ==========
  * �޸� SetValue �����Զ�������͵Ĵ��룬�����׳��쳣

  2016.1.11
  ==========
  + ���� Equals �����ж����� JSON �����Ƿ���ͬ
  + ���� CommentStyle �� Comment ����������ע
  + ���� Merge/Intersect/Diff �������������ݵĺϲ������غͲ���Ƚ�
  2015.11.19
  ===========
  * ������TQHashedJson��ӽ��ʱ��û����ȷ�����ƽ��й�ϣ�����⣨QQ���棩
  * ������ FromRtti �� Win64 ʱ�����û��������ʱ���������

  2015.10.30
  ===========
  * ������TQJsonStreamHelper.EndArrayʱ��JSON������ܳ��������(�й����챨�棩
  2015.10.23
  ===========
  + ForceName ȷ��ָ�������ƴ���

  2015.10.20
  ==========
  + Exists �����ж��Ƿ����ָ��·�����ӽ�㣨��ľ���飩
  + Sort �����ӽ�㣨�ֺ뽨�飩
  + ExchangeOrder �����������
  + ContainsName �ж��Ƿ���ָ�����Ƶ��ӽ��
  + ContainsValue �ж��Ƿ����ָ��ֵ���ӽ�㣨�ഺ���飩

  2015.10.8
  ==========
  * ����������ĩβ�����ո�ʱ������Զ��Ƴ�������

  2015.9.22
  ==========
  * ������TQJsonStreamHelperд����������ʱ�����û����Ԫ��ʱ��ɸ�ʽ���ҵ�����

  2015.7.20
  ==========
  * ������ ToRtti ʱ�Բ���Ĭ��ֵ�������ԵĿ��Ʒ���
  * ������ ToRtti �� FromRtti ���� TDateTime �������Ե����⣨��л����һ��ƽ����
  2015.6.23
  =========
  + ���� TQJsonStreamHelper ����ֱ��������д�� JSON ��ʽ�����ݣ��ŵ�������ʡ����
  TQJson����Ĵ�����ά�ٶȸ��죬ȱ������Ҫ���п��Ƹ���Ĳ��裨������Ͷ���ıպϣ�
  2015.5.22
  =========
  + ���Ӷ����Ʊ���ΪBase64��Ĭ�����ú��� EncodeJsonBinaryAsBase64�����Ҫ�ָ�Ĭ�ϣ�����
  EncodeJsonBinaryAsHex

  2015.4.21
  =========
  + IgnoreCase �������ڿ���Json������������ִ�Сд���ԣ�Ĭ�ϼ̳���ȫ�ֵ�JsonCaseSensitive����ֵ���ֺ뽨�飩
  + Root �������ڷ��ظ����
  * HashName �� TQHashedJson �Ƶ� TQJson
  2015.2.6
  =========
  * ������ AsInteger/AsFloat ʱ��֧��ʮ�����Ƶ�����

  2015.2.1
  =========
  * �޸��˽����ͱ������Ϊ����������Ϊ���ַ�����JSON���루��л Synopse��
  2015.1.26
  ==========
  + �����޲�����Delete��������ɾ���������

  2015.1.19
  ==========
  * �����˱���ʱ��һЩ�ض��ַ�Ϊ�����������������Ա�ֶ��Լ����Ʊ���Ľ�������ӿɶ��ԣ���ľ���飩
  * �������ظ����� FromRtti ʱû�����ĩ��ֵ�����⣨��ľ���棩

  2015.1.13
  ==========
  * ������ TQHashedJson �� IndexOf δ��ȷ�����Сд������
  * ������ TQHashedJson �ڽ�����ɺ�δ��ȷ���¼����ϣֵ�����⣨��ľ���棩
  * �����˽�����ֵ����ʱ Parse ʱδ��ȷ�Ƴ����ƿո������

  2015.1.6
  ========
  * ������SetAsVariant�ԷǱ�׼�ı������͵�֧�����⣨С�㱨�棩

  2015.1.5
  =========
  * ������IsChildOf��һ���жϴ�����ɿ��ܷ���AV�쳣

  2015.1.4
  =========
  * �޸��� ItemByName �Ĳ��ִ��룬������û����ȷ���� JsonCaseSensitive ��ǵ�����,��ɺ��Դ�Сд��Ч������(��ľ��
  * ������ ItemByName �������±괦����߼�����
  * ������ ItemByPath ��֧�ֶ�ά���������
  2015.1.3
  =========
  * SaveToStream/SaveToFile ������һ��ADoFormat�������Ա�����Ƿ��ʽ�����ֺ롢��ľ���飩
  2014.12.24
  ==========
  * �����˽���Json�а���ע��ʱ��������ȫ������⣨kylix2008���棩

  2014.12.13
  ==========
  + ����HasChild���������ж�ָ��·�����ӽ���Ƿ���ڣ���ľ���飩

  2014.11.25
  ==========
  * �޸���ItemByPath�Ĵ��룬֧�ְ�����˳��������jdtObject���͵��ӳ�Ա

  2014.11.24
  ==========
  * ������ToRtti.FoArray����Ϊ��������������δ�ҵ�ʱ����ʾ�쳣

  2014.11.20
  ==========
  + ����AsBytes���ԣ���֧�ֶ������������ͣ�Ĭ��ʵ��ֱ��ʹ�õ�ʮ�������ַ�����
  �ϲ��������OnQJsonEncodeBytes��OnQJsonDecodeBytes�¼����滻Ϊ�Լ���ʵ�֣���
  ZLib+Base64��
  + ����ValueFromStream/ValueFromFile/StreamFromValue/StreamFromFile����

  2014.11.14
  ==========
  * ������GetAsVariantʱû�д���jdtNull���͵�����

  2014.11.13
  ==========
  + ����IsBool�����жϵ�ǰֵ�Ƿ���ת��Ϊ����ֵ���ʣ����¹�_???-���飩
  2014.11.10
  ==========
  * ������FromRtti/ToRtti�ڴ���TCollection����ʱ���ڵ�����(��ľ����)
  * ������FromRtti��ToObject�Ӻ�����һ������(hq200306����)

  2014.11.6
  ==========
  * ������FromRttiʱ��������Ԫ����ӽ��ʱ��AName��д��Name��ɽ��δ���������⣨��ľ���棩
  + ����IntByPath,IntByName��BoolByPath,BoolByName,FloatByPath,FloatByName,DateTimeByPath,
  DateTimeByName�������Լ��жϱ��(FreeSpace8����)

  2014.10.30
  ==========
  + ����Detach��AttachTo��MoveTo��Remove����
  * ����Json��������������Ա������MoveTo��AttachToʱԪ��δ����

  2014.9.11
  =========
  * �����˴������ļ��м��ؿհ�JSON����Ͷ���ʱ��������⣨�ֺ뱨�棩
  * �޸�ֱ�ӽ��Ƕ��������ֵ���浽���еĲ��ԣ������ٷʱ��棩��
  1�����JSON���������Ѿ�ָ�����򱣴�Ϊ�����һ���Ӷ���
  2�����δָ�����ƣ�������Ϊδ֪��ΪjdtNull���򲻱����κ�����
  2014.9.3
  =========
  * �����˽��������ַ���ֵʱ���ܶ�ʧ�ַ�������(��ľ����)

  2014.8.27
  =========
  * �����˽����������������ǰ����ע��ʱ���������(��ľ����)
  2014.8.15
  =========
  * ������Add�����Զ������������ʱ������ض���ʽ��11,23ʱ�������������(Tuesday����)
  2014.7.31
  =========
  * �����˽�������ʱ������й�����ϵͳ�쳣�޷�������ʾ������(����С�ױ���)
  * �����˽���ʱ����������ѭ�������⣨����С�ױ��棩
  * �����˳����쳣ʱ���쳣����ʾ�ظ�������
  * ������ForcePathʱ'array[].subobjectname'δ��ȷ����·��������(����С�ױ���)
  2014.7.28
  =========
  * ������ToRtti���Դ����������ʱ�����ͣ���JSONΪnullʱ�������������(�ֺ걨��)
  * �޸�ToRecord��������Ϊvar��������const(�ֺ걨��)
  2014.7.16
  =========
  * ������GetPathʱ��δ��ʼ������ַ������Path���Կ��ܳ��������(����С�ױ���)
  2014.7.6
  =========
  + ToRtti����Ծ�̬�������͵�֧��

  2014.7.3
  =========
  * ������Assignʱ�����˵�ǰ������Ƶ�����

  2014.7.1
  =========
  * AsString�޸�jdtNull/jdtUnknownʱ����Ϊ���ؿ��ַ���
  2014.6.28
  =========
  * ������ForcePath('Items[]')Ĭ������˿��ӽ�������(pony,��������)
  + ����JsonRttiEnumAsIntȫ��ѡ�����ö��ֵ�ͼ���ֵ�Ƿ񱣴�����ַ�����Ĭ��ΪTrue(�ֺ뽨��)
  2014.6.27
  =========
  + ����TryParse�������ֺ뽨�飩
  * �޸���Encodeʱ���Լ�������Ҳ�ӵ��˽���ַ����е����⣨�ֺ뱨�棩
  * ������FromRTTIʱ�����ڷ������¼�������û�н��й��˵�����
  * ������ToRtti.ToArrayʱ�����ڶ�̬��������ó���ʱ���ʹ��󣨻ֺ뱨�棩
  2014.6.26
  ==========
  * ������ToRtti.ToRecord�Ӻ���������������ʱ�Ĵ���(��лȺ�ѻֺ������RTTI����Ͳ���)
  * ����HPPEMITĬ�����ӱ���Ԫ(�����ٷ� ����)
  2014.6.23
  ==========
  + FromRecord֧�ֶ�̬�������ͨ����
  2014.6.21
  ==========
  * �Ƴ�ԭ��AddObject/AddRecord/ToObject/ToRecord֧��
  + ���FromRtti/ToRtti/FromRecord/ToRecord/ToRttiValue����֧�֣��滻ԭ����RTTI����
  + ���Invoke������֧��ֱ��ͨ��Json���ö�Ӧ�ĺ���������ο�Demo
  2014.6.17
  =========
  * AsFloat��ֵʱ�����Nan��Infinite��NegInfinite������Чֵ�ļ��
  * AsVariant��ֵʱ�����varNull,varEmpty,varUnknown,varUInt64���͵�֧��
  2014.5.27
  ==========
  + TQHashedJson ֧�֣�����һ�������ѯ�Ż��İ汾��ʹ�ù�ϣ��ӿ�ItemByName�Ĳ�ѯ�ٶȣ�
  �������Ӧ���д�����ʹ��ItemByName��ItemByPath�Ȳ�ѯ��ʹ��������TQJson������Ӧֱ��
  ʹ��TQJson

  2014.5.14
  =========
  + ����CopyIf/DeleteIf/FindIf����
  + ����for..in�﷨֧��
  * ������Encode��ForcePath���ܴ��ڵ�����

  2014.5.6
  ========
  + ����ParseBlock��������֧����ʽ���ͷֶν���
  * �����˽���\uxxxxʱ��ʶ�����
  * �޸�Parse����Ϊ��������ӽ��

  2014.5.4
  ========
  + �����JavaScript��.net������ʱ������/DATE(MillSeconds+TimeZone)/��ʽ��֧��
  * Json����֧�ּ���VCL��TDateTime����֧�֣����ɵ�JSON����Ĭ����JsonDateFormat��
  JsonTimeFormat,JsonDateTimeFormat�����������ƣ����StrictJson����ΪTrue����
  ����/DATE(MillSeconds+TimeZone)/��ʽ
  ��ע��
  ����ʱ�����ͽ�����������ʱ������JSON��ʵ������Ϊ�ַ����������ַ����ٴδ�ʱ
  ����ʧ������Ϣ�������Կ���ֱ����AsDateTime��������д���������ʱ������ʹ��
  JavaScript��.net��ʽ���Ұ�����ʱ����Ϣ����ʱ�佫��ת��Ϊ��������ʱ�䡣

  2014.5.1
  ========
  + ����AddRecord������֧��ֱ�ӱ����¼���ݣ����������͵ĳ�Ա�ᱻ����
  ����(Class)������(Method)���ӿ�(Interface)����������(ClassRef),ָ��(Pointer)������(Procedure)
  �������ܸ���ʵ����Ҫ�����Ƿ����֧��
  + ����ToRecord���������Jsonֱ�ӵ���¼���͵�ת��
  + ����Copy�������ڴ�����ǰ����һ������ʵ����ע��Ŀǰ�汾��¡�ڲ�������Copy�������������ܸĵ�
  * ������Assign������һ������
}
// ���Ի�����ΪDelphi 2007��XE6�������汾�Ŀ����������������޸�
uses classes, sysutils, math, qstring, typinfo, qrbtree,
  EncdDecd{$IF RTLVersion>27},
  System.NetEncoding{$IFEND}
{$IFDEF MSWINDOWS}, windows{$ENDIF}
{$IFDEF UNICODE}, Generics.Collections{$ENDIF}{$IF RTLVersion>=21},
  Rtti{$IFEND >=XE10}
{$IF RTLVersion<22}// 2007-2010
{$IFDEF ENABLE_REGEX}
    , PerlRegEx, pcre
{$ENDIF}
{$ELSE}
    , RegularExpressionsCore
{$IFEND}
    ;
{$M+}
{$HPPEMIT '#pragma link "qjson"'}
{$HPPEMIT '#pragma link "soaprtl.lib"'}

// ���Ҫʹ����������ʾ��ʽ����TForm1.FormCreate,����������Ķ��壬���򷽷���ΪForm1.FormCreate
{ .$DEFINE TYPENAMEASMETHODPREF }
type
  /// ����Ԫ��QDAC����ɲ��֣���QDAC��Ȩ���ƣ��������QDAC��վ�˽�
  /// <summary>
  /// JSON������Ԫ�����ڿ��ٽ�����ά��JSON�ṹ.ȫ�ֱ���StrictJsonΪFalseʱ��֧��
  /// ע�ͺ����Ʋ�����'"'��
  /// </summary>
  /// TQJsonDataType���ڼ�¼JSON����Ԫ�����ͣ���ȡֵ������
  /// <list>
  /// <item>
  /// <term>jdtUnknown</term><description>δ֪���ͣ�ֻ���¹������δ��ֵʱ���Ż��Ǹ�����</description>
  /// </item>
  /// <item>
  /// <term>jdtNull</term><description>NULL</description>
  /// </item>
  /// <item>
  /// <term>jdtString</term><description>�ַ���</description>
  /// </item>
  /// <item>
  /// <term>jdtInteger</term><description>����(Int64,��������ֵ����ڲ���ʹ��64λ��������)</description>
  /// </item>
  /// <item>
  /// <term>jdtFloat</term><description>˫���ȸ�����(Double)</description>
  /// </item>
  /// <item>
  /// <term>jdtBoolean</term><description>����</description>
  /// </item>
  /// <item>
  /// <term>jdtDateTime</term><description>����ʱ������</description>
  /// </item>
  /// <item>
  /// <term>jdtArray</term><description>����</description>
  /// </item>
  /// <item>
  /// <term>jdtObject</term><description>����</description>
  /// </item>
  /// </list>
  TQJsonDataType = (jdtUnknown, jdtNull, jdtString, jdtInteger, jdtFloat,
    jdtBoolean, jdtDateTime, jdtArray, jdtObject);
  TQJson = class;
{$IF RTLVersion>=21}
  /// <summary>
  /// RTTI��Ϣ���˻ص���������XE6��֧��������������XE����ǰ�İ汾�����¼��ص�
  /// </summary>
  /// <param name="ASender">�����¼���TQJson����</param>
  /// <param name="AName">������(AddObject)���ֶ���(AddRecord)</param>
  /// <param name="AType">���Ի��ֶε�������Ϣ</param>
  /// <param name="Accept">�Ƿ��¼�����Ի��ֶ�</param>
  /// <param name="ATag">�û��Զ���ĸ������ݳ�Ա</param>
  TQJsonRttiFilterEventA = reference to procedure(ASender: TQJson;
    AObject: Pointer; AName: QStringW; AType: PTypeInfo; var Accept: Boolean;
    ATag: Pointer);
  /// <summary>
  /// �����˴�����������XE6��֧����������
  /// </summary>
  /// <param name="ASender">�����¼���TQJson����</param>
  /// <param name="AItem">Ҫ���˵Ķ���</param>
  /// <param name="Accept">�Ƿ�Ҫ����ö���</param>
  /// <param name="ATag">�û����ӵ�������</param>
  TQJsonFilterEventA = reference to procedure(ASender, AItem: TQJson;
    var Accept: Boolean; ATag: Pointer);
{$IFEND >=2010}
  /// <summary>
  /// RTTI��Ϣ���˻ص���������XE6��֧��������������XE����ǰ�İ汾�����¼��ص�
  /// </summary>
  /// <param name="ASender">�����¼���TQJson����</param>
  /// <param name="AName">������(AddObject)���ֶ���(AddRecord)</param>
  /// <param name="AType">���Ի��ֶε�������Ϣ</param>
  /// <param name="Accept">�Ƿ��¼�����Ի��ֶ�</param>
  /// <param name="ATag">�û��Զ���ĸ������ݳ�Ա</param>
  TQJsonRttiFilterEvent = procedure(ASender: TQJson; AObject: Pointer;
    AName: QStringW; AType: PTypeInfo; var Accept: Boolean; ATag: Pointer)
    of object;
  /// <summary>
  /// �����˴�����������XE6��֧����������
  /// </summary>
  /// <param name="ASender">�����¼���TQJson����</param>
  /// <param name="AItem">Ҫ���˵Ķ���</param>
  /// <param name="Accept">�Ƿ�Ҫ����ö���</param>
  /// <param name="ATag">�û����ӵ�������</param>
  TQJsonFilterEvent = procedure(ASender, AItem: TQJson; var Accept: Boolean;
    ATag: Pointer) of object;
  PQJson = ^TQJson;
{$IF RTLVersion>=21}
  TQJsonItemList = TList<TQJson>;
{$ELSE}
  TQJsonItemList = TList;
{$IFEND}
  /// <summary>
  /// TQJsonTagType�����ڲ�AddObject��AddRecord�������ڲ�����ʹ��
  /// </summary>
  /// <list>
  /// <item>
  /// <term>ttAnonEvent</term><description>�ص���������</description>
  /// <term>ttNameFilter</term><description>���Ի��Ա���ƹ���</descriptio>
  /// </list>
  TQJsonTagType = (ttAnonEvent, ttNameFilter);
  PQJsonInternalTagData = ^TQJsonInternalTagData;

  /// <summary>
  /// TQJsonInternalTagData����AddRecord��AddObject������Ҫ�ڲ�����RTTI��Ϣʱʹ��
  /// </summary>
  TQJsonInternalTagData = record
    /// <summary>Tag���ݵ�����</summary>
    TagType: TQJsonTagType;
{$IF RTLVersion>=21}
    /// <summary>����ʹ�õ���������</summary>
    OnEvent: TQJsonRttiFilterEventA;
{$IFEND >=2010}
    /// <summary>���ܵ�����(AddObject)���¼�ֶ�(AddRecord)���ƣ��������ͬʱ��IgnoreNames���֣���IgnoreNames�����Ϣ������</summary>
    AcceptNames: QStringW;
    /// <summary>���Ե�����(AddObject)���¼�ֶ�(AddRecord)���ƣ��������ͬʱ��AcceptNameds���AcceptNames����</summary>
    IgnoreNames: QStringW;
    /// <summary>ԭʼ���ݸ�AddObject��AddRecord�ĸ������ݳ�Ա�����������ݸ�OnEvent��Tag���Թ��û�ʹ��</summary>
    Tag: Pointer;
  end;

  TQJsonEnumerator = class;
  /// <summary>�����ⲿ֧�ֶ���صĺ���������һ���µ�QJSON����ע��ӳ��д����Ķ���</summary>
  /// <returns>�����´�����QJSON����</returns>
  TQJsonCreateEvent = function: TQJson;
  /// <summary>�����ⲿ�����󻺴棬�Ա����ö���</summary>
  /// <param name="AJson">Ҫ�ͷŵ�Json����</param>
  TQJsonFreeEvent = procedure(AJson: TQJson);

  TQJsonEncodeBytesEvent = procedure(const ABytes: TBytes;
    var AResult: QStringW);
  TQJsonDecodeBytesEvent = procedure(const S: QStringW; var AResult: TBytes);

  EJsonError = class(Exception)

  end;

  // </summary>
  /// TQJsonCommentStyle ���ڼ�¼JSON��ע�͵����ͣ�ע�⣬�ϸ�ģʽ�£�ע�ͽ�������
  /// <list>
  /// <item>
  /// <term>jcsIgnore</term><description>����ʱ����ԭ����ע��</description>
  /// <term>jcsInherited</term><description>����ʱ�ɸ��������þ���ע�ͳ��ֵ�λ��</description>
  /// <term>jcsBeforeName</term><description>����Ŀ��֮ǰ����ע��</description>
  /// <term>jcsAfterValue</term><description>����Ŀֵ֮�󣬶��ŷָ���ǰ����ע��</description>
  /// </item>
  TQJsonCommentStyle = (jcsIgnore, jcsInherited, jcsBeforeName, jcsAfterValue);
  TQJsonMergeMethod = (jmmIgnore, jmmAsSource, jmmAppend);

  // TQJsonSortFlags=(jsmAsString,);
  /// <summary>
  /// TQJson���ڽ�����ά��JSON��ʽ�Ķ������ͣ�Ҫʹ��ǰ����Ҫ���ڶ��д�����Ӧ��ʵ����
  /// TQJson��TQXML�ھ�������ӿ��ϱ���һ�£�������Json����������Ϣ����XMLû������
  /// ��Ϣ��ʼ����Ϊ���ַ�����������ٲ��ֽӿڻ����в�ͬ.
  /// ������ʵ�ֲ�ͬ��QJSON���е����Ͷ���ͬһ������ʵ�֣�����DataType�Ĳ�ͬ����ʹ��
  /// ��ͬ�ĳ�Ա�����ʡ�������ΪjdtArray������jdtObjectʱ�����������ӽ��.
  /// </summary>
  TQJson = class
  private
    function GetRoot: TQJson;
  protected
    FName: QStringW;
    FNameHash: Cardinal;
    FDataType: TQJsonDataType;
    FValue: QStringW;
    FComment: QStringW;
    FCommentStyle: TQJsonCommentStyle;
    FParent: TQJson;
    FData: Pointer;
    FItems: TQJsonItemList;
    FIgnoreCase: Boolean;
    function GetValue: QStringW;
    procedure SetValue(const Value: QStringW);
    procedure SetDataType(const Value: TQJsonDataType);
    function GetAsBoolean: Boolean;
    function GetAsFloat: Extended;
    function GetAsInt64: Int64;
    function GetAsInteger: Integer;
    function GetAsString: QStringW;
    procedure SetAsBoolean(const Value: Boolean);
    procedure SetAsFloat(const Value: Extended);
    procedure SetAsInt64(const Value: Int64);
    procedure SetAsInteger(const Value: Integer);
    procedure SetAsString(const Value: QStringW);
    function GetAsObject: QStringW;
    procedure SetAsObject(const Value: QStringW);
    function GetAsDateTime: TDateTime;
    procedure SetAsDateTime(const Value: TDateTime);
    function GetCount: Integer;
    function GetItems(AIndex: Integer): TQJson;
    class function CharUnescape(var p: PQCharW): QCharW;
    class function CharEscape(c: QCharW; pd: PQCharW): Integer;
    procedure ArrayNeeded(ANewType: TQJsonDataType);
    procedure ValidArray;
    procedure ParseObject(var p: PQCharW);
    function ParseJsonPair(ABuilder: TQStringCatHelperW;
      var p: PQCharW): Integer;
    function ParseName(ABuilder: TQStringCatHelperW; var p: PQCharW): Integer;
    procedure ParseValue(ABuilder: TQStringCatHelperW; var p: PQCharW);
    function FormatParseError(ACode: Integer; AMsg: QStringW; ps, p: PQCharW)
      : QStringW;
    procedure RaiseParseException(ACode: Integer; ps, p: PQCharW);
    function TryParseValue(ABuilder: TQStringCatHelperW;
      var p: PQCharW): Integer;
    function BooleanToStr(const b: Boolean): QStringW;
    function GetIsNull: Boolean;
    function GetIsNumeric: Boolean;
    function GetIsArray: Boolean;
    function GetIsObject: Boolean;
    function GetIsString: Boolean;
    function GetIsDateTime: Boolean;
    function GetAsArray: QStringW;
    procedure SetAsArray(const Value: QStringW);
    function GetPath: QStringW;
    function GetAsVariant: Variant;
    procedure SetAsVariant(const Value: Variant);
    function GetAsJson: QStringW;
    procedure SetAsJson(const Value: QStringW);
    function GetItemIndex: Integer;
    function ParseJsonTime(p: PQCharW; var ATime: TDateTime): Boolean;
    function CreateJson: TQJson; virtual;
    procedure FreeJson(AJson: TQJson); inline;
    procedure CopyValue(ASource: TQJson); inline;
    procedure Replace(AIndex: Integer; ANewItem: TQJson); virtual;
    procedure InternalRttiFilter(ASender: TQJson; AObject: Pointer;
      APropName: QStringW; APropType: PTypeInfo; var Accept: Boolean;
      ATag: Pointer);
    function InternalEncode(ABuilder: TQStringCatHelperW; ADoFormat: Boolean;
      ADoEscape: Boolean; ANullConvert: Boolean; const AIndent: QStringW)
      : TQStringCatHelperW;
    function ArrayItemTypeName(ATypeName: QStringW): QStringW;
    function ArrayItemType(ArrType: PTypeInfo): PTypeInfo;
    procedure DoJsonNameChanged(AJson: TQJson); virtual;
    procedure SetName(const Value: QStringW);
    function GetIsBool: Boolean;
    function GetAsBytes: TBytes;
    procedure SetAsBytes(const Value: TBytes);
    class function SkipSpaceAndComment(var p: PQCharW;
      var AComment: QStringW): Integer;
    procedure DoParsed; virtual;
    procedure SetIgnoreCase(const Value: Boolean);
    function HashName(const S: QStringW): TQHashType;
  public
    /// <summary>���캯��</summary>
    constructor Create; overload;
    constructor Create(const AName, AValue: QStringW;
      ADataType: TQJsonDataType = jdtUnknown); overload;
    /// <summary>��������</summary>
    destructor Destroy; override;
    { <summary>���һ���ӽ��</summary>
      <param name="ANode">Ҫ��ӵĽ��</param>
      <returns>������ӵĽ������</returns>
    }
    function Add(ANode: TQJson): Integer; overload;
    /// <summary>���һ��δ������JSON�ӽ��</summary>
    /// <returns>������ӵĽ��ʵ��</returns>
    /// <remarks>
    /// һ������£������������ͣ���Ӧ���δ������ʵ��
    /// </remarks>
    function Add: TQJson; overload;
    /// <summary>���һ������</summary>
    /// <param name="AName">Ҫ��ӵĶ���Ľ������</param>
    /// <param name="AValue">Ҫ��ӵ����ݵ�ֵ���ʽ���ַ�����</param>
    /// <param name="ADataType">���ʽ���ͣ����ΪjdtUnknown������Զ������������</param>
    /// <returns>���ش����Ľ������</returns>
    function Add(AName, AValue: QStringW;
      ADataType: TQJsonDataType = jdtUnknown): Integer; overload;
    /// <summary>���һ������</summary>
    /// <param name="AName">Ҫ��ӵĶ���Ľ������</param>
    /// <param name="AItems">Ҫ��ӵ���������</param>
    /// <returns>���ش����Ľ��ʵ��</returns>
    function Add(const AName: QStringW; AItems: array of const)
      : TQJson; overload;
    { <summary>���һ���ӽ��</summary>
      <param name="AName">Ҫ��ӵĽ����</param>
      <param name="ADataType">Ҫ��ӵĽ���������ͣ����ʡ�ԣ����Զ�����ֵ�����ݼ��</param>
      <returns>������ӵ��¶���</returns>
      <remarks>
      1.�����ǰ���Ͳ���jdtObject��jdtArray�����Զ�ת��ΪjdtObject����
      2.�ϲ�Ӧ�Լ������������
      </remarks>
    }
    function Add(AName: QStringW; ADataType: TQJsonDataType): TQJson; overload;

    /// <summary>���һ���ӽ��</summary>
    /// <param name="AName">Ҫ��ӵĽ�����������ǰ���Ϊ���飬�������ʱ����Ը�ֵ</param>
    /// <param name="AValue">Ҫ��ӵĽ��ֵ</param>
    /// <returns>������ӵ��¶���</returns>
    function Add(AName: QStringW; AValue: Extended): TQJson; overload;
    /// <summary>���һ���ӽ��</summary>
    /// <param name="AName">Ҫ��ӵĽ�����������ǰ���Ϊ���飬�������ʱ����Ը�ֵ</param>
    /// <param name="AValue">Ҫ��ӵĽ��ֵ</param>
    /// <returns>������ӵ��¶���</returns>
    function Add(AName: QStringW; AValue: Int64): TQJson; overload;
    /// <summary>���һ���ӽ��</summary>
    /// <param name="AName">Ҫ��ӵĽ�����������ǰ���Ϊ���飬�������ʱ����Ը�ֵ</param>
    /// <param name="AValue">Ҫ��ӵĽ��ֵ</param>
    /// <returns>������ӵ��¶���</returns>
    function Add(AName: QStringW; AValue: Boolean): TQJson; overload;
    /// <summary>���һ���ӽ��</summary>
    /// <param name="AName">Ҫ��ӵĽ�����������ǰ���Ϊ���飬�������ʱ����Ը�ֵ</param>
    /// <param name="AValue">Ҫ��ӵ��ӽ��</param>
    /// <returns>������ӵ��¶��������λ��</returns>
    /// <remarks>��ӵĽ���ͷŹ�������㸺���ⲿ��Ӧ���ͷ�</remarks>
    function Add(AName: QStringW; AChild: TQJson): Integer; overload;
    /// <summary>���һ�����������ӽ��</summary>
    /// <param name="AName">Ҫ��ӵĽ�����������ǰ���Ϊ���飬�������ʱ����Ը�ֵ</param>
    /// <returns>������ӵ��¶���</returns>
    function AddArray(AName: QStringW): TQJson; overload;
    /// <summary>���һ���ӽ��</summary>
    /// <param name="AName">Ҫ��ӵĽ�����������ǰ���Ϊ���飬�������ʱ����Ը�ֵ</param>
    /// <param name="AValue">Ҫ��ӵĽ��ֵ</param>
    /// <returns>������ӵ��¶���</returns>
    function AddDateTime(AName: QStringW; AValue: TDateTime): TQJson; overload;
    /// <summary>���һ���ӽ��</summary>
    /// <param name="AName">Ҫ��ӵĽ�����������ǰ���Ϊ���飬�������ʱ����Ը�ֵ</param>
    /// <param name="AValue">Ҫ��ӵĽ��ֵ</param>
    /// <returns>������ӵ��¶���</returns>
    function AddVariant(AName: QStringW; AValue: Variant): TQJson; overload;
    /// <summary>���һ���ӽ��(Null)</summary>
    /// <param name="AName">Ҫ��ӵĽ�����������ǰ���Ϊ���飬�������ʱ����Ը�ֵ</param>
    /// <returns>������ӵ��¶���</returns>
    function Add(AName: QStringW): TQJson; overload; virtual;

    /// <summary>ǿ��һ��·������,���������,�����δ�����Ҫ�Ľ��(jdtObject��jdtArray)</summary>
    /// <param name="APath">Ҫ��ӵĽ��·��</param>
    /// <returns>����·����Ӧ�Ķ���</returns>
    /// <remarks>
    /// ��������·����ȫ�����ڣ���ForcePath�ᰴ���¹���ִ��:
    /// 1�����APath�а���[]������Ϊ��Ӧ��·�����Ϊ���飬ʾ�����£�
    /// (1)��'a.b[].name'��
    /// a -> jdtObject
    /// b -> jdtArray
    /// b[0].name -> jdtNull(b������δָ�����Զ���Ϊ��b[0]
    /// (2)��'a.c[2].name'��
    /// a -> jdtObject
    /// c -> jdtArray
    /// c[2].name -> jdtNull
    /// ����,c[0],c[1]���Զ�����������ֵΪjdtNull��ִ����ɺ�cΪ��������Ԫ�ص�����
    /// (3)��'a[0]'��
    /// a -> jdtArray
    /// a[0] -> jdtNull
    /// 2��·���ָ���./\�ǵȼ۵ģ����ҽ�������в�Ӧ�������������ַ�֮һ,����
    /// a.b.c��a\b\c��a/b/c����ȫ��ͬ��·��
    /// 3�����APathָ���Ķ������Ͳ�ƥ�䣬����׳��쳣����aΪ���󣬵�ʹ��a[0].b����ʱ��
    /// </remarks>
    function ForcePath(APath: QStringW): TQJson;
    /// <summary>ȷ��ָ�����Ƶ��ӽ�����</summary>
    /// <param name="AName">�ӽ������</param>
    /// <param name="AType">�ӽ�������</param>
    /// <returns>����ӽ����ڣ��򷵻�ָ�����ӽ�㣬��������ڣ�������ӽ�㲢����</returns>
    /// <remarks>�� Add ���������������������ӽ���Ƿ���ڣ��Ա����ظ����� Add ����顣��ForcePath���������ڲ���ʶ�������е������ַ����Ӷ����������������</remarks>
    function ForceName(AName: QStringW;
      AType: TQJsonDataType = jdtNull): TQJson;
    /// <summary>����ָ����JSON�ַ���</summary>
    /// <param name="p">Ҫ�������ַ���</param>
    /// <param name="l">�ַ������ȣ�<=0��Ϊ����\0(#0)��β��C���Ա�׼�ַ���</param>
    /// <remarks>���l>=0������p[l]�Ƿ�Ϊ\0�������Ϊ\0����ᴴ������ʵ������������ʵ��</remarks>
    procedure Parse(p: PWideChar; l: Integer = -1); overload;
    /// <summary>����ָ����JSON�ַ���</summary>
    /// <param name="s">Ҫ������JSON�ַ���</param>
    procedure Parse(const S: QStringW); overload;
    function TryParse(p: PWideChar; l: Integer = -1): Boolean; overload;
    /// <summary>����ָ����JSON�ַ���</summary>
    /// <param name="s">Ҫ������JSON�ַ���</param>
    function TryParse(const S: QStringW): Boolean; overload;
    /// <summmary>�����н����׸�JSON���ݿ�</summary>
    /// <param name="AStream">������</param>
    /// <param name="AEncoding">�����ݵı��뷽ʽ</param>
    /// <remarks>ParseBlock�ʺϽ����ֶ�ʽJSON������ӵ�ǰλ�ÿ�ʼ����������ǰ�������Ϊֹ.
    /// ���Ժܺõ����㽥��ʽ�������Ҫ</remarks>
    procedure ParseBlock(AStream: TStream; AEncoding: TTextEncoding);
    /// <summary>��������һ���µ�ʵ��</summary>
    /// <returns>�����µĿ���ʵ��</returns>
    /// <remarks>��Ϊ�ǿ����������¾ɶ���֮������ݱ��û���κι�ϵ����������һ��
    /// ���󣬲��������һ���������Ӱ�졣
    /// </remarks>
    function Copy: TQJson;
{$IF RTLVersion>=21}
    /// <summary>��������һ���µ�ʵ��</summary>
    /// <param name="ATag">�û����ӵı�ǩ����</param>
    /// <param name="AFilter">�û������¼������ڿ���Ҫ����������</param>
    /// <returns>�����µĿ���ʵ��</returns>
    /// <remarks>��Ϊ�ǿ����������¾ɶ���֮������ݱ��û���κι�ϵ����������һ��
    /// ���󣬲��������һ���������Ӱ�졣
    /// </remarks>
    function CopyIf(const ATag: Pointer; AFilter: TQJsonFilterEventA)
      : TQJson; overload;
{$IFEND >=2010}
    /// <summary>��������һ���µ�ʵ��</summary>
    /// <param name="ATag">�û����ӵı�ǩ����</param>
    /// <param name="AFilter">�û������¼������ڿ���Ҫ����������</param>
    /// <returns>�����µĿ���ʵ��</returns>
    /// <remarks>��Ϊ�ǿ����������¾ɶ���֮������ݱ��û���κι�ϵ����������һ��
    /// ���󣬲��������һ���������Ӱ�졣
    /// </remarks>
    function CopyIf(const ATag: Pointer; AFilter: TQJsonFilterEvent)
      : TQJson; overload;
    /// <summary>��¡����һ���µ�ʵ��</summary>
    /// <returns>�����µĿ���ʵ��</returns>
    /// <remarks>��Ϊʵ����ִ�е��ǿ����������¾ɶ���֮������ݱ��û���κι�ϵ��
    /// ��������һ�����󣬲��������һ���������Ӱ�죬������Ϊ����������֤������
    /// �����Ϊ���ã��Ա��໥Ӱ�졣
    /// </remarks>
    function Clone: TQJson;
    /// <summary>����Ϊ�ַ���</summary>
    /// <param name="ADoFormat">�Ƿ��ʽ���ַ����������ӿɶ���</param>
    /// <param name="ADoEscape">�Ƿ�ת�����ĸ�������ַ�</param>
    /// <param name="AIndent">ADoFormat����ΪTrueʱ���������ݣ�Ĭ��Ϊ�����ո�</param>
    /// <returns>���ر������ַ���</returns>
    /// <remarks>AsJson�ȼ���Encode(True,'  ')</remarks>
    function Encode(ADoFormat: Boolean; ADoEscape: Boolean = False;
      AIndent: QStringW = '  '): QStringW;
    /// <summary>��ȡָ�����ƻ�ȡ����ֵ���ַ�����ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>����Ӧ����ֵ</returns>
    function ValueByName(AName, ADefVal: QStringW): QStringW;
    /// <summary>��ȡָ�����ƻ�ȡ����ֵ�Ĳ���ֵ��ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>����Ӧ����ֵ</returns>
    function BoolByName(AName: QStringW; ADefVal: Boolean): Boolean;
    /// <summary>��ȡָ�����ƻ�ȡ����ֵ������ֵ��ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>����Ӧ����ֵ</returns>
    function IntByName(AName: QStringW; ADefVal: Int64): Int64;
    /// <summary>��ȡָ�����ƻ�ȡ����ֵ�ĸ���ֵ��ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>����Ӧ����ֵ</returns>
    function FloatByName(AName: QStringW; ADefVal: Extended): Extended;
    /// <summary>��ȡָ�����ƻ�ȡ����ֵ������ʱ��ֵ��ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>����Ӧ����ֵ</returns>
    function DateTimeByName(AName: QStringW; ADefVal: TDateTime): TDateTime;
    /// <summary>��ȡָ��·������ֵ���ַ�����ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>�����������ڣ�����Ĭ��ֵ�����򣬷���ԭʼֵ</returns>
    function ValueByPath(APath, ADefVal: QStringW): QStringW;
    /// <summary>��ȡָ��·������ֵ�Ĳ���ֵ��ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>�����������ڣ�����Ĭ��ֵ�����򣬷���ԭʼֵ</returns>
    function BoolByPath(APath: QStringW; ADefVal: Boolean): Boolean;
    /// <summary>��ȡָ��·������ֵ��������ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>�����������ڣ�����Ĭ��ֵ�����򣬷���ԭʼֵ</returns>
    function IntByPath(APath: QStringW; ADefVal: Int64): Int64;
    /// <summary>��ȡָ��·������ֵ�ĸ�������ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>�����������ڣ�����Ĭ��ֵ�����򣬷���ԭʼֵ</returns>
    function FloatByPath(APath: QStringW; ADefVal: Extended): Extended;
    /// <summary>��ȡָ��·������ֵ������ʱ���ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>�����������ڣ�����Ĭ��ֵ�����򣬷���ԭʼֵ</returns>
    function DateTimeByPath(APath: QStringW; ADefVal: TDateTime): TDateTime;
    /// <summary>��ȡָ��·�����Ķ����Ʊ�ʾ</summary>
    /// <param name="AName">�������</param>
    /// <param name="ADefVal">Ĭ��ֵ</param>
    /// <returns>�����������ڣ�����Ĭ��ֵ�����򣬷���ԭʼֵ</returns>
    function BytesByPath(APath: QStringW; ADefVal: TBytes): TBytes;
    /// <summary>��ȡָ�����Ƶĵ�һ�����</summary>
    /// <param name="AName">�������</param>
    /// <returns>�����ҵ��Ľ�㣬���δ�ҵ������ؿ�(NULL/nil)</returns>
    /// <remarks>ע��QJson���������������ˣ�������������Ľ�㣬ֻ�᷵�ص�һ�����</remarks>
    function ItemByName(AName: QStringW): TQJson; overload; virtual;
    /// <summary>��ȡָ�����ƵĽ�㵽�б���</summary>
    /// <param name="AName">�������</param>
    /// <param name="AList">���ڱ�������б����</param>
    /// <param name="ANest">�Ƿ�ݹ�����ӽ��</param>
    /// <returns>�����ҵ��Ľ�����������δ�ҵ�������0</returns>
    /// <remarks>�˺�����֧�ְ������±귽ʽ����</remarks>
    function ItemByName(const AName: QStringW; AList: TQJsonItemList;
      ANest: Boolean = False): Integer; overload;
{$IFDEF ENABLE_REGEX}
    /// <summary>��ȡ����ָ�����ƹ���Ľ�㵽�б���</summary>
    /// <param name="ARegex">������ʽ</param>
    /// <param name="AList">���ڱ�������б����</param>
    /// <param name="ANest">�Ƿ�ݹ�����ӽ��</param>
    /// <returns>�����ҵ��Ľ�����������δ�ҵ�������0</returns>
    function ItemByRegex(const ARegex: QStringW; AList: TQJsonItemList;
      ANest: Boolean = False): Integer; overload;
{$ENDIF}
    /// <summary>��ȡָ��·����JSON����</summary>
    /// <param name="APath">·������"."��"/"��"\"�ָ�</param>
    /// <returns>�����ҵ����ӽ�㣬���δ�ҵ�����NULL(nil)</returns>
    /// <remarks>�������������ӽ�㣬����ֱ��ʹ���±������ʣ���������Ͷ����ӽ�㣬����ʹ��[][]�����������ʡ�</remarks>
    function ItemByPath(APath: QStringW): TQJson;
    /// <summary>��Դ������JSON��������</summary>
    /// <param name="ANode">Ҫ���Ƶ�Դ���</param>
    /// <remarks>ע�ⲻҪ�����ӽ����Լ�������������ѭ����Ҫ�����ӽ�㣬�ȸ�
    /// ��һ���ӽ�����ʵ�����ٴ���ʵ������
    /// </remarks>
    procedure Assign(ANode: TQJson); virtual;
    /// <summary>ɾ��ָ���������ӽ��</summary>
    /// <param name="AIndex">Ҫɾ���Ľ������</param>
    /// <remarks>
    /// ���ָ�������Ľ�㲻���ڣ����׳�EOutRange�쳣
    /// </remarks>
    procedure Delete(AIndex: Integer); overload; virtual;
    /// <summary>ɾ��ָ�����Ƶ��ӽ��</summary>
    /// <param name="AName">Ҫɾ���Ľ������</param>
    /// <remarks>
    /// ���Ҫ��������Ľ�㣬��ֻɾ����һ��
    procedure Delete(AName: QStringW); overload;
    /// <summary>�Ӹ������ɾ���������û�и���㣬���ͷ��Լ�</summary>
    procedure Delete; overload;
{$IF RTLVersion>=21}
    /// <summary>
    /// ɾ�������������ӽ��
    /// </summary>
    /// <param name="ATag">�û��Լ����ӵĶ�����</param>
    /// <param name="ANest">�Ƿ�Ƕ�׵��ã����Ϊfalse����ֻ�Ե�ǰ�ӽ�����</param>
    /// <param name="AFilter">���˻ص����������Ϊnil���ȼ���Clear</param>
    procedure DeleteIf(const ATag: Pointer; ANest: Boolean;
      AFilter: TQJsonFilterEventA); overload;
{$IFEND >=2010}
    /// <summary>
    /// ɾ�������������ӽ��
    /// </summary>
    /// <param name="ATag">�û��Լ����ӵĶ�����</param>
    /// <param name="ANest">�Ƿ�Ƕ�׵��ã����Ϊfalse����ֻ�Ե�ǰ�ӽ�����</param>
    /// <param name="AFilter">���˻ص����������Ϊnil���ȼ���Clear</param>
    procedure DeleteIf(const ATag: Pointer; ANest: Boolean;
      AFilter: TQJsonFilterEvent); overload;
    /// <summary>����ָ�����ƵĽ�������</summary>
    /// <param name="AName">Ҫ���ҵĽ������</param>
    /// <returns>��������ֵ��δ�ҵ�����-1</returns>
    function IndexOf(const AName: QStringW): Integer; virtual;
{$IF RTLVersion>=21}
    /// <summary>���������ҷ��������Ľ��</summary>
    /// <param name="ATag">�û��Զ���ĸ��Ӷ�����</param>
    /// <param name="ANest">�Ƿ�Ƕ�׵��ã����Ϊfalse����ֻ�Ե�ǰ�ӽ�����</param>
    /// <param name="AFilter">���˻ص����������Ϊnil���򷵻�nil</param>
    function FindIf(const ATag: Pointer; ANest: Boolean;
      AFilter: TQJsonFilterEventA): TQJson; overload;
{$IFEND >=2010}
    /// <summary>���������ҷ��������Ľ��</summary>
    /// <param name="ATag">�û��Զ���ĸ��Ӷ�����</param>
    /// <param name="ANest">�Ƿ�Ƕ�׵��ã����Ϊfalse����ֻ�Ե�ǰ�ӽ�����</param>
    /// <param name="AFilter">���˻ص����������Ϊnil���򷵻�nil</param>
    function FindIf(const ATag: Pointer; ANest: Boolean;
      AFilter: TQJsonFilterEvent): TQJson; overload;
    /// <summary>������еĽ��</summary>
    procedure Clear; virtual;
    /// <summary>���浱ǰ�������ݵ�����</summary>
    /// <param name="AStream">Ŀ��������</param>
    /// <param name="AEncoding">�����ʽ</param>
    /// <param name="AWriteBom">�Ƿ�д��BOM</param>
    /// <param name="ADoFormat">�Ƿ��ʽ��Json���</param>
    /// <remarks>ע�⵱ǰ�������Ʋ��ᱻд��</remarks>
    procedure SaveToStream(AStream: TStream; AEncoding: TTextEncoding = teUtf8;
      AWriteBOM: Boolean = True; ADoFormat: Boolean = True);
    /// <summary>�����ĵ�ǰλ�ÿ�ʼ����JSON����</summary>
    /// <param name="AStream">Դ������</param>
    /// <param name="AEncoding">Դ�ļ����룬���ΪteUnknown�����Զ��ж�</param>
    /// <remarks>���ĵ�ǰλ�õ������ĳ��ȱ������2�ֽڣ�����������</remarks>
    procedure LoadFromStream(AStream: TStream;
      AEncoding: TTextEncoding = teUnknown);
    /// <summary>���浱ǰ�������ݵ��ļ���</summary>
    /// <param name="AFileName">�ļ���</param>
    /// <param name="AEncoding">�����ʽ</param>
    /// <param name="AWriteBOM">�Ƿ�д��UTF-8��BOM</param>
    /// <param name="ADoFormat">�Ƿ��ʽ��Json���</param>
    /// <remarks>ע�⵱ǰ�������Ʋ��ᱻд��</remarks>
    procedure SaveToFile(AFileName: String; AEncoding: TTextEncoding = teUtf8;
      AWriteBOM: Boolean = True; ADoFormat: Boolean = True);
    /// <summary>��ָ�����ļ��м��ص�ǰ����</summary>
    /// <param name="AFileName">Ҫ���ص��ļ���</param>
    /// <param name="AEncoding">Դ�ļ����룬���ΪteUnknown�����Զ��ж�</param>
    procedure LoadFromFile(AFileName: String;
      AEncoding: TTextEncoding = teUnknown);
    /// / <summary>����ֵΪNull���ȼ���ֱ������DataTypeΪjdtNull</summary>
    procedure ResetNull;
    function Escape(const S: QStringW): QStringW;
    /// <summary>����TObject.ToString����</summary>
    function ToString: string; {$IFDEF UNICODE}override; {$ELSE}virtual;
{$ENDIF}
    /// <summary>��ȡfor..in��Ҫ��GetEnumerator֧��</summary>
    function GetEnumerator: TQJsonEnumerator;
    /// <summary>�ж��Լ��Ƿ���ָ��������Ӷ���</summmary>
    /// <param name="AParent">���ܵĸ�����</param>
    /// <returns>���AParent���Լ��ĸ����󣬷���True�����򷵻�false</returns>
    function IsChildOf(AParent: TQJson): Boolean;
    /// <summary>�ж��Լ��Ƿ���ָ������ĸ�����</summmary>
    /// <param name="AChild">���ܵ��Ӷ���</param>
    /// <returns>���AChild���Լ����Ӷ��󣬷���True�����򷵻�false</returns>
    function IsParentOf(AChild: TQJson): Boolean;
{$IF RTLVersion>=21}
    /// <summary>ʹ�õ�ǰJson�����������ָ���������Ӧ����</summary>
    /// <param name="AInstance">�����������Ķ���ʵ��</param>
    /// <returns>���غ������õĽ��</returns>
    /// <remarks>��������Ϊ��ǰ������ƣ������Ĳ����������ӽ�������Ҫ����һ��</remarks>
    function Invoke(AInstance: TValue): TValue;
    /// <summary>����ǰ��ֵת��ΪTValue���͵�ֵ</summary>
    /// <returns>���ص�ǰ���ת�����TValueֵ</returns>
    function ToRttiValue: TValue;
    /// <summary>��ָ����RTTIʵ��������JSON����</summary>
    /// <param name="AInstance">���������RTTI����ֵ</param>
    /// <remarks>ע�ⲻ��ȫ��RTTI���Ͷ���֧�֣���ӿ�ɶ��</remarks>
    procedure FromRtti(AInstance: TValue); overload;
    /// <summary>��ָ������Դ��ַ��ָ������������JSON����</summary>
    /// <param name="ASource">�����ṹ���ַ</param>
    /// <param name="AType">�����ṹ��������Ϣ</param>
    procedure FromRtti(ASource: Pointer; AType: PTypeInfo); overload;
    /// <summary>��ָ���ļ�¼ʵ��������JSON����</summary>
    /// <param name="ARecord">��¼ʵ��</param>
    procedure FromRecord<T>(const ARecord: T);
    /// <summary>�ӵ�ǰJSON�л�ԭ��ָ���Ķ���ʵ����</summary>
    /// <param name="AInstance">ʵ����ַ</param>
    /// <remarks>ʵ���ϲ���ֻ֧�ֶ��󣬼�¼����Ŀǰ�޷�ֱ��ת��ΪTValue������û
    /// ���壬������������Ϊ��ֵ������ʵ�ʾ��㸳ֵ��Ҳ���ز��ˣ����������</remarks>
    procedure ToRtti(AInstance: TValue); overload;
    /// <summary>�ӵ�ǰJSON�а�ָ����������Ϣ��ԭ��ָ���ĵ�ַ</summary>
    /// <param name="ADest">Ŀ�ĵ�ַ</param>
    /// <param name="AType">�����ṹ���������Ϣ</param>
    /// <remarks>ADest��Ӧ��Ӧ�Ǽ�¼������������Ͳ���֧��</remarks>
    procedure ToRtti(ADest: Pointer; AType: PTypeInfo); overload;
    /// <summary>�ӵ�ǰ��JSON�л�ԭ��ָ���ļ�¼ʵ����</summary>
    /// <param name="ARecord">Ŀ�ļ�¼ʵ��</param>
    procedure ToRecord<T: record >(var ARecord: T);
{$IFEND}
    /// <summary>��ָ���������ӽ���Ƴ�</summary>
    /// <param name="AItemIndex">Ҫ�Ƴ����ӽ������</param>
    /// <returns>���ر��Ƴ����ӽ�㣬���ָ�������������ڣ�����nil</returns>
    /// <remarks>���Ƴ����ӽ����Ҫ�û��Լ��ֹ��ͷ�</remarks>
    function Remove(AItemIndex: Integer): TQJson; overload; virtual;
    /// <summary>��ָ�����ӽ���Ƴ�</summary>
    /// <param name="AJson">Ҫ�Ƴ����ӽ��</param>
    /// <remarks>���Ƴ����ӽ����Ҫ�û��Լ��ֹ��ͷ�</remarks>
    procedure Remove(AJson: TQJson); overload;
    /// <summary>�ӵ�ǰ������з��뵱ǰ���</summary>
    /// <remarks>�����Ľ����Ҫ�����ͷ�</remarks>
    procedure Detach;
    /// <summary>����ǰ��㸽�ӵ��µĸ������</summary>
    /// <param name="AParent">Ҫ���ӵ�Ŀ����</param>
    /// <remarks>���Ӻ�Ľ���ɸ���㸺���ͷ�</remarks>
    procedure AttachTo(ANewParent: TQJson);
    /// <summary>����ǰ����ƶ����µĸ�����ָ��λ��</summary>
    /// <param name="ANewParent">�µĸ����</param>
    /// <param name="AIndex">��λ������</param>
    /// <remarks>�����λ������С�ڵ���0������뵽��ʼλ�ã�������ڸ������н������������뵽
    /// �����ĩβ��������ӵ�ָ��λ��</remarks>
    procedure MoveTo(ANewParent: TQJson; AIndex: Integer);

    /// <summary>�����м��ض���������</summary>
    /// <param name="AStream">Դ������</param>
    /// <param name="ACount">���ȣ����Ϊ0����ȫ��</param>
    procedure ValueFromStream(AStream: TStream; ACount: Cardinal);
    /// <summary>������������д�뵽����</summary>
    /// <param name="AStream">Ŀ��������</param>
    procedure StreamFromValue(AStream: TStream);

    /// <summary>�����м��ض���������</summary>
    /// <param name="AStream">Դ�ļ���</param>
    procedure ValueFromFile(AFileName: QStringW);
    /// <summary>������������д�뵽����</summary>
    /// <param name="AStream">Ŀ���ļ���</param>
    procedure FileFromValue(AFileName: QStringW);
    /// <summary>�ж��Ƿ��з���ָ��·��Ҫ����ӽ�㣬������ڣ�ͨ������AChild����ʵ����ַ������True�����򷵻�False</summary>
    /// <param name="ANamePath">���·�����ָ������ܡ�.������/������\������</param>
    /// <param name="AChild">���ڷ����ӽ��ָ��</param>
    /// <returns>�ɹ�������True��AChild��ֵΪ�ӽ��ָ�룬ʧ�ܣ�����False</returns>
    function HasChild(ANamePath: QStringW; var AChild: TQJson): Boolean; inline;
    /// <summary>��ȡ��ָ�����������·��</summary>
    /// <param name="AParent">Ŀ�길���</param>
    /// <param name="APathDelimiter">·���ָ���</param>
    /// <returns>�������·��</returns>
    function GetRelPath(AParent: TQJson; APathDelimiter: QCharW = '\')
      : QStringW;
    /// <summary>�����ӽ��</summary>
    /// <param name="AByName">�Ƿ���������</param>
    /// <param name="ANest">�Ƿ������ӽ��</param>
    /// <param name="AByType">�ӽ��������������ݣ����ΪjdtUnknown�����Զ���⣬����ָ������������</param>
    /// <param name="AOnCompare">����ȽϷ����������ָ������Ĭ�Ϲ������򣬷��������������</param>
    /// <remarks>AByType�����ΪjdtUnknown��������豣֤�ӽ���ֵ�ܹ�ת��ΪĿ������</remarks>
    procedure Sort(AByName, ANest: Boolean; AByType: TQJsonDataType;
      AOnCompare: TListSortCompare);
    /// <summary>��ת���˳��</summary>
    /// <param name="ANest">�Ƿ�Ƕ����ת</param>
    procedure RevertOrder(ANest: Boolean = False);
    /// <summary>������������˳��</summary>
    /// <param name="AIndex1">��һ���������<param>
    /// <param name="AIndex2">�ڶ����������</param>
    procedure ExchangeOrder(AIndex1, AIndex2: Integer);
    /// <summary>�ж��Ƿ����ָ�����Ƶ��ӽ��</summary>
    /// <param name="AName">�������</param>
    /// <param name="ANest">�Ƿ�Ƕ�׼���ӽ��</param>
    /// <returns>����������true�����򣬷���false</returns>
    function ContainsName(AName: QStringW; ANest: Boolean = False): Boolean;
    /// <summary>�ж��Ƿ����ָ�����Ƶ��ӽ��</summary>
    /// <param name="AValue">���ֵ</param>
    /// <param name="ANest">�Ƿ�Ƕ�׼���ӽ��</param>
    /// <param name="AStrict">�Ƿ��ϸ�Ҫ������ƥ��</param>
    /// <returns>����������true�����򣬷���false</returns>
    function ContainsValue(const AValue: Variant; ANest: Boolean = False;
      AStrict: Boolean = False): Boolean;
    /// <summary>�ж��Ƿ����ָ��·�����ӽ��</summary>
    /// <param name="APath">Ҫ���ҵĽ������</param>
    /// <returns>����������true��ʧ�ܣ�����false</returns>
    /// <remarks>�˺����ȼ���ItemByPath(APath)<>nil</remarks>
    function Exists(const APath: QStringW): Boolean; inline;
    /// <summary>�ϲ�ԴJSON�����ݵ���ǰJSON</summary>
    /// <param name="ASource">ԴJSON</param>
    /// <param name="AMethod">�ϲ���ʽ</param>
    /// <remarks>
    /// ��ͬ�ĺϲ���ʽЧ�����£�
    /// jmmIgnore : ����Դ���ظ�����Ŀ�ϲ�
    /// jmmAppend : ׷��Ϊ�ظ�����Ŀ
    /// jmmAsSource : �滻ΪԴ�е�����
    /// </remarks>
    procedure Merge(ASource: TQJson; AMethod: TQJsonMergeMethod);
    /// <summary>�ж�JSON�����Ƿ���ͬ</summary>
    /// <returns>�������һ�£��򷵻� true�����򷵻� false</returns>
    function Equals(AJson: TQJson): Boolean; reintroduce;
    /// <summary>��ȡ����JSON��������ͬ�Ĳ��֣����Ż���</summary>
    /// <param name="AJson">Ҫ����Ƚϵ�JSON����</param>
    /// <returns>��������JSON���Ӽ�</returns>
    /// <remarks>����ֵ��Ҫ�ֶ��ͷ�</remarks>
    function Intersect(AJson: TQJson): TQJson;
    /// <summary>��ȡ����JSON�����ݲ�ͬ�Ĳ��֣����Ż���</summary>
    /// <param name="AJson">Ҫ����Ƚϵ�JSON����</param>
    /// <returns>��������JSON�Ĳ</returns>
    /// <remarks>����ֵ��Ҫ�ֶ��ͷ�</remarks>
    function Diff(AJson: TQJson): TQJson;
    // ת��һ��JsonֵΪ�ַ���
    class function BuildJsonString(ABuilder: TQStringCatHelperW; var p: PQCharW)
      : Boolean; overload;
    class function BuildJsonString(S: QStringW): QStringW; overload;
    class function BuildJsonString(ABuilder: TQStringCatHelperW; S: QStringW)
      : Boolean; overload;
    class procedure JsonCat(ABuilder: TQStringCatHelperW; const S: QStringW;
      ADoEscape: Boolean); overload;
    class function JsonCat(const S: QStringW; ADoEscape: Boolean)
      : QStringW; overload;
    class function JsonEscape(const S: QStringW; ADoEscape: Boolean)
      : QStringW; overload;
    class function JsonUnescape(const S: QStringW): QStringW;
    class function EncodeDateTime(const AValue: TDateTime): QStringW;
    /// <summary>�����</summary>
    property Parent: TQJson read FParent;
    /// <summary>�������</summary>
    /// <seealso>TQJsonDataType</seealso>
    property DataType: TQJsonDataType read FDataType write SetDataType;
    /// <summary>�������</summary>
    property Name: QStringW read FName write SetName;
    /// <summary>�ӽ������</<summary>summary>
    property Count: Integer read GetCount;
    /// <summary>�ӽ������</summary>
    property Items[AIndex: Integer]: TQJson read GetItems; default;
    /// <summary>�ӽ���ֵ</summary>
    property Value: QStringW read GetValue write SetValue;
    /// <summary>�ж��Ƿ��ǲ�������</summary>
    property IsBool: Boolean read GetIsBool;
    /// <summary>�ж��Ƿ���NULL����</summary>
    property IsNull: Boolean read GetIsNull;
    /// <summary>�ж��Ƿ�����������</summary>
    property IsNumeric: Boolean read GetIsNumeric;
    /// <summary>�ж��Ƿ�������ʱ������</summary>
    property IsDateTime: Boolean read GetIsDateTime;
    /// <summary>�ж��Ƿ����ַ�������</summary>
    property IsString: Boolean read GetIsString;
    /// <summary>�ж��Ƿ��Ƕ���</summary>
    property IsObject: Boolean read GetIsObject;
    /// <summary>�ж��Ƿ�������</summary>
    property IsArray: Boolean read GetIsArray;
    /// <summary>����ǰ��㵱���������ͷ���</summary>
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    /// <summary>����ǰ��㵱����������������</summary>
    property AsInteger: Integer read GetAsInteger write SetAsInteger;
    /// <summary>����ǰ��㵱��64λ��������������</summary>
    property AsInt64: Int64 read GetAsInt64 write SetAsInt64;
    /// <summary>����ǰ��㵱����������������</summary>
    property AsFloat: Extended read GetAsFloat write SetAsFloat;
    /// <summary>����ǰ��㵱������ʱ������������</summary>
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    /// <summary>����ǰ��㵱���ַ������ͷ���</summary>
    property AsString: QStringW read GetAsString write SetAsString;
    /// <summary>����ǰ��㵱��һ�������ַ���������</summary>
    property AsObject: QStringW read GetAsObject write SetAsObject;
    /// <summary>����ǰ��㵱��һ���ַ�������������</summary>
    property AsArray: QStringW read GetAsArray write SetAsArray;
    /// <summary>���Լ�����Variant����������</summary>
    property AsVariant: Variant read GetAsVariant write SetAsVariant;
    /// <summary>���Լ�����Json����������</summary>
    property AsJson: QStringW read GetAsJson write SetAsJson;
    /// <summary>���Լ��������������ݷ���</summary>
    property AsBytes: TBytes read GetAsBytes write SetAsBytes;
    // <summary>����ĸ������ݳ�Ա�����û�������������</summary>
    property Data: Pointer read FData write FData;
    /// <summary>����·����·���м���"\"�ָ�</summary>
    property Path: QStringW read GetPath;

    /// <summary>�ڸ�����е�����˳�򣬴�0��ʼ�������-1��������Լ��Ǹ����</summary>
    property ItemIndex: Integer read GetItemIndex;
    /// <summary>���ƹ�ϣֵ</summary>
    property NameHash: Cardinal read FNameHash;
    /// <summary>�ȽϺ��Ƿ���Դ�Сд</summary>
    property IgnoreCase: Boolean read FIgnoreCase write SetIgnoreCase;
    /// <summary>��JSON���</summary>
    property Root: TQJson read GetRoot;
    /// <summary>ע����ʽ</summary>
    property CommentStyle: TQJsonCommentStyle read FCommentStyle
      write FCommentStyle;
    /// <summary>ע������</summary>
    property Comment: QStringW read FComment write FComment;
  end;

  TQJsonEnumerator = class
  private
    FIndex: Integer;
    FList: TQJson;
  public
    constructor Create(AList: TQJson);
    function GetCurrent: TQJson; inline;
    function MoveNext: Boolean;
    property Current: TQJson read GetCurrent;
  end;

  TQHashedJson = class(TQJson)
  protected
    FHashTable: TQHashTable;
    function CreateJson: TQJson; override;
    procedure Replace(AIndex: Integer; ANewItem: TQJson); override;
    procedure DoJsonNameChanged(AJson: TQJson); override;
    procedure DoParsed; override;
  public
    constructor Create; overload;
    destructor Destroy; override;
    procedure Assign(ANode: TQJson); override;
    function IndexOf(const AName: QStringW): Integer; override;
    function ItemByName(AName: QStringW): TQJson; overload; override;
    function Remove(AIndex: Integer): TQJson; override;
    procedure Clear; override;
  end;

  PQStreamHelperStack = ^TQStreamHelperStack;

  TQStreamHelperStack = record
    Count: Integer;
    Prior: PQStreamHelperStack;
  end;

  TQJsonStreamHelper = record
  private
    FEncoding: TTextEncoding;
    FStream: TStream;
    FDoEscape: Boolean;
    FIsEmpty: Boolean;
    FLast: PQStreamHelperStack;
    procedure InternalWriteString(S: QStringW; ADoAppend: Boolean = True);
    procedure Push;
    procedure Pop;
  public
    procedure BeginWrite(AStream: TStream; AEncoding: TTextEncoding;
      ADoEscape: Boolean = False);
    procedure EndWrite;
    procedure BeginObject; overload;
    procedure BeginObject(const AName: QStringW); overload;
    procedure EndObject;
    procedure BeginArray; overload;
    procedure BeginArray(const AName: QStringW); overload;
    procedure EndArray;
    procedure WriteName(const S: QStringW);
    procedure Write(const S: QStringW); overload;
    procedure Write(const I: Int64); overload;
    procedure Write(const D: Double); overload;
    procedure WriteDateTime(const V: TDateTime); overload;
    procedure Write(const c: Currency); overload;
    procedure Write(const ABytes: TBytes); overload;
    procedure Write(const p: PByte; l: Integer); overload;
    procedure WriteNull; overload;
    procedure Write(const b: Boolean); overload;
    procedure Write(const AName, AValue: QStringW); overload;
    procedure Write(const AName: QStringW; AValue: Int64); overload;
    procedure Write(const AName: QStringW; AValue: Double); overload;
    procedure Write(const AName: QStringW; AValue: TBytes); overload;
    procedure Write(const AName: QStringW; AValue: Boolean); overload;
    procedure WriteDateTime(const AName: QStringW; AValue: TDateTime); overload;
    procedure Write(const AName: QStringW; const p: PByte;
      const l: Integer); overload;
    procedure WriteNull(const AName: QStringW); overload;
    property DoEscape: Boolean read FDoEscape write FDoEscape;
    property IsEmpty: Boolean read FIsEmpty;
  end;

var
  /// <summary>�Ƿ������ϸ���ģʽ�����ϸ�ģʽ�£�
  /// 1.���ƻ��ַ�������ʹ��˫���Ű�������,���ΪFalse�������ƿ���û�����Ż�ʹ�õ����š�
  /// 2.ע�Ͳ���֧�֣����ΪFalse����֧��//��ע�ͺ�/**/�Ŀ�ע��
  /// </summary>
  StrictJson: Boolean;
  /// <summary>ָ����δ���RTTI�е�ö�ٺͼ�������</summary>
  JsonRttiEnumAsInt: Boolean;
  /// <summary>��������ת��ΪJson����ʱ��ת�����ַ������������������θ�ʽ��</summary>
  JsonDateFormat: QStringW;
  /// <summary>ʱ������ת��ΪJson����ʱ��ת�����ַ������������������θ�ʽ��</summary>
  JsonTimeFormat: QStringW;
  /// <summary>����ʱ������ת��ΪJson����ʱ��ת�����ַ������������������θ�ʽ��</summary>
  JsonDateTimeFormat: QStringW;
  /// <summary>��ItemByName/ItemByPath/ValueByName/ValueByPath�Ⱥ������ж��У��Ƿ��������ƴ�Сд</summary>
  JsonCaseSensitive: Boolean;
  /// ����Ҫ�½�һ��TQJson����ʱ����
  OnQJsonCreate: TQJsonCreateEvent;
  /// ����Ҫ�ͷ�һ��TQJson����ʱ����
  OnQJsonFree: TQJsonFreeEvent;
  /// �ַ������ֽ���֮���ת���¼�
  OnQJsonEncodeBytes: TQJsonEncodeBytesEvent;
  OnQJsonDecodeBytes: TQJsonDecodeBytesEvent;
  // �ַ���ֵ����ʼ���
  CharStringStart: QStringW = '"';
  // �ַ���ֵ�Ľ������
  CharStringEnd: QStringW = '"';
  // JSON���ƿ�ʼ���
  CharNameStart: QStringW = '"';
  // JSON���ƽ������
  CharNameEnd: QStringW = '":';
  // JSON ���鿪ʼ���
  CharArrayStart: QStringW = '[';
  // JSON ����������
  CharArrayEnd: QStringW = ']';
  // JSON ����ʼ���
  CharObjectStart: QStringW = '{';
  // JSON ����������
  CharObjectEnd: QStringW = '}';
  // JSON NULL ֵ
  CharNull: QStringW = 'null';
  // JSON �ٵ�ֵ
  CharFalse: QStringW = 'false';
  // JSON ���ֵ
  CharTrue: QStringW = 'true';
  // JSON ֵ�ָ���
  CharComma: QStringW = ',';
procedure EncodeJsonBinaryAsBase64;
procedure EncodeJsonBinaryAsHex;

implementation

uses variants, varutils, dateutils;

resourcestring
  SBadJson = '��ǰ���ݲ�����Ч��JSON�ַ�����';
  SNotArrayOrObject = '%s ����һ��JSON��������';
  SVarNotArray = '%s �����Ͳ�����������';
  SBadConvert = '%s ����һ����Ч�� %s ���͵�ֵ��';
  SCharNeeded = '��ǰλ��Ӧ���� "%s" �������� "%s"��';
  SEndCharNeeded = '��ǰλ����ҪJson�����ַ�",]}"��';
  SBadNumeric = '"%s"������Ч����ֵ��';
  SBadJsonTime = '"%s"����һ����Ч������ʱ��ֵ��';
  SBadNameStart = 'Json����Ӧ��''"''�ַ���ʼ��';
  SBadNameEnd = 'Json����δ��ȷ������';
  SNameNotFound = '��Ŀ����δ�ҵ���';
  SCommentNotSupport = '�ϸ�ģʽ�²�֧��ע�ͣ�Ҫ��������ע�͵�JSON���ݣ��뽫StrictJson��������ΪFalse��';
  SUnsupportArrayItem = '��ӵĶ�̬�����%d��Ԫ�����Ͳ���֧�֡�';
  SBadStringStart = '�ϸ����JSON�ַ���������"��ʼ��';
  SUnknownToken = '�޷�ʶ���ע�ͷ���ע�ͱ�����//��/**/������';
  SNotSupport = '���� [%s] �ڵ�ǰ���������²���֧�֡�';
  SBadJsonArray = '%s ����һ����Ч��JSON���鶨�塣';
  SBadJsonObject = '%s ����һ����Ч��JSON�����塣';
  SBadJsonEncoding = '��Ч�ı��룬����ֻ����UTF-8��ANSI��Unicode 16 LE��Unicode 16 BE��';
  SJsonParseError = '��%d�е�%d��:%s '#13#10'��:%s';
  SBadJsonName = '%s ����һ����Ч��JSON�������ơ�';
  SObjectChildNeedName = '���� %s �ĵ� %d ���ӽ������δ��ֵ���������ǰ���踳ֵ��';
  SReplaceTypeNeed = '�滻��������Ҫ���� %s �������ࡣ';
  SSupportFloat = 'NaN/+��/-�޲���JSON�淶֧�֡�';
  SParamMissed = '���� %s ͬ���Ľ��δ�ҵ���';
  SMethodMissed = 'ָ���ĺ��� %s �����ڡ�';
  SMissRttiTypeDefine =
    '�޷��ҵ� %s ��RTTI������Ϣ�����Խ���Ӧ�����͵�������(��array[0..1] of Byte��ΪTByteArr=array[0..1]��Ȼ����TByteArr����)��';
  SUnsupportPropertyType = '��֧�ֵ��������͡�';
  SArrayTypeMissed = 'δ֪������Ԫ�����͡�';
  SUnknownError = 'δ֪�Ĵ���';
  SCantAttachToSelf = '�������Լ�����Ϊ�Լ����ӽ�㡣';
  SCanAttachToNoneContainer = '���ܽ���㸽�ӵ�������Ͷ������͵Ľ���¡�';
  SCantAttachNoNameNodeToObject = '���ܽ�δ�����Ľ����Ϊ�������͵��ӽ�㡣';
  SNodeNameExists = 'ָ���ĸ�������Ѿ�������Ϊ %s ���ӽ�㡣';
  SCantMoveToChild = '���ܽ��Լ��ƶ����Լ����ӽ������';
  SConvertError = '�޷������� %s ת��Ϊ %s ';
  SUnsupportVarType = '��֧�ֵı������� %d ��';

const
  JsonTypeName: array [TQJsonDataType] of QStringW = ('Unknown', 'Null',
    'String', 'Integer', 'Float', 'Boolean', 'DateTime', 'Array', 'Object');
  EParse_Unknown = -1;
  EParse_BadStringStart = 1;
  EParse_BadJson = 2;
  EParse_CommentNotSupport = 3;
  EParse_UnknownToken = 4;
  EParse_EndCharNeeded = 5;
  EParse_BadNameStart = 6;
  EParse_BadNameEnd = 7;
  EParse_NameNotFound = 8;

function DoCompareName(Item1, Item2: Pointer): Integer;
var
  AIgnoreCase: Boolean;
  AItem1, AItem2: TQJson;
begin
  AItem1 := Item1;
  AItem2 := Item2;
  AIgnoreCase := AItem1.IgnoreCase;
  if AIgnoreCase <> AItem2.IgnoreCase then
    AIgnoreCase := False;
  Result := StrCmpW(PWideChar(AItem1.Name), PWideChar(AItem2.Name),
    AIgnoreCase);
end;

function DoCompareValueBoolean(Item1, Item2: Pointer): Integer;
var
  AItem1, AItem2: TQJson;
begin
  AItem1 := Item1;
  AItem2 := Item2;
  if AItem1.IsNull then
  begin
    if not AItem2.IsNull then
      Result := -1
    else
      Result := 0;
  end
  else
  begin
    if AItem2.IsNull then
      Result := 1
    else
      Result := Integer(AItem1.AsBoolean) - Integer(AItem2.AsBoolean);
  end;
end;

function DoCompareValueDateTime(Item1, Item2: Pointer): Integer;
var
  AItem1, AItem2: TQJson;
begin
  AItem1 := Item1;
  AItem2 := Item2;
  if AItem1.IsNull then
  begin
    if AItem2.IsNull then
      Result := 0
    else
      Result := -1;
  end
  else
  begin
    if AItem2.IsNull then
      Result := 1
    else
      Result := CompareValue(AItem1.AsDateTime, AItem2.AsDateTime);
  end;
end;

function DoCompareValueFloat(Item1, Item2: Pointer): Integer;
var
  AItem1, AItem2: TQJson;
begin
  AItem1 := Item1;
  AItem2 := Item2;
  if AItem1.IsNull then
  begin
    if AItem2.IsNull then
      Result := 0
    else
      Result := -1;
  end
  else
  begin
    if AItem2.IsNull then
      Result := 1
    else
      Result := CompareValue(AItem1.AsFloat, AItem2.AsFloat);
  end;
end;

function DoCompareValueInt(Item1, Item2: Pointer): Integer;
var
  AItem1, AItem2: TQJson;
begin
  AItem1 := Item1;
  AItem2 := Item2;
  if AItem1.IsNull then
  begin
    if AItem2.IsNull then
      Result := 0
    else
      Result := -1;
  end
  else
  begin
    if AItem2.IsNull then
      Result := 1
    else
      Result := CompareValue(AItem1.AsInt64, AItem2.AsInt64);
  end;
end;

function DoCompareValueString(Item1, Item2: Pointer): Integer;
var
  AIgnoreCase: Boolean;
  AItem1, AItem2: TQJson;
begin
  AItem1 := Item1;
  AItem2 := Item2;
  AIgnoreCase := AItem1.IgnoreCase;
  if AIgnoreCase <> AItem2.IgnoreCase then
    AIgnoreCase := False;
  Result := StrCmpW(PWideChar(AItem1.AsString), PWideChar(AItem2.AsString),
    AIgnoreCase);
end;
{ TQJson }

function TQJson.Add(AName: QStringW; AValue: Int64): TQJson;
begin
  Result := Add(AName, jdtInteger);
  PInt64(PQCharW(Result.FValue))^ := AValue;
end;

function TQJson.Add(AName: QStringW; AValue: Extended): TQJson;
begin
  Result := Add(AName, jdtFloat);
  PExtended(PQCharW(Result.FValue))^ := AValue;
end;

function TQJson.Add(AName: QStringW; AValue: Boolean): TQJson;
begin
  Result := Add(AName, jdtBoolean);
  PBoolean(PQCharW(Result.FValue))^ := AValue;
end;

function TQJson.Add(AName: QStringW): TQJson;
begin
  Result := Add;
  Result.FName := AName;
  DoJsonNameChanged(Result);
end;

function TQJson.Add(AName: QStringW; AChild: TQJson): Integer;
begin
  AChild.FName := AName;
  Result := Add(AChild);
  DoJsonNameChanged(AChild);
end;

function TQJson.AddArray(AName: QStringW): TQJson;
begin
  Result := Add(AName, jdtArray);
end;

function TQJson.AddDateTime(AName: QStringW; AValue: TDateTime): TQJson;
begin
  Result := Add(AName);
  Result.DataType := jdtString;
  Result.AsDateTime := AValue;
end;

function TQJson.AddVariant(AName: QStringW; AValue: Variant): TQJson;
begin
  Result := Add(AName);
  Result.AsVariant := AValue;
end;

function TQJson.Add: TQJson;
begin
  Result := CreateJson;
  Add(Result);
end;

function TQJson.Add(ANode: TQJson): Integer;
begin
  ArrayNeeded(jdtObject);
  Result := FItems.Add(ANode);
  ANode.FParent := Self;
  ANode.FIgnoreCase := FIgnoreCase;
end;

function TQJson.Add(AName, AValue: QStringW; ADataType: TQJsonDataType)
  : Integer;
var
  ANode: TQJson;
  p: PQCharW;
  ABuilder: TQStringCatHelperW;
  procedure AddAsDateTime;
  var
    ATime: TDateTime;
  begin
    if ParseDateTime(PQCharW(AValue), ATime) then
      ANode.AsDateTime := ATime
    else if ParseJsonTime(PQCharW(AValue), ATime) then
      ANode.AsDateTime := ATime
    else
      raise Exception.Create(SBadJsonTime);
  end;

begin
  ANode := CreateJson;
  ANode.FName := AName;
  Result := Add(ANode);
  DoJsonNameChanged(ANode);
  p := PQCharW(AValue);
  if ADataType = jdtUnknown then
  begin
    ABuilder := TQStringCatHelperW.Create;
    try
      if ANode.TryParseValue(ABuilder, p) <> 0 then
        ANode.AsString := AValue
      else if p^ <> #0 then
        ANode.AsString := AValue;
    finally
      FreeObject(ABuilder);
    end;
  end
  else
  begin
    case ADataType of
      jdtString:
        ANode.AsString := AValue;
      jdtInteger:
        ANode.AsInteger := StrToInt(AValue);
      jdtFloat:
        ANode.AsFloat := StrToFloat(AValue);
      jdtBoolean:
        ANode.AsBoolean := StrToBool(AValue);
      jdtDateTime:
        AddAsDateTime;
      jdtArray:
        begin
          if p^ <> '[' then
            raise Exception.CreateFmt(SBadJsonArray, [Value]);
          ANode.ParseObject(p);
        end;
      jdtObject:
        begin
          if p^ <> '{' then
            raise Exception.CreateFmt(SBadJsonObject, [Value]);
          ANode.ParseObject(p);
        end;
    end;

  end;
end;

function TQJson.Add(AName: QStringW; ADataType: TQJsonDataType): TQJson;
begin
  Result := Add(AName);
  Result.DataType := ADataType;
end;

function TQJson.Add(const AName: QStringW; AItems: array of const): TQJson;
var
  I: Integer;
begin
  Result := Add(AName);
  Result.DataType := jdtArray;
  for I := Low(AItems) to High(AItems) do
  begin
    case AItems[I].VType of
      vtInteger:
        Result.Add.AsInteger := AItems[I].VInteger;
      vtBoolean:
        Result.Add.AsBoolean := AItems[I].VBoolean;
{$IFNDEF NEXTGEN}
      vtChar:
        Result.Add.AsString := QStringW(AItems[I].VChar);
{$ENDIF !NEXTGEN}
      vtExtended:
        Result.Add.AsFloat := AItems[I].VExtended^;
{$IFNDEF NEXTGEN}
      vtPChar:
        Result.Add.AsString := QStringW(AItems[I].VPChar);
      vtString:
        Result.Add.AsString := QStringW(AItems[I].VString^);
      vtAnsiString:
        Result.Add.AsString := QStringW(
{$IFDEF UNICODE}
          PAnsiString(AItems[I].VAnsiString)^
{$ELSE}
          AItems[I].VPChar
{$ENDIF UNICODE}
          );
      vtWideString:
        Result.Add.AsString := PWideString(AItems[I].VWideString)^;
{$ENDIF !NEXTGEN}
      vtPointer:
        Result.Add.AsInt64 := IntPtr(AItems[I].VPointer);
      vtWideChar:
        Result.Add.AsString := AItems[I].VWideChar;
      vtPWideChar:
        Result.Add.AsString := AItems[I].VPWideChar;
      vtCurrency:
        Result.Add.AsFloat := AItems[I].VCurrency^;
      vtInt64:
        Result.Add.AsInt64 := AItems[I].VInt64^;
{$IFDEF UNICODE}       // variants
      vtUnicodeString:
        Result.Add.AsString := AItems[I].VPWideChar;
{$ENDIF UNICODE}
      vtVariant:
        Result.Add.AsVariant := AItems[I].VVariant^;
      vtObject:
        begin
          if TObject(AItems[I].VObject) is TQJson then
            Result.Add(TObject(AItems[I].VObject) as TQJson)
          else
            raise Exception.Create(Format(SUnsupportArrayItem, [I]));
        end
    else
      raise Exception.Create(Format(SUnsupportArrayItem, [I]));
    end; // End case
  end; // End for
end;

function TQJson.ArrayItemType(ArrType: PTypeInfo): PTypeInfo;
var
  ATypeData: PTypeData;
begin
  Result := nil;
  if (ArrType <> nil) and (ArrType.Kind in [tkArray, tkDynArray]) then
  begin
    ATypeData := GetTypeData(ArrType);
    if (ATypeData <> nil) then
      Result := ATypeData.elType2^;
    if Result = nil then
    begin
      if ATypeData.BaseType^ = TypeInfo(Byte) then
        Result := TypeInfo(Byte);
    end;
  end;
end;

function TQJson.ArrayItemTypeName(ATypeName: QStringW): QStringW;
var
  p, ps: PQCharW;
  ACount: Integer;
begin
  p := PQCharW(ATypeName);
  if StartWithW(p, 'TArray<', True) then
  begin
    Inc(p, 7);
    ps := p;
    ACount := 1;
    while ACount > 0 do
    begin
      if p^ = '>' then
        Dec(ACount)
      else if p^ = '<' then
        Inc(ACount);
      Inc(p);
    end;
    Result := StrDupX(ps, p - ps - 1);
  end
  else
    Result := '';
end;

procedure TQJson.ArrayNeeded(ANewType: TQJsonDataType);
begin
  if not(DataType in [jdtArray, jdtObject]) then
  begin
    FDataType := ANewType;
    ValidArray;
  end;
end;

procedure TQJson.Assign(ANode: TQJson);
var
  I: Integer;
  AItem, ACopy: TQJson;
begin
  if ANode.FDataType in [jdtArray, jdtObject] then
  begin
    DataType := ANode.FDataType;
    Clear;
    for I := 0 to ANode.Count - 1 do
    begin
      AItem := ANode[I];
      if Length(AItem.FName) > 0 then
      begin
        ACopy := Add(AItem.FName);
        ACopy.FNameHash := AItem.FNameHash;
      end
      else
        ACopy := Add;
      ACopy.Assign(AItem);
    end;
  end
  else
    CopyValue(ANode);
end;

procedure TQJson.AttachTo(ANewParent: TQJson);
begin
  MoveTo(ANewParent, MaxInt);
end;

function TQJson.BoolByName(AName: QStringW; ADefVal: Boolean): Boolean;
var
  AChild: TQJson;
begin
  AChild := ItemByName(AName);
  if Assigned(AChild) then
  begin
    try
      Result := AChild.AsBoolean;
    except
      Result := ADefVal;
    end;
  end
  else
    Result := ADefVal;
end;

function TQJson.BoolByPath(APath: QStringW; ADefVal: Boolean): Boolean;
var
  AItem: TQJson;
begin
  AItem := ItemByPath(APath);
  if Assigned(AItem) then
  begin
    try
      Result := AItem.AsBoolean
    except
      Result := ADefVal;
    end;
  end
  else
    Result := ADefVal;
end;

function TQJson.BooleanToStr(const b: Boolean): QStringW;
begin
  if b then
    Result := CharTrue
  else
    Result := CharFalse;
end;

class function TQJson.BuildJsonString(ABuilder: TQStringCatHelperW;
  S: QStringW): Boolean;
var
  p: PQCharW;
begin
  p := PQCharW(S);
  Result := BuildJsonString(ABuilder, p);
end;

class function TQJson.BuildJsonString(S: QStringW): QStringW;
var
  AHelper: TQStringCatHelperW;
  p: PQCharW;
begin
  AHelper := TQStringCatHelperW.Create;
  try
    p := PQCharW(S);
    BuildJsonString(AHelper, p);
  finally
    FreeAndNil(AHelper);
  end;
end;

class function TQJson.BuildJsonString(ABuilder: TQStringCatHelperW;
  var p: PQCharW): Boolean;
var
  AQuoter: QCharW;
  ps: PQCharW;
begin
  ABuilder.Position := 0;
  if (p^ = '"') or (p^ = '''') then
  begin
    AQuoter := p^;
    Inc(p);
    ps := p;
    Result := False;
    while p^ <> #0 do
    begin
      if (p^ = AQuoter) then
      begin
        if ps <> p then
          ABuilder.Cat(ps, p - ps);
        if p[1] = AQuoter then
        begin
          ABuilder.Cat(AQuoter);
          Inc(p, 2);
          ps := p;
        end
        else
        begin
          Inc(p);
          SkipSpaceW(p);
          ps := p;
          Result := True;
          Break;
        end;
      end
      else if p^ = '\' then
      begin
        if ps <> p then
          ABuilder.Cat(ps, p - ps);
        ABuilder.Cat(CharUnescape(p));
        ps := p;
      end
      else
        Inc(p);
    end;
    if Result then
    begin
      if (ps <> p) then
        ABuilder.Cat(ps, p - ps)
    end
    else
    begin
      ABuilder.Position := 0;
      ABuilder.Cat(ps - 1, p - ps + 1);
    end;
  end
  else
  begin
    Result := True;
    while p^ <> #0 do
    begin
      if (p^ = ':') or (p^ = ']') or (p^ = ',') or (p^ = '}') then
        Break
      else
        ABuilder.Cat(p, 1);
      Inc(p);
    end
  end;
end;

function TQJson.BytesByPath(APath: QStringW; ADefVal: TBytes): TBytes;
var
  AItem: TQJson;
begin
  AItem := ItemByPath(APath);
  if Assigned(AItem) then
  begin
    try
      Result := AItem.AsBytes;
    except
      Result := ADefVal;
    end;
  end
  else
    Result := ADefVal;
end;

class procedure TQJson.JsonCat(ABuilder: TQStringCatHelperW; const S: QStringW;
  ADoEscape: Boolean);
var
  ps: PQCharW;
const
  CharNum1: PWideChar = '1';
  CharNum0: PWideChar = '0';
  Char7: PWideChar = '\b';
  Char9: PWideChar = '\t';
  Char10: PWideChar = '\n';
  Char12: PWideChar = '\f';
  Char13: PWideChar = '\r';
  CharQuoter: PWideChar = '\"';
  CharBackslash: PWideChar = '\\';
  CharCode: PWideChar = '\u00';
  CharEscape: PWideChar = '\u';
begin
  ps := PQCharW(S);
  while ps^ <> #0 do
  begin
    case ps^ of
      #7:
        ABuilder.Cat(Char7, 2);
      #9:
        ABuilder.Cat(Char9, 2);
      #10:
        ABuilder.Cat(Char10, 2);
      #12:
        ABuilder.Cat(Char12, 2);
      #13:
        ABuilder.Cat(Char13, 2);
      '\':
        ABuilder.Cat(CharBackslash, 2);
      '"':
        ABuilder.Cat(CharQuoter, 2);
    else
      begin
        if ps^ < #$1F then
        begin
          ABuilder.Cat(CharCode, 4);
          if ps^ > #$F then
            ABuilder.Cat(CharNum1, 1)
          else
            ABuilder.Cat(CharNum0, 1);
          ABuilder.Cat(HexChar(Ord(ps^) and $0F));
        end
        else if (ps^ <= #$7E) or (not ADoEscape) then // Ӣ���ַ���
          ABuilder.Cat(ps, 1)
        else
          ABuilder.Cat(CharEscape, 2).Cat(HexChar((PWord(ps)^ shr 12) and $0F))
            .Cat(HexChar((PWord(ps)^ shr 8) and $0F))
            .Cat(HexChar((PWord(ps)^ shr 4) and $0F))
            .Cat(HexChar(PWord(ps)^ and $0F));
      end;
    end;
    Inc(ps);
  end;
end;

class function TQJson.CharEscape(c: QCharW; pd: PQCharW): Integer;
begin
  case c of
    #7:
      begin
        pd[0] := '\';
        pd[1] := 'b';
        Result := 2;
      end;
    #9:
      begin
        pd[0] := '\';
        pd[1] := 't';
        Result := 2;
      end;
    #10:
      begin
        pd[0] := '\';
        pd[1] := 'n';
        Result := 2;
      end;
    #12:
      begin
        pd[0] := '\';
        pd[1] := 'f';
        Result := 2;
      end;
    #13:
      begin
        pd[0] := '\';
        pd[1] := 'r';
        Result := 2;
      end;
    '\':
      begin
        pd[0] := '\';
        pd[1] := '\';
        Result := 2;
      end;
    '''':
      begin
        pd[0] := '\';
        pd[1] := '''';
        Result := 2;
      end;
    '"':
      begin
        pd[0] := '\';
        pd[1] := '"';
        Result := 2;
      end;
    '/':
      begin
        pd[0] := '\';
        pd[1] := '/';
        Result := 2;
      end
  else
    begin
      pd[0] := c;
      Result := 1;
    end;
  end;
end;

class function TQJson.CharUnescape(var p: PQCharW): QCharW;
  function DecodeOrd: Integer;
  var
    c: Integer;
  begin
    Result := 0;
    c := 0;
    while (p^ <> #0) and (c < 4) do
    begin
      if IsHexChar(p^) then
        Result := (Result shl 4) + HexValue(p^)
      else
        Break;
      Inc(p);
      Inc(c);
    end
  end;

begin
  if p^ = #0 then
  begin
    Result := #0;
    Exit;
  end;
  if p^ <> '\' then
  begin
    Result := p^;
    Inc(p);
    Exit;
  end;
  Inc(p);
  case p^ of
    'b':
      begin
        Result := #7;
        Inc(p);
      end;
    't':
      begin
        Result := #9;
        Inc(p);
      end;
    'n':
      begin
        Result := #10;
        Inc(p);
      end;
    'f':
      begin
        Result := #12;
        Inc(p);
      end;
    'r':
      begin
        Result := #13;
        Inc(p);
      end;
    '\':
      begin
        Result := '\';
        Inc(p);
      end;
    '''':
      begin
        Result := '''';
        Inc(p);
      end;
    '"':
      begin
        Result := '"';
        Inc(p);
      end;
    'u':
      begin
        // \uXXXX
        if IsHexChar(p[1]) and IsHexChar(p[2]) and IsHexChar(p[3]) and
          IsHexChar(p[4]) then
        begin
          Result := WideChar((HexValue(p[1]) shl 12) or (HexValue(p[2]) shl 8)
            or (HexValue(p[3]) shl 4) or HexValue(p[4]));
          Inc(p, 5);
        end
        else
          raise Exception.CreateFmt(SCharNeeded,
            ['0-9A-Fa-f', StrDupW(p, 0, 4)]);
      end;
    '/':
      begin
        Result := '/';
        Inc(p);
      end
  else
    begin
      if StrictJson then
        raise Exception.CreateFmt(SCharNeeded, ['btfrn"u''/', StrDupW(p, 0, 4)])
      else
      begin
        Result := p^;
        Inc(p);
      end;
    end;
  end;
end;

procedure TQJson.Clear;
var
  I: Integer;
begin
  if FDataType in [jdtArray, jdtObject] then
  begin
    for I := 0 to Count - 1 do
      FreeJson(FItems[I]);
    FItems.Clear;
  end;
end;

function TQJson.Clone: TQJson;
begin
  Result := Copy;
end;

function TQJson.ContainsName(AName: QStringW; ANest: Boolean): Boolean;
var
  I, H: Integer;
  AItem: TQJson;
begin
  Result := ItemByName(AName) <> nil;
  if (not Result) and ANest then
  begin
    H := Count - 1;
    for I := 0 to H do
    begin
      AItem := Items[I];
      if AItem.DataType = jdtObject then
      begin
        Result := Items[I].ContainsName(AName, ANest);
        if Result then
          Break;
      end;
    end;
  end;
end;

function TQJson.ContainsValue(const AValue: Variant;
  ANest, AStrict: Boolean): Boolean;
var
  I, H: Integer;
  AItem: TQJson;
  function CompareValue: Boolean;
  begin
    if AItem.DataType in [jdtUnknown, jdtNull] then
      Result := VarIsNull(AValue)
    else if AStrict then
    begin
      if AItem.DataType = jdtString then
        Result := StrCmpW(PWideChar(AItem.AsString),
          PWideChar({$IFNDEF UNICODE}QStringW({$ENDIF}VarToStr
          (AValue){$IFNDEF UNICODE}){$ENDIF}), IgnoreCase) = 0
      else if (AItem.DataType in [jdtInteger, jdtFloat, jdtBoolean]) and
        VarIsNumeric(AValue) then
        Result := (AItem.AsVariant = AValue)
      else if (AItem.DataType = jdtDateTime) and
        (FindVarData(AValue)^.VType = varDate) then
        Result := SameValue(AItem.AsDateTime, VarToDateTime(AValue))
      else
        Result := False;
    end
    else
      Result := AItem.AsString = VarToStr(AValue);
  end;

begin
  H := Count - 1;
  Result := False;
  for I := 0 to H do
  begin
    AItem := Items[I];
    if (not(AItem.DataType in [jdtObject, jdtArray])) and CompareValue then
    begin
      Result := True;
      Exit;
    end;
  end;
  if ANest then
  begin
    for I := 0 to H do
    begin
      AItem := Items[I];
      if AItem.DataType in [jdtObject, jdtArray] then
      begin
        Result := AItem.ContainsValue(AValue, ANest, AStrict);
        if Result then
          Exit;
      end;
    end;
  end;
end;

function TQJson.Copy: TQJson;
begin
  Result := CreateJson;
  Result.Assign(Self);
end;
{$IF RTLVersion>=21}

function TQJson.CopyIf(const ATag: Pointer;
  AFilter: TQJsonFilterEventA): TQJson;
  procedure NestCopy(AParentSource, AParentDest: TQJson);
  var
    I: Integer;
    Accept: Boolean;
    AChildSource, AChildDest: TQJson;
  begin
    for I := 0 to AParentSource.Count - 1 do
    begin
      Accept := True;
      AChildSource := AParentSource[I];
      AFilter(Self, AChildSource, Accept, ATag);
      if Accept then
      begin
        AChildDest := AParentDest.Add(AChildSource.FName,
          AChildSource.DataType);
        if AChildSource.DataType in [jdtArray, jdtObject] then
        begin
          AChildDest.DataType := AChildSource.DataType;
          NestCopy(AChildSource, AChildDest)
        end
        else
          AChildDest.CopyValue(AChildSource);
      end;
    end;
  end;

begin
  if Assigned(AFilter) then
  begin
    Result := CreateJson;
    Result.FName := Name;
    if DataType in [jdtObject, jdtArray] then
    begin
      NestCopy(Self, Result);
    end
    else
      Result.CopyValue(Self);
  end
  else
    Result := Copy;
end;
{$IFEND >=2010}

function TQJson.CopyIf(const ATag: Pointer; AFilter: TQJsonFilterEvent): TQJson;
  procedure NestCopy(AParentSource, AParentDest: TQJson);
  var
    I: Integer;
    Accept: Boolean;
    AChildSource, AChildDest: TQJson;
  begin
    for I := 0 to AParentSource.Count - 1 do
    begin
      Accept := True;
      AChildSource := AParentSource[I];
      AFilter(Self, AChildSource, Accept, ATag);
      if Accept then
      begin
        AChildDest := AParentDest.Add(AChildSource.FName,
          AChildSource.DataType);
        if AChildSource.DataType in [jdtArray, jdtObject] then
          NestCopy(AChildSource, AChildDest)
        else
          AChildDest.CopyValue(AChildSource);
      end;
    end;
  end;

begin
  if Assigned(AFilter) then
  begin
    Result := CreateJson;
    Result.FName := Name;
    if DataType in [jdtObject, jdtArray] then
    begin
      NestCopy(Self, Result);
    end
    else
      Result.CopyValue(Self);
  end
  else
    Result := Copy;
end;

procedure TQJson.CopyValue(ASource: TQJson);
var
  l: Integer;
begin
  l := Length(ASource.FValue);
  DataType := ASource.DataType;
  SetLength(FValue, l);
  if l > 0 then
    Move(PQCharW(ASource.FValue)^, PQCharW(FValue)^, l shl 1);
end;

constructor TQJson.Create(const AName, AValue: QStringW;
  ADataType: TQJsonDataType);
begin
  inherited Create;
  FName := AName;
  FIgnoreCase := not JsonCaseSensitive;
  if ADataType <> jdtUnknown then
    DataType := ADataType;
  Value := AValue;
end;

function TQJson.CreateJson: TQJson;
begin
  if Assigned(OnQJsonCreate) then
    Result := OnQJsonCreate
  else
    Result := TQJson.Create;
end;

constructor TQJson.Create;
begin
  inherited;
  FCommentStyle := jcsInherited;
  FIgnoreCase := not JsonCaseSensitive;
end;

function TQJson.DateTimeByName(AName: QStringW; ADefVal: TDateTime): TDateTime;
var
  AChild: TQJson;
begin
  AChild := ItemByName(AName);
  if Assigned(AChild) then
  begin
    try
      Result := AChild.AsDateTime;
    except
      Result := ADefVal;
    end;
  end
  else
    Result := ADefVal;
end;

function TQJson.DateTimeByPath(APath: QStringW; ADefVal: TDateTime): TDateTime;
var
  AItem: TQJson;
begin
  AItem := ItemByPath(APath);
  if Assigned(AItem) then
  begin
    try
      Result := AItem.AsDateTime;
    except
      Result := ADefVal;
    end;
  end
  else
    Result := ADefVal;
end;

procedure TQJson.Delete(AName: QStringW);
var
  I: Integer;
begin
  I := IndexOf(AName);
  if I <> -1 then
    Delete(I);
end;
{$IF RTLVersion>=21}

procedure TQJson.DeleteIf(const ATag: Pointer; ANest: Boolean;
  AFilter: TQJsonFilterEventA);
  procedure DeleteChildren(AParent: TQJson);
  var
    I: Integer;
    Accept: Boolean;
    AChild: TQJson;
  begin
    I := 0;
    while I < AParent.Count do
    begin
      Accept := True;
      AChild := AParent.Items[I];
      if ANest then
        DeleteChildren(AChild);
      AFilter(Self, AChild, Accept, ATag);
      if Accept then
        AParent.Delete(I)
      else
        Inc(I);
    end;
  end;

begin
  if Assigned(AFilter) then
    DeleteChildren(Self)
  else
    Clear;
end;
{$IFEND >=2010}

procedure TQJson.DeleteIf(const ATag: Pointer; ANest: Boolean;
  AFilter: TQJsonFilterEvent);
  procedure DeleteChildren(AParent: TQJson);
  var
    I: Integer;
    Accept: Boolean;
    AChild: TQJson;
  begin
    I := 0;
    while I < AParent.Count do
    begin
      Accept := True;
      AChild := AParent.Items[I];
      if ANest then
        DeleteChildren(AChild);
      AFilter(Self, AChild, Accept, ATag);
      if Accept then
        AParent.Delete(I)
      else
        Inc(I);
    end;
  end;

begin
  if Assigned(AFilter) then
    DeleteChildren(Self)
  else
    Clear;
end;

procedure TQJson.Delete(AIndex: Integer);
var
  AJson: TQJson;
begin
  AJson := Remove(AIndex);
  if Assigned(AJson) then
    FreeJson(AJson);
end;

destructor TQJson.Destroy;
begin
  if DataType in [jdtArray, jdtObject] then
  begin
    Clear;
    FreeObject(FItems);
  end;
  inherited;
end;

procedure TQJson.Detach;
begin
  if Assigned(FParent) then
    FParent.Remove(Self);
end;

function TQJson.Diff(AJson: TQJson): TQJson;
  procedure DoDiff(ALeft, ARight, AParent: TQJson);
  var
    I, H1, H2, J: Integer;
    AItem1, AItem2, AResult, ATemp: TQJson;
    AFound, ANameExists: Boolean;
  begin
    if DataType <> AJson.DataType then
      AParent.Add(ALeft.Name, ALeft)
    else
    begin
      H1 := ALeft.Count - 1;
      H2 := ARight.Count - 1;
      for I := 0 to H1 do
      begin
        AItem1 := ALeft[I];
        AFound := False;
        for J := 0 to H2 do
        begin
          AItem2 := ARight[J];
          if (AItem1.Name = AItem2.Name) then
          begin
            AFound := True;
            if not AItem1.Equals(AItem2) then
            begin
              AResult := AParent.Add(AItem1.Name, jdtObject);
              AResult.Add('Value1', AItem1.DataType).Assign(AItem1);
              AResult.Add('Value2', AItem2.DataType).Assign(AItem2);
            end;
            Break;
          end;
        end;
        if not AFound then
          AParent.Add(AItem1.Name).Assign(AItem1);
      end;
    end;
  end;

begin
  Result := TQJson.Create;
  DoDiff(Self, AJson, Result);
  DoDiff(AJson, Self, Result);
end;

procedure TQJson.DoJsonNameChanged(AJson: TQJson);
begin

end;

procedure TQJson.DoParsed;
begin

end;

function TQJson.Encode(ADoFormat: Boolean; ADoEscape: Boolean;
  AIndent: QStringW): QStringW;
var
  ABuilder: TQStringCatHelperW;
begin
  ABuilder := TQStringCatHelperW.Create;
  try
    InternalEncode(ABuilder, ADoFormat, ADoEscape, False, AIndent);
    ABuilder.Back(1); // ɾ�����һ������
    Result := ABuilder.Value;
  finally
    FreeObject(ABuilder);
  end;
end;

class function TQJson.EncodeDateTime(const AValue: TDateTime): QStringW;
var
  ADate: Integer;
begin
  ADate := Trunc(AValue);
  if SameValue(ADate, 0) then // DateΪ0����ʱ��
  begin
    if SameValue(AValue, 0) then
      Result := FormatDateTime(JsonDateFormat, AValue)
    else
      Result := FormatDateTime(JsonTimeFormat, AValue);
  end
  else
  begin
    if SameValue(AValue - ADate, 0) then
      Result := FormatDateTime(JsonDateFormat, AValue)
    else
      Result := FormatDateTime(JsonDateTimeFormat, AValue);
  end;
end;

function TQJson.Equals(AJson: TQJson): Boolean;
var
  I, c: Integer;
begin
  if DataType = AJson.DataType then
  begin
    if DataType in [jdtArray, jdtObject] then
    begin
      Result := Count = AJson.Count;
      if Result then
      begin
        c := Count - 1;
        for I := 0 to c do
        begin
          Result := Items[I].Equals(AJson[I]);
          if not Result then
            Break;
        end;
      end;
    end
    else
      Result := FValue = AJson.FValue;
  end
  else
    Result := False;
end;

function TQJson.Escape(const S: QStringW): QStringW;
var
  ABuilder: TQStringCatHelperW;
begin
  ABuilder := TQStringCatHelperW.Create;
  try
    JsonCat(ABuilder, S, True);
    Result := ABuilder.Value;
  finally
    FreeObject(ABuilder);
  end;
end;

procedure TQJson.ExchangeOrder(AIndex1, AIndex2: Integer);
begin
  FItems.Exchange(AIndex1, AIndex2);
end;

{$IF RTLVersion>=21}

function TQJson.FindIf(const ATag: Pointer; ANest: Boolean;
  AFilter: TQJsonFilterEventA): TQJson;
  function DoFind(AParent: TQJson): TQJson;
  var
    I: Integer;
    AChild: TQJson;
    Accept: Boolean;
  begin
    Result := nil;
    for I := 0 to AParent.Count - 1 do
    begin
      AChild := AParent[I];
      Accept := True;
      AFilter(Self, AChild, Accept, ATag);
      if Accept then
        Result := AChild
      else if ANest then
        Result := DoFind(AChild);
      if Result <> nil then
        Break;
    end;
  end;

begin
  if Assigned(AFilter) then
    Result := DoFind(Self)
  else
    Result := nil;
end;
{$IFEND >=2010}

procedure TQJson.FileFromValue(AFileName: QStringW);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(AFileName, fmCreate);
  try
    StreamFromValue(AStream);
  finally
    FreeObject(AStream);
  end;
end;

function TQJson.FindIf(const ATag: Pointer; ANest: Boolean;
  AFilter: TQJsonFilterEvent): TQJson;
  function DoFind(AParent: TQJson): TQJson;
  var
    I: Integer;
    AChild: TQJson;
    Accept: Boolean;
  begin
    Result := nil;
    for I := 0 to AParent.Count - 1 do
    begin
      AChild := AParent[I];
      Accept := True;
      AFilter(Self, AChild, Accept, ATag);
      if Accept then
        Result := AChild
      else if ANest then
        Result := DoFind(AChild);
      if Result <> nil then
        Break;
    end;
  end;

begin
  if Assigned(AFilter) then
    Result := DoFind(Self)
  else
    Result := nil;
end;

function TQJson.FloatByName(AName: QStringW; ADefVal: Extended): Extended;
var
  AChild: TQJson;
begin
  AChild := ItemByName(AName);
  if Assigned(AChild) then
  begin
    try
      Result := AChild.AsFloat;
    except
      Result := ADefVal;
    end;
  end
  else
    Result := ADefVal;
end;

function TQJson.FloatByPath(APath: QStringW; ADefVal: Extended): Extended;
var
  AItem: TQJson;
begin
  AItem := ItemByPath(APath);
  if Assigned(AItem) then
  begin
    try
      Result := AItem.AsFloat;
    except
      Result := ADefVal;
    end;
  end
  else
    Result := ADefVal;
end;

function TQJson.ForceName(AName: QStringW; AType: TQJsonDataType): TQJson;
var
  I: Integer;
begin
  I := IndexOf(AName);
  if I <> -1 then
    Result := Items[I]
  else
    Result := Add(AName, AType);
end;

function TQJson.ForcePath(APath: QStringW): TQJson;
var
  AName: QStringW;
  p, pn, ws: PQCharW;
  AParent: TQJson;
  l: Integer;
  AIndex: Int64;
const
  PathDelimiters: PWideChar = './\';
begin
  p := PQCharW(APath);
  AParent := Self;
  Result := Self;
  while p^ <> #0 do
  begin
    AName := DecodeTokenW(p, PathDelimiters, WideChar(0), True);
    if not(AParent.DataType in [jdtObject, jdtArray]) then
      AParent.DataType := jdtObject;
    Result := AParent.ItemByName(AName);
    if not Assigned(Result) then
    begin
      pn := PQCharW(AName);
      l := Length(AName);
      AIndex := -1;
      if (pn[l - 1] = ']') then
      begin
        repeat
          if pn[l] = '[' then
          begin
            ws := pn + l + 1;
            if ParseInt(ws, AIndex) = 0 then
              AIndex := -1;
            Break;
          end
          else
            Dec(l);
        until l = 0;
        if l > 0 then
        begin
          AName := StrDupX(pn, l);
          Result := AParent.ItemByName(AName);
          if Result = nil then
            Result := AParent.Add(AName, jdtArray)
          else if Result.DataType <> jdtArray then
            raise Exception.CreateFmt(SBadJsonArray, [AName]);
          if AIndex >= 0 then
          begin
            while Result.Count <= AIndex do
              Result.Add;
            Result := Result[AIndex];
          end;
        end
        else
          raise Exception.CreateFmt(SBadJsonName, [AName]);
      end
      else
      begin
        if AParent.IsArray then
          Result := AParent.Add.Add(AName)
        else
          Result := AParent.Add(AName);
      end;
    end;
    AParent := Result;
  end;
end;

function TQJson.FormatParseError(ACode: Integer; AMsg: QStringW; ps, p: PQCharW)
  : QStringW;
var
  ACol, ARow: Integer;
  ALine: QStringW;
begin
  if ACode <> 0 then
  begin
    p := StrPosW(ps, p, ACol, ARow);
    ALine := DecodeLineW(p, False);
    if Length(ALine) > 1024 then // һ�������1024���ַ�
    begin
      SetLength(ALine, 1024);
      PQCharW(ALine)[1023] := '.';
      PQCharW(ALine)[1022] := '.';
      PQCharW(ALine)[1021] := '.';
    end;
    Result := Format(SJsonParseError, [ARow, ACol, AMsg, ALine]);
  end
  else
    SetLength(Result, 0);
end;

procedure TQJson.FreeJson(AJson: TQJson);
begin
  if Assigned(OnQJsonFree) then
    OnQJsonFree(AJson)
  else
    FreeObject(AJson);
end;
{$IF RTLVersion>=21}

procedure TQJson.FromRecord<T>(const ARecord: T);
begin
  FromRtti(@ARecord, TypeInfo(T));
end;

procedure TQJson.FromRtti(ASource: Pointer; AType: PTypeInfo);
var
  AValue: TValue;
  procedure AddCollection(AParent: TQJson; ACollection: TCollection);
  var
    J: Integer;
  begin
    for J := 0 to ACollection.Count - 1 do
      AParent.Add.FromRtti(ACollection.Items[J]);
  end;
// ����XE6��System.rtti��TValue��tkSet���ʹ����Bug
  function SetAsOrd(AValue: TValue): Int64;
  var
    ATemp: Integer;
  begin
    AValue.ExtractRawData(@ATemp);
    case GetTypeData(AValue.TypeInfo).OrdType of
      otSByte:
        Result := PShortint(@ATemp)^;
      otUByte:
        Result := PByte(@ATemp)^;
      otSWord:
        Result := PSmallint(@ATemp)^;
      otUWord:
        Result := PWord(@ATemp)^;
      otSLong:
        Result := PInteger(@ATemp)^;
      otULong:
        Result := PCardinal(@ATemp)^
    else
      Result := 0;
    end;
  end;
  procedure AddRecord;
  var
    AContext: TRttiContext;
    AFields: TArray<TRttiField>;
    ARttiType: TRttiType;
    I, J: Integer;
    AObj: TObject;
  begin
    AContext := TRttiContext.Create;
    ARttiType := AContext.GetType(AType);
    AFields := ARttiType.GetFields;
    for J := Low(AFields) to High(AFields) do
    begin
      if AFields[J].FieldType <> nil then
      begin
        // ����Ǵӽṹ�壬���¼���Ա������Ƕ�����ֻ��¼�乫�������ԣ����⴦��TStrings��TCollection
        case AFields[J].FieldType.TypeKind of
          tkInteger:
            Add(AFields[J].Name).AsInteger := AFields[J].GetValue(ASource)
              .AsInteger;
{$IFNDEF NEXTGEN}tkString, tkLString, tkWString,
{$ENDIF !NEXTGEN}tkUString:
            Add(AFields[J].Name).AsString :=
              AFields[J].GetValue(ASource).AsString;
          tkEnumeration:
            begin
              if GetTypeData(AFields[J].FieldType.Handle)
                .BaseType^ = TypeInfo(Boolean) then
                Add(AFields[J].Name).AsBoolean := AFields[J].GetValue(ASource)
                  .AsBoolean
              else if JsonRttiEnumAsInt then
                Add(AFields[J].Name).AsInteger := AFields[J].GetValue(ASource)
                  .AsOrdinal
              else
                Add(AFields[J].Name).AsString :=
                  AFields[J].GetValue(ASource).ToString;
            end;
          tkSet:
            begin
              if JsonRttiEnumAsInt then
                Add(AFields[J].Name).AsInt64 :=
                  SetAsOrd(AFields[J].GetValue(ASource))
              else
                Add(AFields[J].Name).AsString :=
                  AFields[J].GetValue(ASource).ToString;
            end;
          tkChar, tkWChar:
            Add(AFields[J].Name).AsString :=
              AFields[J].GetValue(ASource).ToString;
          tkFloat:
            begin
              if (AFields[J].FieldType.Handle = TypeInfo(TDateTime)) or
                (AFields[J].FieldType.Handle = TypeInfo(TTime)) or
                (AFields[J].FieldType.Handle = TypeInfo(TDate)) then
              begin
                // �ж�һ����ֵ�Ƿ���һ����Ч��ֵ

                Add(AFields[J].Name).AsDateTime := AFields[J].GetValue(ASource)
                  .AsExtended
              end
              else
                Add(AFields[J].Name).AsFloat := AFields[J].GetValue(ASource)
                  .AsExtended;
            end;
          tkInt64:
            Add(AFields[J].Name).AsInt64 :=
              AFields[J].GetValue(ASource).AsInt64;
          tkVariant:
            Add(AFields[J].Name).AsVariant := AFields[J].GetValue(ASource)
              .AsVariant;
          tkArray, tkDynArray:
            begin
              with Add(AFields[J].Name, jdtArray) do
              begin
                AValue := AFields[J].GetValue(ASource);
                for I := 0 to AValue.GetArrayLength - 1 do
                  Add.FromRtti(AValue.GetArrayElement(I));
              end;
            end;
          tkClass:
            begin
              AValue := AFields[J].GetValue(ASource);
              AObj := AValue.AsObject;
              if (AObj is TStrings) then
                Add(AFields[J].Name).AsString := TStrings(AObj).Text
              else if AObj is TCollection then
                AddCollection(AddArray(AFields[J].Name), AObj as TCollection)
              else // �������͵Ķ��󲻱���
                Add(AFields[J].Name, jdtObject)
                  .FromRtti(AObj, AFields[J].FieldType.Handle);
            end;
          tkRecord:
            begin
              DataType := jdtObject;
              AValue := AFields[J].GetValue(ASource);
              Add(AFields[J].Name)
                .FromRtti(Pointer(IntPtr(ASource) + AFields[J].Offset),
                AFields[J].FieldType.Handle);
            end;
        end;
      end
      else
        raise Exception.CreateFmt(SMissRttiTypeDefine, [AFields[J].Name]);
    end;
  end;

  procedure AddObject;
  var
    APropList: PPropList;
    ACount: Integer;
    J: Integer;
    AObj, AChildObj: TObject;
    AName: String;
  begin
    AObj := ASource;
    if AObj is TStrings then
      AsString := (AObj as TStrings).Text
    else if AObj is TCollection then
    begin
      DataType := jdtArray;
      AddCollection(Self, AObj as TCollection)
    end
    else
    begin
      APropList := nil;
      ACount := GetPropList(AType, APropList);
      try
        for J := 0 to ACount - 1 do
        begin
          if not(APropList[J].PropType^.Kind in [tkMethod, tkInterface,
            tkClassRef, tkPointer, tkProcedure]) then
          begin
{$IF RTLVersion>25}
            AName := APropList[J].NameFld.ToString;
{$ELSE}
            AName := String(APropList[J].Name);
{$IFEND}
            case APropList[J].PropType^.Kind of
              tkClass:
                begin
                  AChildObj := Pointer(GetOrdProp(AObj, APropList[J]));
                  if AChildObj is TStrings then
                    Add(AName).AsString := (AChildObj as TStrings).Text
                  else if AChildObj is TCollection then
                    AddCollection(AddArray(AName), AChildObj as TCollection)
                  else
                    Add(AName, jdtObject).FromRtti(AChildObj);
                end;
              tkRecord, tkArray, tkDynArray: // ��¼�����顢��̬��������ϵͳҲ�����棬Ҳû�ṩ����̫�õĽӿ�
                raise Exception.Create(SUnsupportPropertyType);
              tkInteger:
                Add(AName).AsInt64 := GetOrdProp(AObj, APropList[J]);
              tkFloat:
                begin
                  if (APropList[J].PropType^ = TypeInfo(TDateTime)) or
                    (APropList[J].PropType^ = TypeInfo(TTime)) or
                    (APropList[J].PropType^ = TypeInfo(TDate)) then
                  begin
                    // �ж�һ����ֵ�Ƿ���һ����Ч��ֵ
                    Add(AName).AsDateTime := GetFloatProp(AObj, APropList[J]);
                  end
                  else
                    Add(AName).AsFloat := GetFloatProp(AObj, APropList[J]);
                end;
              tkChar, tkString, tkWChar, tkLString, tkWString, tkUString:
                Add(AName).AsString := GetStrProp(AObj, APropList[J]);
              tkEnumeration:
                begin
                  if GetTypeData(APropList[J]^.PropType^)
                    ^.BaseType^ = TypeInfo(Boolean) then
                    Add(AName).AsBoolean := GetOrdProp(AObj, APropList[J]) <> 0
                  else if JsonRttiEnumAsInt then
                    Add(AName).AsInteger := GetOrdProp(AObj, APropList[J])
                  else
                    Add(AName).AsString := GetEnumProp(AObj, APropList[J]);
                end;
              tkSet:
                begin
                  if JsonRttiEnumAsInt then
                    Add(AName).AsInteger := GetOrdProp(AObj, APropList[J])
                  else
                    Add(AName).AsString := GetSetProp(AObj, APropList[J], True);
                end;
              tkVariant:
                Add(AName).AsVariant := GetPropValue(AObj, APropList[J]);
              tkInt64:
                Add(AName).AsInt64 := GetInt64Prop(AObj, APropList[J]);
            end;
          end;
        end;
      finally
        if Assigned(APropList) then
          FreeMem(APropList);
      end;
    end;
  end;

  procedure AddArray;
  var
    I, c: Integer;
  begin
    DataType := jdtArray;
    Clear;
    TValue.Make(ASource, AType, AValue);
    c := AValue.GetArrayLength;
    for I := 0 to c - 1 do
      Add.FromRtti(AValue.GetArrayElement(I));
  end;

begin
  if ASource = nil then
    Exit;
  Clear;
  case AType.Kind of
    tkRecord:
      AddRecord;
    tkClass:
      AddObject;
    tkDynArray:
      AddArray;
  end;
end;

procedure TQJson.FromRtti(AInstance: TValue);
var
  I, c: Integer;
begin
  case AInstance.Kind of
    tkClass:
      FromRtti(AInstance.AsObject, AInstance.TypeInfo);
    tkRecord:
      FromRtti(AInstance.GetReferenceToRawData, AInstance.TypeInfo);
    tkArray, tkDynArray:
      begin
        DataType := jdtArray;
        Clear;
        c := AInstance.GetArrayLength;
        for I := 0 to c - 1 do
          Add.FromRtti(AInstance.GetArrayElement(I));
      end;
    tkInteger:
      AsInt64 := AInstance.AsInt64;
    tkChar, tkString, tkWChar, tkLString, tkWString, tkUString:
      AsString := AInstance.ToString;
    tkEnumeration:
      begin
        if GetTypeData(AInstance.TypeInfo)^.BaseType^ = TypeInfo(Boolean) then
          AsBoolean := AInstance.AsBoolean
        else if JsonRttiEnumAsInt then
          AsInteger := AInstance.AsOrdinal
        else
          AsString := AInstance.ToString;
      end;
    tkSet:
      AsString := AInstance.ToString;
    tkVariant:
      AsVariant := AInstance.AsVariant;
    tkInt64:
      AsInt64 := AInstance.AsInt64;
  end;
end;
{$IFEND >=2010}

function TQJson.GetAsArray: QStringW;
begin
  if DataType = jdtArray then
    Result := Value
  else
    raise Exception.Create(Format(SBadConvert, [AsString, 'Array']));
end;

function TQJson.GetAsBoolean: Boolean;
begin
  if DataType = jdtBoolean then
    Result := PBoolean(FValue)^
  else if DataType = jdtString then
  begin
    if not TryStrToBool(FValue, Result) then
      raise Exception.Create(Format(SBadConvert, [FValue, 'Boolean']));
  end
  else if DataType in [jdtFloat, jdtDateTime] then
    Result := not SameValue(AsFloat, 0, 5E-324)
  else if DataType = jdtInteger then
    Result := AsInt64 <> 0
  else
    raise Exception.Create(Format(SBadConvert, [JsonTypeName[DataType],
      'Boolean']));
end;

function TQJson.GetAsBytes: TBytes;
var
  I: Integer;
  AItem: TQJson;
  procedure StrToBin;
  var
    S: QStringW;
  begin
    S := AsString;
    Result := HexToBin(S);
    if Length(Result) = 0 then
      raise Exception.CreateFmt(SConvertError, ['jdtString', 'Bytes']);
  end;

begin
  if DataType = jdtString then // �ַ���
  begin
    if Assigned(OnQJsonDecodeBytes) then
      OnQJsonDecodeBytes(AsString, Result)
    else
      Result := HexToBin(AsString);
  end
  else if DataType = jdtArray then
  begin
    SetLength(Result, Count);
    for I := 0 to Count - 1 do
    begin
      AItem := Items[I];
      if (AItem.DataType = jdtInteger) and (AItem.AsInteger >= 0) and
        (AItem.AsInteger <= 255) then
        Result[I] := AItem.AsInteger
      else
        raise Exception.CreateFmt(SConvertError, ['jdtArray', 'Bytes']);
    end;
  end
  else
    raise Exception.CreateFmt(SConvertError, [JsonTypeName[DataType], 'Bytes']);
end;

function TQJson.GetAsDateTime: TDateTime;
begin
  if DataType in [jdtDateTime, jdtFloat] then
    Result := PExtended(FValue)^
  else if DataType = jdtString then
  begin
    if not(ParseDateTime(PWideChar(FValue), Result) or
      ParseJsonTime(PWideChar(FValue), Result) or ParseWebTime(PQCharW(FValue),
      Result)) then
      raise Exception.Create(Format(SBadConvert, ['String', 'DateTime']))
  end
  else if DataType = jdtInteger then
    Result := AsInt64
  else if DataType in [jdtNull, jdtUnknown] then
    Result := 0
  else
    raise Exception.Create(Format(SBadConvert, [JsonTypeName[DataType],
      'DateTime']));
end;

function TQJson.GetAsFloat: Extended;
  procedure StrAsFloat;
  var
    p: PQCharW;
  begin
    p := PQCharW(FValue);
    if (not ParseNumeric(p, Result)) or (p^ <> #0) then
      raise Exception.Create(Format(SBadConvert, [FValue, 'Numeric']));
  end;

begin
  if DataType in [jdtFloat, jdtDateTime] then
    Result := PExtended(FValue)^
  else if DataType = jdtBoolean then
    Result := Integer(AsBoolean)
  else if DataType = jdtString then
    StrAsFloat
  else if DataType = jdtInteger then
    Result := AsInt64
  else if DataType = jdtNull then
    Result := 0
  else
    raise Exception.Create(Format(SBadConvert, [JsonTypeName[DataType],
      'Numeric']))
end;

function TQJson.GetAsInt64: Int64;
begin
  if DataType = jdtInteger then
    Result := PInt64(FValue)^
  else if DataType in [jdtFloat, jdtDateTime] then
    Result := Trunc(PExtended(FValue)^)
  else if DataType = jdtBoolean then
    Result := Integer(AsBoolean)
  else if DataType = jdtString then
    Result := Trunc(AsFloat)
  else if DataType = jdtNull then
    Result := 0
  else
    raise Exception.Create(Format(SBadConvert, [JsonTypeName[DataType],
      'Numeric']))
end;

function TQJson.GetAsInteger: Integer;
begin
  Result := GetAsInt64;
end;

function TQJson.GetAsJson: QStringW;
begin
  Result := Encode(True, False, '  ');
end;

function TQJson.GetAsObject: QStringW;
begin
  if DataType = jdtObject then
    Result := Value
  else
    raise Exception.Create(Format(SBadConvert, [AsString, 'Object']));
end;

function TQJson.GetAsString: QStringW;
begin
  if DataType in [jdtNull, jdtUnknown] then
    SetLength(Result, 0)
  else
    Result := Value;
end;

function TQJson.GetAsVariant: Variant;
var
  I: Integer;
begin
  case DataType of
    jdtNull:
      Result := Null;
    jdtString:
      begin
        if IsDateTime then
          Result := AsDateTime
        else
          Result := AsString;
      end;
    jdtInteger:
      Result := AsInt64;
    jdtFloat:
      Result := AsFloat;
    jdtDateTime:
      Result := AsDateTime;
    jdtBoolean:
      Result := AsBoolean;
    jdtArray, jdtObject:
      begin
        Result := VarArrayCreate([0, Count - 1], varVariant);
        for I := 0 to Count - 1 do
          Result[I] := Items[I].AsVariant;
      end
  else
    VarClear(Result);
  end;
end;

function TQJson.GetCount: Integer;
begin
  if DataType in [jdtObject, jdtArray] then
    Result := FItems.Count
  else
    Result := 0;
end;

function TQJson.GetEnumerator: TQJsonEnumerator;
begin
  Result := TQJsonEnumerator.Create(Self);
end;

function TQJson.GetIsArray: Boolean;
begin
  Result := (DataType = jdtArray);
end;

function TQJson.GetIsBool: Boolean;
begin
  if DataType = jdtBoolean then
    Result := True
  else if DataType = jdtString then
    Result := TryStrToBool(FValue, Result)
  else
    Result := DataType in [jdtInteger, jdtFloat, jdtDateTime];
end;

function TQJson.GetIsDateTime: Boolean;
var
  ATime: TDateTime;
begin
  Result := (DataType = jdtDateTime);
  if not Result then
  begin
    if DataType = jdtString then
      Result := ParseDateTime(PQCharW(FValue), ATime) or
        ParseJsonTime(PQCharW(FValue), ATime) or
        ParseWebTime(PQCharW(FValue), ATime);
  end;
end;

function TQJson.GetIsNull: Boolean;
begin
  Result := (DataType = jdtNull);
end;

function TQJson.GetIsNumeric: Boolean;
var
  V: Extended;
begin
  if DataType in [jdtInteger, jdtFloat] then
    Result := True
  else if (DataType = jdtString) then
    Result := TryStrToFloat(AsString, V)
  else
    Result := False;
end;

function TQJson.GetIsObject: Boolean;
begin
  Result := (DataType = jdtObject);
end;

function TQJson.GetIsString: Boolean;
begin
  Result := (DataType = jdtString);
end;

function TQJson.GetItemIndex: Integer;
var
  I: Integer;
begin
  Result := -1;
  if Assigned(Parent) then
  begin
    for I := 0 to Parent.Count - 1 do
    begin
      if Parent.Items[I] = Self then
      begin
        Result := I;
        Break;
      end;
    end;
  end;
end;

function TQJson.GetItems(AIndex: Integer): TQJson;
begin
  Result := FItems[AIndex];
end;

function TQJson.GetPath: QStringW;
var
  AParent, AItem: TQJson;
begin
  AParent := FParent;
  AItem := Self;
  SetLength(Result, 0);
  repeat
    if Assigned(AParent) and AParent.IsArray then
      Result := '[' + IntToStr(AItem.ItemIndex) + ']' + Result
    else if AItem.IsArray then
      Result := '\' + AItem.FName + Result
    else
      Result := '\' + AItem.FName + Result;
    if AParent <> nil then
    begin
      AItem := AParent;
      AParent := AItem.Parent;
    end;
  until AParent = nil;
  if Length(Result) > 0 then
    Result := StrDupX(PQCharW(Result) + 1, Length(Result) - 1);
end;

function TQJson.GetRelPath(AParent: TQJson; APathDelimiter: QCharW): QStringW;
var
  AItem: TQJson;
begin
  Result := Name;
  AItem := Parent;
  while (AItem <> nil) and (AItem <> AParent) do
  begin
    Result := AItem.Name + APathDelimiter + Result;
    AItem := AItem.Parent;
  end;
end;

function TQJson.GetRoot: TQJson;
begin
  Result := Self;
  while Result.FParent <> nil do
    Result := Result.FParent;
end;

function TQJson.GetValue: QStringW;
  procedure ValueAsDateTime;
  var
    ADate: Integer;
    AValue: Extended;
  begin
    AValue := PExtended(FValue)^;
    ADate := Trunc(AValue);
    if SameValue(ADate, 0) then // DateΪ0����ʱ��
    begin
      if SameValue(AValue, 0) then
        Result := FormatDateTime(JsonDateFormat, AValue)
      else
        Result := FormatDateTime(JsonTimeFormat, AValue);
    end
    else
    begin
      if SameValue(AValue - ADate, 0) then
        Result := FormatDateTime(JsonDateFormat, AValue)
      else
        Result := FormatDateTime(JsonDateTimeFormat, AValue);
    end;
  end;

begin
  case DataType of
    jdtNull, jdtUnknown:
      Result := CharNull;
    jdtString:
      Result := FValue;
    jdtInteger:
      Result := IntToStr(PInt64(FValue)^);
    jdtFloat:
      Result := FloatToStr(PExtended(FValue)^);
    jdtDateTime:
      ValueAsDateTime;
    jdtBoolean:
      Result := BooleanToStr(PBoolean(FValue)^);
    jdtArray, jdtObject:
      Result := Encode(True);
  end;
end;

function TQJson.HasChild(ANamePath: QStringW; var AChild: TQJson): Boolean;
begin
  AChild := ItemByPath(ANamePath);
  Result := AChild <> nil;
end;

function TQJson.HashName(const S: QStringW): TQHashType;
var
  ATemp: QStringW;
begin
  if IgnoreCase then
  begin
    ATemp := UpperCase(S);
    Result := HashOf(PQCharW(S), Length(S) shl 1);
  end
  else
    Result := HashOf(PQCharW(S), Length(S) shl 1)
end;

function TQJson.IndexOf(const AName: QStringW): Integer;
var
  I, l: Integer;
  AItem: TQJson;
  AHash: Cardinal;
begin
  Result := -1;
  l := Length(AName);
  if l > 0 then
    AHash := HashName(AName)
  else
  begin
    Exit;
  end;
  for I := 0 to Count - 1 do
  begin
    AItem := Items[I];
    if Length(AItem.FName) = l then
    begin
      if not IgnoreCase then
      begin
        if AItem.FNameHash = 0 then
          AItem.FNameHash := HashName(AItem.FName);
        if AItem.FNameHash = AHash then
        begin
          if AItem.FName = AName then
          begin
            Result := I;
            Break;
          end;
        end;
      end
      else if StartWithW(PQCharW(AItem.FName), PQCharW(AName), True) then
      begin
        Result := I;
        Break;
      end;
    end;
  end;
end;

function TQJson.IntByName(AName: QStringW; ADefVal: Int64): Int64;
var
  AChild: TQJson;
begin
  AChild := ItemByName(AName);
  if Assigned(AChild) then
  begin
    try
      Result := AChild.AsInt64;
    except
      Result := ADefVal;
    end;
  end
  else
    Result := ADefVal;
end;

function TQJson.IntByPath(APath: QStringW; ADefVal: Int64): Int64;
var
  AItem: TQJson;
begin
  AItem := ItemByPath(APath);
  if Assigned(AItem) then
  begin
    try
      Result := AItem.AsInt64;
    except
      Result := ADefVal;
    end;
  end
  else
    Result := ADefVal;
end;

function TQJson.InternalEncode(ABuilder: TQStringCatHelperW; ADoFormat: Boolean;
  ADoEscape: Boolean; ANullConvert: Boolean; const AIndent: QStringW)
  : TQStringCatHelperW;
  procedure StrictJsonTime(ATime: TDateTime);
  var
    MS: Int64; // ʱ����Ϣ������
  const
    JsonTimeStart: PWideChar = '"/DATE(';
    JsonTimeEnd: PWideChar = ')/"';
  begin
    MS := Trunc(ATime * 86400000);
    ABuilder.Cat(JsonTimeStart, 7);
    ABuilder.Cat(IntToStr(MS));
    ABuilder.Cat(JsonTimeEnd, 3);
  end;
  procedure AddComment(const S: QStringW);
  var
    p: PQCharW;
    ALine: QStringW;
  const
    SLineComment: PWideChar = '//';
    SBlockComentStart: PWideChar = '/*';
    SBlockComentStop: PWideChar = '*/';
  begin
    p := PQCharW(S);
    while p^ <> #0 do
    begin
      ALine := DecodeLineW(p, False);
      ABuilder.Cat(SLineComment, 2);
      ABuilder.Cat(ALine);
      ABuilder.Cat(SLineBreak);
    end;
  end;
  procedure DoEncode(ANode: TQJson; ALevel: Integer);
  var
    I: Integer;
    ArrayWraped: Boolean;
    AChild: TQJson;
    ACommented: Boolean;
  begin
    if (not StrictJson) and (Length(ANode.Comment) > 0) and
      ((ANode.CommentStyle = jcsBeforeName) or
      ((ANode.CommentStyle = jcsInherited) and (CommentStyle = jcsBeforeName)))
    then
    begin
      ACommented := True;
      AddComment(ANode.Comment);
    end
    else
      ACommented := False;
    if (ANode.Parent <> nil) and (ANode.Parent.DataType <> jdtArray) and
      (ANode <> Self) then
    begin
      if ADoFormat then
        ABuilder.Replicate(AIndent, ALevel);
      ABuilder.Cat(CharNameStart);
      JsonCat(ABuilder, ANode.FName, ADoEscape);
      ABuilder.Cat(CharNameEnd);
    end;
    case ANode.DataType of
      jdtArray:
        begin
          ABuilder.Cat(CharArrayStart);
          if ANode.Count > 0 then
          begin
            ArrayWraped := False;
            for I := 0 to ANode.Count - 1 do
            begin
              AChild := ANode.Items[I];
              if AChild.DataType in [jdtArray, jdtObject] then
              begin
                if ADoFormat then
                begin
                  ABuilder.Cat(SLineBreak); // ���ڶ�������飬����
                  ABuilder.Replicate(AIndent, ALevel + 1);
                  ArrayWraped := True;
                end;
              end;
              DoEncode(AChild, ALevel + 1);
            end;
            ABuilder.Back(1);
            if ArrayWraped then
            begin
              ABuilder.Cat(SLineBreak);
              ABuilder.Replicate(AIndent, ALevel);
            end;
          end;
          ABuilder.Cat(CharArrayEnd);
        end;
      jdtObject:
        begin
          if ADoFormat then
          begin
            ABuilder.Cat(CharObjectStart);
            ABuilder.Cat(SLineBreak);
          end
          else
            ABuilder.Cat(CharObjectStart);
          if ANode.Count > 0 then
          begin
            for I := 0 to ANode.Count - 1 do
            begin
              AChild := ANode.Items[I];
              // if Length(AChild.Name) = 0 then
              // raise Exception.CreateFmt(SObjectChildNeedName, [ANode.Name, I]);
              DoEncode(AChild, ALevel + 1);
              if ADoFormat then
                ABuilder.Cat(SLineBreak);
            end;
            if ADoFormat then
              ABuilder.BackIf(' '#9#10#13);
            ABuilder.Back(1);
            if ADoFormat then
              ABuilder.BackIf(' '#9#10#13);
          end;
          if ADoFormat then
          begin
            ABuilder.Cat(SLineBreak);
            ABuilder.Replicate(AIndent, ALevel);
          end;
          ABuilder.Cat(CharObjectEnd);
        end;
      jdtNull, jdtUnknown:
        begin
          if ANullConvert then
            ABuilder.Cat(CharStringStart).Cat(CharStringEnd)
          else
            ABuilder.Cat(CharNull);
        end;
      jdtString:
        begin
          ABuilder.Cat(CharStringStart);
          JsonCat(ABuilder, ANode.FValue, ADoEscape);
          ABuilder.Cat(CharStringEnd);
        end;
      jdtInteger, jdtFloat, jdtBoolean:
        ABuilder.Cat(ANode.Value);
      jdtDateTime:
        begin
          ABuilder.Cat(CharStringStart);
          if StrictJson then
            StrictJsonTime(ANode.AsDateTime)
          else
            ABuilder.Cat(ANode.Value);
          ABuilder.Cat(CharStringEnd);
        end;
    end;
    if (not StrictJson) and (Length(ANode.Comment) > 0) and
      ((ANode.CommentStyle = jcsAfterValue) or
      ((ANode.CommentStyle = jcsInherited) and (CommentStyle = jcsAfterValue)))
    then
    begin
      AddComment(ANode.Comment);
      if ADoFormat then
        ABuilder.Replicate(AIndent, ALevel);
    end;
    ABuilder.Cat(CharComma);
  end;

begin
  Result := ABuilder;
  DoEncode(Self, 0);
end;

procedure TQJson.InternalRttiFilter(ASender: TQJson; AObject: Pointer;
  APropName: QStringW; APropType: PTypeInfo; var Accept: Boolean;
  ATag: Pointer);
var
  ATagData: PQJsonInternalTagData;
  procedure DoNameFilter;
  var
    ps: PQCharW;
  begin
    if Length(ATagData.AcceptNames) > 0 then
    begin
      Accept := False;
      ps := StrIStrW(PQCharW(ATagData.AcceptNames), PQCharW(APropName));
      if (ps <> nil) and ((ps = PQCharW(ATagData.AcceptNames)) or (ps[-1] = ',')
        or (ps[-1] = ';')) then
      begin
        ps := ps + Length(APropName);
        Accept := (ps^ = ',') or (ps^ = ';') or (ps^ = #0);
      end;
    end
    else if Length(ATagData.IgnoreNames) > 0 then
    begin
      ps := StrIStrW(PQCharW(ATagData.IgnoreNames), PQCharW(APropName));
      Accept := True;
      if (ps <> nil) and ((ps = PQCharW(ATagData.IgnoreNames)) or (ps[-1] = ',')
        or (ps[-1] = ';')) then
      begin
        ps := ps + Length(APropName);
        Accept := not((ps^ = ',') or (ps^ = ';') or (ps^ = #0));
      end;
    end;
  end;

begin
  ATagData := PQJsonInternalTagData(ATag);
  if ATagData.TagType = ttNameFilter then
  begin
    DoNameFilter;
    Exit;
  end;
{$IF RTLVersion>=21}
  if ATagData.TagType = ttAnonEvent then
  begin
    ATagData.OnEvent(ASender, AObject, APropName, APropType, Accept,
      ATagData.Tag);
  end;
{$IFEND >=2010}
end;

function TQJson.Intersect(AJson: TQJson): TQJson;
var
  I, H1, H2, J: Integer;
  AItem1, AItem2, AResult: TQJson;
begin
  Result := TQJson.Create;
  if DataType = AJson.DataType then
  begin
    H1 := Count - 1;
    H2 := AJson.Count - 1;
    for I := 0 to H1 do
    begin
      AItem1 := Items[I];
      for J := 0 to H2 do
      begin
        AItem2 := AJson[J];
        if (AItem1.Name = AItem2.Name) and (AItem1.DataType = AItem2.DataType)
        then
        begin
          if AItem1.DataType in [jdtArray, jdtObject] then
          begin
            AResult := AItem1.Intersect(AItem2);
            if AResult.Count > 0 then
              Result.Add(AItem1.Name, AResult)
            else
              FreeAndNil(AResult);
          end
          else if AItem1.FValue = AItem2.FValue then
          begin
            Result.Add(AItem1.Name, AItem1.DataType).Assign(AItem1);
            Break;
          end;
        end;
      end;
    end;
  end;
end;

function TQJson.IsChildOf(AParent: TQJson): Boolean;
begin
  if Assigned(FParent) then
  begin
    if AParent = FParent then
      Result := True
    else
      Result := FParent.IsChildOf(AParent);
  end
  else
    Result := False;
end;

function TQJson.Exists(const APath: QStringW): Boolean;
begin
  Result := ItemByPath(APath) <> nil;
end;

function TQJson.IsParentOf(AChild: TQJson): Boolean;
begin
  if Assigned(AChild) then
    Result := AChild.IsChildOf(Self)
  else
    Result := False;
end;

function TQJson.ItemByName(AName: QStringW): TQJson;
var
  I: Integer;
  p: PQCharW;
  AIndex: Int64;
begin
  Result := nil;
  p := PQCharW(AName);
  if (p^ = '[') and (DataType in [jdtObject, jdtArray]) then
  begin
    Inc(p);
    SkipSpaceW(p);
    if ParseInt(p, AIndex) <> 0 then
    begin
      SkipSpaceW(p);
      if p^ = ']' then
      begin
        Inc(p);
        if p^ <> #0 then
          Exit;
      end
      else
        Exit;
    end
    else
      Exit;
    if (AIndex >= 0) and (AIndex < Count) then
      Result := Items[AIndex];
  end
  else if DataType = jdtObject then
  begin
    I := IndexOf(AName);
    if I <> -1 then
      Result := Items[I];
  end;
end;

function TQJson.ItemByName(const AName: QStringW; AList: TQJsonItemList;
  ANest: Boolean): Integer;
var
  AHash: Cardinal;
  l: Integer;
  function InternalFind(AParent: TQJson): Integer;
  var
    I: Integer;
    AItem: TQJson;
  begin
    Result := -1;
    for I := 0 to Count - 1 do
    begin
      AItem := Items[I];
      if Length(AItem.FName) = l then
      begin
        if not AItem.IgnoreCase then
        begin
          if AItem.FNameHash = 0 then
            AItem.FNameHash := HashName(AItem.FName);
          if AItem.FNameHash = AHash then
          begin
            if AItem.FName = AName then
              AList.Add(AItem);
          end;
        end
        else if StartWithW(PQCharW(AItem.FName), PQCharW(AName), True) then
          AList.Add(AItem);
      end;
      if ANest then
        InternalFind(AItem);
    end;
  end;

begin
  l := Length(AName);
  if l > 0 then
  begin
    AHash := HashName(AName);
    Result := InternalFind(Self);
  end
  else
  begin
    AHash := 0;
    Result := -1;
    Exit;
  end;
end;

function TQJson.ItemByPath(APath: QStringW): TQJson;
var
  AParent: TQJson;
  AName: QStringW;
  p, pn, ws: PQCharW;
  l: Integer;
  AIndex: Int64;
const
  PathDelimiters: PWideChar = './\';
  ArrayStart: PWideChar = '[';
begin
  AParent := Self;
  p := PQCharW(APath);
  Result := nil;
  while Assigned(AParent) and (p^ <> #0) do
  begin
    AName := DecodeTokenW(p, PathDelimiters, WideChar(0), False);
    if Length(AName) > 0 then
    begin
      // ���ҵ������飿
      l := Length(AName);
      AIndex := -1;
      pn := PQCharW(AName);
      if (pn[l - 1] = ']') then
      begin
        ws := pn;
        if pn^ = '[' then // �����ֱ�ӵ����飬��ֱ��ȡ��ǰ��parentΪ����ĸ�
          Result := AParent
        else
        begin
          SkipUntilW(ws, ArrayStart);
          Result := AParent.ItemByName
            (StrDupX(pn, (IntPtr(ws) - IntPtr(pn)) shr 1));
        end;
        if Result <> nil then
        begin
          if Result.DataType in [jdtArray, jdtObject] then
          begin
            repeat
              Inc(ws);
              SkipSpaceW(ws);
              if ParseInt(ws, AIndex) <> 0 then
              begin
                if (AIndex >= 0) and (AIndex < Result.Count) then
                begin
                  Result := Result[AIndex];
                  SkipSpaceW(ws);
                  if ws^ = ']' then
                  begin
                    Inc(ws);
                    SkipSpaceW(ws);
                    if ws^ = '[' then
                      Continue
                    else if ws^ = #0 then
                      Break
                    else
                      Result := nil;
                  end
                  else
                    Result := nil;
                end
                else
                  Result := nil;
              end;
            until Result = nil;
          end
        end;
      end
      else
        Result := AParent.ItemByName(AName);
      if Assigned(Result) then
        AParent := Result
      else
      begin
        Exit;
      end;
    end;
    if CharInW(p, PathDelimiters) then
      Inc(p);
    // ������..��//\\��·��������
  end;
  if p^ <> #0 then
    Result := nil;
end;
{$IFDEF ENABLE_REGEX}

function TQJson.ItemByRegex(const ARegex: QStringW; AList: TQJsonItemList;
  ANest: Boolean): Integer;
var
  ANode: TQJson;
  APcre: TPerlRegEx;
  function RegexStr(const S: QStringW):
{$IF RTLVersion<=24}UTF8String{$ELSE}UnicodeString{$IFEND};
  begin
{$IF RTLVersion<19}
    Result := System.UTF8Encode(S);
{$ELSE}
{$IF RTLVersion<=24}
    Result := UTF8String(S);
{$ELSE}
    Result := S;
{$IFEND}
{$IFEND}
  end;
  function InternalFind(AParent: TQJson): Integer;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 0 to AParent.Count - 1 do
    begin
      ANode := AParent.Items[I];
      APcre.Subject := RegexStr(ANode.Name);
      if APcre.Match then
      begin
        AList.Add(ANode);
        Inc(Result);
      end;
      if ANest then
        Inc(Result, InternalFind(ANode));
    end;
  end;

begin
  APcre := TPerlRegEx.Create;
  try
    APcre.RegEx := RegexStr(ARegex);
    APcre.Compile;
    Result := InternalFind(Self);
  finally
    FreeObject(APcre);
  end;
end;
{$ENDIF}

class function TQJson.JsonCat(const S: QStringW; ADoEscape: Boolean): QStringW;
var
  ABuilder: TQStringCatHelperW;
begin
  ABuilder := TQStringCatHelperW.Create;
  try
    JsonCat(ABuilder, S, ADoEscape);
    Result := ABuilder.Value;
  finally
    FreeObject(ABuilder);
  end;
end;

class function TQJson.JsonEscape(const S: QStringW; ADoEscape: Boolean)
  : QStringW;
begin
  Result := JsonCat(S, ADoEscape);
end;

class function TQJson.JsonUnescape(const S: QStringW): QStringW;
begin
  Result := BuildJsonString(S);
end;

procedure TQJson.LoadFromFile(AFileName: String; AEncoding: TTextEncoding);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(AStream, AEncoding);
  finally
    FreeObject(AStream);
  end;
end;

procedure TQJson.LoadFromStream(AStream: TStream; AEncoding: TTextEncoding);
var
  S: QStringW;
begin
  S := LoadTextW(AStream, AEncoding);
  case Length(S) of
    0:
      DataType := jdtNull;
    1:
      raise Exception.Create(SBadJson)
  else
    Parse(PQCharW(S), Length(S));
  end;
end;

procedure TQJson.Merge(ASource: TQJson; AMethod: TQJsonMergeMethod);
var
  I, AIdx: Integer;
  ASourceChild: TQJson;
  function IndexOfValue: Integer;
  var
    J, H: Integer;
    AItem: TQJson;
  begin
    H := Count - 1;
    Result := -1;
    for J := 0 to H do
    begin
      AItem := Items[J];
      if AItem.Equals(ASourceChild) then
      begin
        Result := J;
        Break;
      end;
    end;
  end;

begin
  for I := 0 to ASource.Count - 1 do
  begin
    ASourceChild := ASource[I];
    if AMethod <> jmmAppend then
    begin
      if ASourceChild.IsArray then
        AIdx := IndexOfValue
      else
        AIdx := IndexOf(ASourceChild.Name);
      if AIdx = -1 then
        Add(ASourceChild.Name, ASourceChild.DataType).Assign(ASourceChild)
      else if AMethod = jmmAsSource then
        Items[AIdx].Assign(ASourceChild);
    end
    else
      Add(ASourceChild.Name, ASourceChild.DataType).Assign(ASourceChild);
  end;
end;

procedure TQJson.MoveTo(ANewParent: TQJson; AIndex: Integer);
begin
  if ANewParent = Self then
    raise Exception.Create(SCantAttachToSelf)
  else
  begin
    if Parent = ANewParent then
      Exit;
    if IsParentOf(ANewParent) then
      raise Exception.Create(SCantMoveToChild);
    if ANewParent.DataType in [jdtArray, jdtObject] then
    begin
      if ANewParent.DataType = jdtObject then
      begin
        if Length(Name) = 0 then
          raise Exception.Create(SCantAttachNoNameNodeToObject)
        else if ANewParent.IndexOf(Name) <> -1 then
          raise Exception.CreateFmt(SNodeNameExists, [Name]);;
      end;
      if Assigned(FParent) then
        FParent.Remove(Self);
      FParent := ANewParent;
      if AIndex >= ANewParent.Count then
        ANewParent.FItems.Add(Self)
      else if AIndex <= 0 then
        ANewParent.FItems.Insert(0, Self)
      else
        ANewParent.FItems.Insert(AIndex, Self);
      DoJsonNameChanged(Self);
    end
    else
      raise Exception.Create(SCanAttachToNoneContainer);
  end;
end;

procedure TQJson.Parse(p: PWideChar; l: Integer);
  procedure ParseCopy;
  var
    S: QStringW;
  begin
    S := StrDupW(p, 0, l);
    p := PQCharW(S);
    ParseObject(p);
  end;

begin
  if DataType in [jdtObject, jdtArray] then
    Clear;
  if (l > 0) and (p[l] <> #0) then
    ParseCopy
  else
    ParseObject(p);
end;

procedure TQJson.Parse(const S: QStringW);
begin
  Parse(PQCharW(S), Length(S));
end;

procedure TQJson.ParseBlock(AStream: TStream; AEncoding: TTextEncoding);
var
  AMS: TMemoryStream;
  procedure ParseUCS2;
  var
    c: QCharW;
    ABlockCount: Integer;
  begin
    ABlockCount := 0;
    repeat
      if ABlockCount = 0 then
      begin
        repeat
          AStream.ReadBuffer(c, SizeOf(QCharW));
          AMS.WriteBuffer(c, SizeOf(QCharW));
        until c = '{';
        Inc(ABlockCount);
      end;
      AStream.ReadBuffer(c, SizeOf(QCharW));
      if c = '{' then
        Inc(ABlockCount)
      else if c = '}' then
        Dec(ABlockCount);
      AMS.WriteBuffer(c, SizeOf(QCharW));
    until ABlockCount = 0;
    c := #0;
    AMS.Write(c, SizeOf(QCharW));
    Parse(AMS.Memory, AMS.Size - 1);
  end;

  procedure ParseUCS2BE;
  var
    c: Word;
    ABlockCount: Integer;
    p: PQCharW;
  begin
    ABlockCount := 0;
    repeat
      if ABlockCount = 0 then
      begin
        repeat
          AStream.ReadBuffer(c, SizeOf(Word));
          c := (c shr 8) or ((c shl 8) and $FF00);
          AMS.WriteBuffer(c, SizeOf(Word));
        until c = $7B; // #$7B={
        Inc(ABlockCount);
      end;
      AStream.ReadBuffer(c, SizeOf(Word));
      c := (c shr 8) or ((c shl 8) and $FF00);
      if c = $7B then
        Inc(ABlockCount)
      else if c = $7D then // #$7D=}
        Dec(ABlockCount);
      AMS.WriteBuffer(c, SizeOf(QCharW));
    until ABlockCount = 0;
    c := 0;
    AMS.Write(c, SizeOf(QCharW));
    p := AMS.Memory;
    ParseObject(p);
  end;

  procedure ParseByByte;
  var
    c: Byte;
    ABlockCount: Integer;
  begin
    ABlockCount := 0;
    repeat
      if ABlockCount = 0 then
      begin
        repeat
          AStream.ReadBuffer(c, SizeOf(Byte));
          AMS.WriteBuffer(c, SizeOf(Byte));
        until c = $7B;
        // #$7B={
        Inc(ABlockCount);
      end;
      AStream.ReadBuffer(c, SizeOf(Byte));
      if c = $7B then
        Inc(ABlockCount)
      else if c = $7D then // #$7D=}
        Dec(ABlockCount);
      AMS.WriteBuffer(c, SizeOf(Byte));
    until ABlockCount = 0;
  end;

  procedure ParseUtf8;
  var
    S: QStringW;
    p: PQCharW;
  begin
    ParseByByte;
    S := qstring.Utf8Decode(AMS.Memory, AMS.Size);
    p := PQCharW(S);
    ParseObject(p);
  end;

  procedure ParseAnsi;
  var
    S: QStringW;
  begin
    ParseByByte;
    S := qstring.AnsiDecode(AMS.Memory, AMS.Size);
    Parse(PQCharW(S));
  end;

begin
  AMS := TMemoryStream.Create;
  try
    if AEncoding = teAnsi then
      ParseAnsi
    else if AEncoding = teUtf8 then
      ParseUtf8
    else if AEncoding = teUnicode16LE then
      ParseUCS2
    else if AEncoding = teUnicode16BE then
      ParseUCS2BE
    else
      raise Exception.Create(SBadJsonEncoding);
  finally
    AMS.Free;
  end;
end;

function TQJson.ParseJsonPair(ABuilder: TQStringCatHelperW;
  var p: PQCharW): Integer;
const
  SpaceWithSemicolon: PWideChar = ': '#9#10#13#$3000;
  CommaWithSpace: PWideChar = ', '#9#10#13#$3000;
  JsonEndChars: PWideChar = ',}]';
  JsonComplexEnd: PWideChar = '}]';
var
  AChild: TQJson;
  AObjEnd: QCharW;
  AComment: QStringW;
begin
  Result := SkipSpaceAndComment(p, AComment);
  if Result <> 0 then
    Exit;
  if Length(AComment) > 0 then
    FComment := AComment;
  // ����ֵ
  if (p^ = '{') or (p^ = '[') then // ����
  begin
    try
      if p^ = '{' then
      begin
        DataType := jdtObject;
        AObjEnd := '}';
      end
      else
      begin
        DataType := jdtArray;
        AObjEnd := ']';
      end;
      Inc(p);
      Result := SkipSpaceAndComment(p, AComment);
      while (p^ <> #0) and (p^ <> AObjEnd) do
      begin
        if (p^ <> AObjEnd) then
        begin
          AChild := Add;
          if Length(AComment) > 0 then
          begin
            AChild.FComment := AComment;
            SetLength(AComment, 0);
          end;
          Result := AChild.ParseJsonPair(ABuilder, p);
          if Result <> 0 then
            Exit;
          if p^ = ',' then
          begin
            Inc(p);
            Result := SkipSpaceAndComment(p, AComment);
            if Result <> 0 then
              Exit;
          end;
        end
        else
          Exit;
      end;
      Result := SkipSpaceAndComment(p, AComment);
      if Result <> 0 then
        Exit;
      if p^ <> AObjEnd then
      begin
        Result := EParse_BadJson;
        Exit;
      end
      else
      begin
        Inc(p);
        SkipSpaceAndComment(p, AComment);
      end;
    except
      Clear;
      raise;
    end;
  end
  else if Parent <> nil then
  begin
    if (Parent.DataType = jdtObject) and (Length(FName) = 0) then
    begin
      Result := ParseName(ABuilder, p);
      if Result <> 0 then
        Exit;
    end;
    Result := TryParseValue(ABuilder, p);
    if Result = 0 then
    begin
      SkipSpaceAndComment(p, AComment);
      if Length(AComment) > 0 then
        FComment := AComment;
      if not CharInW(p, JsonEndChars) then
      begin
        Result := EParse_EndCharNeeded;
      end;
    end;
  end
  else
    Result := EParse_BadJson;
end;

function TQJson.ParseJsonTime(p: PQCharW; var ATime: TDateTime): Boolean;
var
  MS, TimeZone: Int64;
begin
  // Javascript���ڸ�ʽΪ/DATE(��1970.1.1�����ڵĺ�����+ʱ��)/
  Result := False;
  if not StartWithW(p, '/DATE', False) then
    Exit;
  Inc(p, 5);
  SkipSpaceW(p);
  if p^ <> '(' then
    Exit;
  Inc(p);
  SkipSpaceW(p);
  if ParseInt(p, MS) = 0 then
    Exit;
  SkipSpaceW(p);
  if (p^ = '+') or (p^ = '-') then
  begin
    if ParseInt(p, TimeZone) = 0 then
      Exit;
    SkipSpaceW(p);
  end
  else
    TimeZone := 0;
  if p^ = ')' then
  begin
    ATime := (MS div 86400000) + ((MS mod 86400000) / 86400000.0);
    if TimeZone <> 0 then
      ATime := IncHour(ATime, -TimeZone);
    Inc(p);
    SkipSpaceW(p);
    Result := True
  end;
end;

function TQJson.ParseName(ABuilder: TQStringCatHelperW; var p: PQCharW)
  : Integer;
var
  AInQuoter: Boolean;
  AComment: QStringW;
begin
  if StrictJson and (p^ <> '"') then
  begin
    Result := EParse_BadNameStart;
    Exit;
  end;
  AInQuoter := (p^ = '"') or (p^ = '''');
  if not BuildJsonString(ABuilder, p) then
  begin
    Result := EParse_NameNotFound;
    Exit;
  end;
  SkipSpaceAndComment(p, AComment);
  if p^ <> ':' then
  begin
    Result := EParse_BadNameEnd;
    Exit;
  end;
  if not AInQuoter then
    ABuilder.TrimRight;
  FName := ABuilder.Value;

  // �����������
  Inc(p);
  SkipSpaceAndComment(p, AComment);
  Result := 0;
end;

procedure TQJson.ParseObject(var p: PQCharW);
var
  ABuilder: TQStringCatHelperW;
  ps: PQCharW;
  AErrorCode: Integer;
  AComment: QStringW;
begin
  ABuilder := TQStringCatHelperW.Create;
  try
    ps := p;
    try
      SkipSpaceAndComment(p, AComment);
      if Length(AComment) > 0 then
        FComment := AComment;
      AErrorCode := ParseJsonPair(ABuilder, p);
      if AErrorCode <> 0 then
        RaiseParseException(AErrorCode, ps, p);
    except
      on E: Exception do
      begin
        if E is EJsonError then
          raise
        else
          raise Exception.Create(Self.FormatParseError(EParse_Unknown,
            E.Message, ps, p));
      end;
    end;
  finally
    FreeObject(ABuilder);
    DoParsed;
  end;
end;

procedure TQJson.ParseValue(ABuilder: TQStringCatHelperW; var p: PQCharW);
var
  ps: PQCharW;
begin
  ps := p;
  RaiseParseException(TryParseValue(ABuilder, p), ps, p);
end;

procedure TQJson.RaiseParseException(ACode: Integer; ps, p: PQCharW);
begin
  if ACode <> 0 then
  begin
    case ACode of
      EParse_BadStringStart:
        raise EJsonError.Create(FormatParseError(ACode,
          SBadStringStart, ps, p));
      EParse_BadJson:
        raise EJsonError.Create(FormatParseError(ACode, SBadJson, ps, p));
      EParse_CommentNotSupport:
        raise EJsonError.Create(FormatParseError(ACode,
          SCommentNotSupport, ps, p));
      EParse_UnknownToken:
        raise EJsonError.Create(FormatParseError(ACode,
          SCommentNotSupport, ps, p));
      EParse_EndCharNeeded:
        raise EJsonError.Create(FormatParseError(ACode, SEndCharNeeded, ps, p));
      EParse_BadNameStart:
        raise EJsonError.Create(FormatParseError(ACode, SBadNameStart, ps, p));
      EParse_BadNameEnd:
        raise EJsonError.Create(FormatParseError(ACode, SBadNameEnd, ps, p));
      EParse_NameNotFound:
        raise EJsonError.Create(FormatParseError(ACode, SNameNotFound, ps, p))
    else
      raise EJsonError.Create(FormatParseError(ACode, SUnknownError, ps, p));
    end;
  end;
end;

function TQJson.Remove(AItemIndex: Integer): TQJson;
begin
  if FDataType in [jdtArray, jdtObject] then
  begin
    if (AItemIndex >= 0) and (AItemIndex < Count) then
    begin
      Result := Items[AItemIndex];
      FItems.Delete(AItemIndex);
      Result.FParent := nil;
    end
    else
      Result := nil;
  end
  else
    Result := nil;
end;

procedure TQJson.Remove(AJson: TQJson);
begin
  Remove(AJson.ItemIndex);
end;

procedure TQJson.Replace(AIndex: Integer; ANewItem: TQJson);
begin
  FreeObject(Items[AIndex]);
  FItems[AIndex] := ANewItem;
end;

procedure TQJson.ResetNull;
begin
  DataType := jdtNull;
end;

procedure TQJson.RevertOrder(ANest: Boolean);
var
  I, H, M: Integer;
begin
  H := Count - 1;
  if H > 0 then
  begin
    M := H shr 1;
    for I := 0 to M do
      FItems.Exchange(I, H - I);
    if ANest then
    begin
      for I := 0 to H do
        Items[I].RevertOrder(ANest);
    end;
  end;
end;

procedure TQJson.SaveToFile(AFileName: String; AEncoding: TTextEncoding;
  AWriteBOM, ADoFormat: Boolean);
var
  AStream: TMemoryStream;
begin
  AStream := TMemoryStream.Create;
  try
    SaveToStream(AStream, AEncoding, AWriteBOM, ADoFormat);
    AStream.SaveToFile(AFileName);
  finally
    FreeObject(AStream);
  end;
end;

procedure TQJson.SaveToStream(AStream: TStream; AEncoding: TTextEncoding;
  AWriteBOM, ADoFormat: Boolean);
var
  S: QStringW;
begin
  if DataType in [jdtArray, jdtObject] then
    S := Encode(ADoFormat)
  else
  begin
    if DataType in [jdtUnknown, jdtNull] then
    begin
      if Length(FName) = 0 then
        S := ''
      else
        S := '{"' + Escape(FName) + '":' + Value + '}';
    end
    else
    begin
      if Length(FName) > 0 then
        S := '{"' + Escape(FName) + '":' + Encode(True) + '}'
      else
        raise Exception.Create(SNameNotFound);
    end;
  end;
  if AEncoding = teUtf8 then
    SaveTextU(AStream, qstring.UTF8Encode(S), AWriteBOM)
  else if AEncoding = teAnsi then
    SaveTextA(AStream, qstring.AnsiEncode(S))
  else if AEncoding = teUnicode16LE then
    SaveTextW(AStream, S, AWriteBOM)
  else
    SaveTextWBE(AStream, S, AWriteBOM);
end;

procedure TQJson.SetAsArray(const Value: QStringW);
var
  p: PQCharW;
begin
  DataType := jdtArray;
  Clear;
  p := PQCharW(Value);
  ParseObject(p);
end;

procedure TQJson.SetAsBoolean(const Value: Boolean);
begin
  DataType := jdtBoolean;
  PBoolean(FValue)^ := Value;
end;

procedure TQJson.SetAsBytes(const Value: TBytes);
var
  S: QStringW;
begin
  if Assigned(OnQJsonEncodeBytes) then
    OnQJsonEncodeBytes(Value, S)
  else
    S := BinToHex(Value, False);
  AsString := S;
end;

procedure TQJson.SetAsDateTime(const Value: TDateTime);
begin
  DataType := jdtDateTime;
  PExtended(FValue)^ := Value;
end;

procedure TQJson.SetAsFloat(const Value: Extended);
begin
  if IsNan(Value) or IsInfinite(Value) then
    raise Exception.Create(SSupportFloat);
  DataType := jdtFloat;
  PExtended(FValue)^ := Value;
end;

procedure TQJson.SetAsInt64(const Value: Int64);
begin
  DataType := jdtInteger;
  PInt64(FValue)^ := Value;
end;

procedure TQJson.SetAsInteger(const Value: Integer);
begin
  SetAsInt64(Value);
end;

procedure TQJson.SetAsJson(const Value: QStringW);
var
  ABuilder: TQStringCatHelperW;
  p: PQCharW;
begin
  ABuilder := TQStringCatHelperW.Create;
  try
    try
      if DataType in [jdtArray, jdtObject] then
        Clear;
      p := PQCharW(Value);
      ParseValue(ABuilder, p);
    except
      AsString := Value;
    end;
  finally
    FreeObject(ABuilder);
  end;
end;

procedure TQJson.SetAsObject(const Value: QStringW);
begin
  Parse(PQCharW(Value), Length(Value));
end;

procedure TQJson.SetAsString(const Value: QStringW);
begin
  DataType := jdtString;
  FValue := Value;
end;

procedure TQJson.SetAsVariant(const Value: Variant);
var
  I: Integer;
  AType: TVarType;
  procedure CastFromCustomVarType;
  var
    ATypeInfo: TCustomVariantType;
    AData: TVarData;
  begin
    if FindCustomVariantType(AType, ATypeInfo) then
    begin
      VariantInit(AData);
      // �ȳ���ת����˫������ֵ��������У��͵��ַ�������
      try
        try
          ATypeInfo.CastTo(AData, FindVarData(Value)^, varDouble);
          AsFloat := AData.VDouble;
        except
          AsString := Value;
        end;
      finally
        VariantClear(AData);
      end;
    end
    else
      raise Exception.CreateFmt(SUnsupportVarType, [AType]);
  end;

begin
  if VarIsArray(Value) then
  begin
    ArrayNeeded(jdtArray);
    Clear;
    for I := VarArrayLowBound(Value, VarArrayDimCount(Value))
      to VarArrayHighBound(Value, VarArrayDimCount(Value)) do
      Add.AsVariant := Value[I];
  end
  else
  begin
    AType := VarType(Value);
    case AType of
      varEmpty, varNull, varUnknown:
        ResetNull;
      varSmallInt, varInteger, varByte, varShortInt, varWord,
        varLongWord, varInt64:
        AsInt64 := Value;
      varSingle, varDouble, varCurrency:
        AsFloat := Value;
      varDate:
        AsDateTime := Value;
      varOleStr, varString{$IFDEF UNICODE}, varUString{$ENDIF}:
        AsString := Value;
{$IF RtlVersion>=26}
      varUInt64:
        AsInt64 := Value;
      varRecord:
        FromRtti(PVarRecord(@Value).RecInfo, PVarRecord(@Value).PRecord);
{$IFEND >=XE5}
      varBoolean:
        AsBoolean := Value
    else
      CastFromCustomVarType;
    end;
  end;
end;

procedure TQJson.SetDataType(const Value: TQJsonDataType);
begin
  if FDataType <> Value then
  begin
    if DataType in [jdtArray, jdtObject] then
    begin
      Clear;
      if not(Value in [jdtArray, jdtObject]) then
      begin
        FreeObject(FItems);
      end;
    end;
    case Value of
      jdtNull, jdtUnknown, jdtString:
        SetLength(FValue, 0);
      jdtInteger:
        begin
          SetLength(FValue, SizeOf(Int64) shr 1);
          PInt64(FValue)^ := 0;
        end;
      jdtFloat, jdtDateTime:
        begin
          SetLength(FValue, SizeOf(Extended) shr 1);
          PExtended(FValue)^ := 0;
        end;
      jdtBoolean:
        begin
          SetLength(FValue, 1);
          PBoolean(FValue)^ := False;
        end;
      jdtArray, jdtObject:
        if not(FDataType in [jdtArray, jdtObject]) then
          ArrayNeeded(Value);
    end;
    FDataType := Value;
  end;
end;

procedure TQJson.SetIgnoreCase(const Value: Boolean);
  procedure InternalSetIgnoreCase(AParent: TQJson);
  var
    I: Integer;
  begin
    AParent.FIgnoreCase := Value;
    if AParent.FNameHash <> 0 then
      AParent.FNameHash := AParent.HashName(AParent.FName);
    if AParent.DataType in [jdtArray, jdtObject] then
    begin
      for I := 0 to AParent.Count - 1 do
        InternalSetIgnoreCase(AParent[I]);
    end;
  end;

begin
  if FIgnoreCase <> Value then
  begin
    InternalSetIgnoreCase(Root);
  end;
end;

procedure TQJson.SetName(const Value: QStringW);
begin
  if FName <> Value then
  begin
    if Assigned(FParent) then
    begin
      if FParent.IndexOf(Value) <> -1 then
        raise Exception.CreateFmt(SNodeNameExists, [Value]);
    end;
    FName := Value;
    DoJsonNameChanged(Self);
  end;
end;

procedure TQJson.SetValue(const Value: QStringW);
var
  p: PQCharW;
  procedure ParseNum;
  var
    ANum: Extended;
  begin
    if ParseNumeric(p, ANum) then
    begin
      if SameValue(ANum, Trunc(ANum), 5E-324) then
        AsInt64 := Trunc(ANum)
      else
        AsFloat := ANum;
    end
    else
      raise Exception.Create(Format(SBadNumeric, [Value]));
  end;
  procedure SetDateTime;
  var
    ATime: TDateTime;
  begin
    if ParseDateTime(PQCharW(Value), ATime) then
      AsDateTime := ATime
    else if ParseJsonTime(PQCharW(Value), ATime) then
      AsDateTime := ATime
    else
      raise Exception.Create(SBadJsonTime);
  end;
  procedure DetectValue;
  var
    ABuilder: TQStringCatHelperW;
    p: PQCharW;
  begin
    ABuilder := TQStringCatHelperW.Create;
    try
      p := PQCharW(Value);
      if TryParseValue(ABuilder, p) <> 0 then
        AsString := Value;
    finally
      FreeObject(ABuilder);
    end;
  end;

begin
  if DataType = jdtString then
    FValue := Value
  else if DataType = jdtBoolean then
    AsBoolean := StrToBool(Value)
  else
  begin
    p := PQCharW(Value);
    if DataType in [jdtInteger, jdtFloat] then
      ParseNum
    else if DataType = jdtDateTime then
      SetDateTime
    else if DataType in [jdtArray, jdtObject] then
    begin
      Clear;
      ParseObject(p);
    end
    else // jdtUnknown
      DetectValue;
  end;
end;

class function TQJson.SkipSpaceAndComment(var p: PQCharW;
  var AComment: QStringW): Integer;
var
  ps: PQCharW;
begin
  SkipSpaceW(p);
  Result := 0;
  SetLength(AComment, 0);
  if not StrictJson then
  begin
    while p^ = '/' do
    begin
      if StrictJson then
      begin
        Result := EParse_CommentNotSupport;
        Exit;
      end;
      if p[1] = '/' then
      begin
        Inc(p, 2);
        AComment := DecodeLineW(p) + SLineBreak;
        SkipSpaceW(p);
      end
      else if p[1] = '*' then
      begin
        Inc(p, 2);
        ps := p;
        while p^ <> #0 do
        begin
          if (p[0] = '*') and (p[1] = '/') then
          begin
            AComment := AComment + StrDupX(ps, (IntPtr(p) - IntPtr(ps)) shr 1) +
              SLineBreak;
            Inc(p, 2);
            SkipSpaceW(p);
            Break;
          end
          else
            Inc(p);
        end;
      end
      else
      begin
        Result := EParse_UnknownToken;
        Exit;
      end;
    end;
  end;
  if Length(AComment) > 0 then
    SetLength(AComment, Length(AComment) - Length(SLineBreak));
end;

procedure TQJson.Sort(AByName, ANest: Boolean; AByType: TQJsonDataType;
  AOnCompare: TListSortCompare);
  procedure QuickSort(l, R: Integer; AOnCompare: TListSortCompare);
  var
    I, J, p: Integer;
  begin
    repeat
      I := l;
      J := R;
      p := (l + R) shr 1;
      repeat
        while AOnCompare(Items[I], Items[p]) < 0 do
          Inc(I);
        while AOnCompare(Items[J], Items[p]) > 0 do
          Dec(J);
        if I <= J then
        begin
          if I <> J then
            FItems.Exchange(I, J);
          if p = I then
            p := J
          else if p = J then
            p := I;
          Inc(I);
          Dec(J);
        end;
      until I > J;
      if l < J then
        QuickSort(l, J, AOnCompare);
      l := I;
    until I >= R;
  end;
  function DetectCompareType: TQJsonDataType;
  var
    I, c: Integer;
  begin
    c := Count;
    if c > 0 then
    begin
      Result := Items[0].DataType;
      Dec(c);
      for I := 1 to c do
      begin
        case Items[I].DataType of
          jdtNull:
            ;
          jdtString:
            begin
              Result := jdtString;
              Break;
            end;
          jdtInteger:
            begin
              if Result in [jdtNull, jdtBoolean] then
                Result := jdtInteger;
            end;
          jdtFloat:
            begin
              if Result in [jdtNull, jdtBoolean, jdtInteger, jdtDateTime] then
                Result := jdtFloat;
            end;
          jdtBoolean:
            begin
              if Result = jdtNull then
                Result := jdtBoolean;
            end;
          jdtDateTime:
            begin
              if Result in [jdtNull, jdtBoolean, jdtInteger] then
                Result := jdtDateTime;
            end;
        end;
      end;
    end
    else
      Result := jdtUnknown;
  end;
  procedure DoSort(ADataType: TQJsonDataType);
  begin
    case ADataType of
      jdtString:
        QuickSort(0, Count - 1, DoCompareValueString);
      jdtInteger:
        QuickSort(0, Count - 1, DoCompareValueInt);
      jdtFloat:
        QuickSort(0, Count - 1, DoCompareValueFloat);
      jdtBoolean:
        QuickSort(0, Count - 1, DoCompareValueBoolean);
      jdtDateTime:
        QuickSort(0, Count - 1, DoCompareValueDateTime)
    else
      Exit;
    end;
  end;
  procedure SortChildrens;
  var
    I, H: Integer;
    AItem: TQJson;
  begin
    H := Count - 1;
    for I := 0 to H do
    begin
      AItem := Items[I];
      if AItem.IsObject then
        AItem.Sort(AByName, ANest, AByType, AOnCompare)
      else if (AItem.IsArray) and (not AByName) then
        AItem.Sort(AByName, ANest, AByType, AOnCompare);
    end;
  end;

begin
  if not Assigned(AOnCompare) then
  begin
    if AByName then
      QuickSort(0, Count - 1, DoCompareName)
    else if AByType = jdtUnknown then
      DoSort(DetectCompareType)
    else
      DoSort(AByType);
  end
  else
    QuickSort(0, Count - 1, AOnCompare);
  if ANest then
    SortChildrens;
end;

procedure TQJson.StreamFromValue(AStream: TStream);
var
  ABytes: TBytes;
begin
  ABytes := AsBytes;
  AStream.WriteBuffer(ABytes[0], Length(ABytes));
end;

{$IF RTLVersion>=21}

function TQJson.Invoke(AInstance: TValue): TValue;
var
  AMethods: TArray<TRttiMethod>;
  AParams: TArray<TRttiParameter>;
  AMethod: TRttiMethod;
  AType: TRttiType;
  AContext: TRttiContext;
  AParamValues: array of TValue;
  I, c: Integer;
  AParamItem: TQJson;
begin
  AContext := TRttiContext.Create;
  Result := TValue.Empty;
  if AInstance.IsObject then
    AType := AContext.GetType(AInstance.AsObject.ClassInfo)
  else if AInstance.IsClass then
    AType := AContext.GetType(AInstance.AsClass)
  else if AInstance.Kind = tkRecord then
    AType := AContext.GetType(AInstance.TypeInfo)
  else
    AType := AContext.GetType(AInstance.TypeInfo);
  AMethods := AType.GetMethods(Name);
  c := Count;
  for AMethod in AMethods do
  begin
    AParams := AMethod.GetParameters;
    if Length(AParams) = c then
    begin
      SetLength(AParamValues, c);
      for I := 0 to c - 1 do
      begin
        AParamItem := ItemByName(AParams[I].Name);
        if AParamItem <> nil then
          AParamValues[I] := AParamItem.ToRttiValue
        else
          raise Exception.CreateFmt(SParamMissed, [AParams[I].Name]);
      end;
      Result := AMethod.Invoke(AInstance, AParamValues);
      Exit;
    end;
  end;
  raise Exception.CreateFmt(SMethodMissed, [Name]);
end;

procedure TQJson.ToRecord<T>(var ARecord: T);
begin
  ToRtti(@ARecord, TypeInfo(T));
end;

procedure TQJson.ToRtti(AInstance: TValue);
begin
  if AInstance.IsEmpty then
    Exit;
  if AInstance.Kind = tkRecord then
    ToRtti(AInstance.GetReferenceToRawData, AInstance.TypeInfo)
  else if AInstance.Kind = tkClass then
    ToRtti(AInstance.AsObject, AInstance.TypeInfo)
end;

procedure TQJson.ToRtti(ADest: Pointer; AType: PTypeInfo);

  procedure LoadCollection(AJson: TQJson; ACollection: TCollection);
  var
    I: Integer;
  begin
    for I := 0 to AJson.Count - 1 do
      AJson[I].ToRtti(ACollection.Add);
  end;
  procedure ToRecord;
  var
    AContext: TRttiContext;
    AFields: TArray<TRttiField>;
    ARttiType: TRttiType;
    ABaseAddr: Pointer;
    J: Integer;
    AChild: TQJson;
    AObj: TObject;
  begin
    AContext := TRttiContext.Create;
    ARttiType := AContext.GetType(AType);
    ABaseAddr := ADest;
    AFields := ARttiType.GetFields;
    for J := Low(AFields) to High(AFields) do
    begin
      if AFields[J].FieldType <> nil then
      begin
        AChild := ItemByName(AFields[J].Name);
        if AChild <> nil then
        begin
          case AFields[J].FieldType.TypeKind of
            tkInteger:
              AFields[J].SetValue(ABaseAddr, AChild.AsInteger);
{$IFNDEF NEXTGEN}
            tkString:
              PShortString(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                ShortString(AChild.AsString);
{$ENDIF !NEXTGEN}
            tkUString{$IFNDEF NEXTGEN}, tkLString, tkWString{$ENDIF !NEXTGEN}:
              AFields[J].SetValue(ABaseAddr, AChild.AsString);
            tkEnumeration:
              begin
                if GetTypeData(AFields[J].FieldType.Handle)
                  ^.BaseType^ = TypeInfo(Boolean) then
                  AFields[J].SetValue(ABaseAddr, AChild.AsBoolean)
                else
                begin
                  case GetTypeData(AFields[J].FieldType.Handle).OrdType of
                    otSByte:
                      begin
                        if AChild.DataType = jdtInteger then
                          PShortint(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            AChild.AsInteger
                        else
                          PShortint(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            GetEnumValue(AFields[J].FieldType.Handle,
                            AChild.AsString);
                      end;
                    otUByte:
                      begin
                        if AChild.DataType = jdtInteger then
                          PByte(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            AChild.AsInteger
                        else
                          PByte(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            GetEnumValue(AFields[J].FieldType.Handle,
                            AChild.AsString);
                      end;
                    otSWord:
                      begin
                        if AChild.DataType = jdtInteger then
                          PSmallint(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            AChild.AsInteger
                        else
                          PSmallint(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            GetEnumValue(AFields[J].FieldType.Handle,
                            AChild.AsString);
                      end;
                    otUWord:
                      begin
                        if AChild.DataType = jdtInteger then
                          PWord(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            AChild.AsInteger
                        else
                          PWord(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            GetEnumValue(AFields[J].FieldType.Handle,
                            AChild.AsString);
                      end;
                    otSLong:
                      begin
                        if AChild.DataType = jdtInteger then
                          PInteger(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            AChild.AsInteger
                        else
                          PInteger(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            GetEnumValue(AFields[J].FieldType.Handle,
                            AChild.AsString);
                      end;
                    otULong:
                      begin
                        if AChild.DataType = jdtInteger then
                          PCardinal(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            AChild.AsInteger
                        else
                          PCardinal(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                            GetEnumValue(AFields[J].FieldType.Handle,
                            AChild.AsString);
                      end;
                  end;
                end;
              end;
            tkSet:
              begin
                case GetTypeData(AFields[J].FieldType.Handle).OrdType of
                  otSByte:
                    begin
                      if AChild.DataType = jdtInteger then
                        PShortint(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          AChild.AsInteger
                      else
                        PShortint(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          StringToSet(AFields[J].FieldType.Handle,
                          AChild.AsString);
                    end;
                  otUByte:
                    begin
                      if AChild.DataType = jdtInteger then
                        PByte(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          AChild.AsInteger
                      else
                        PByte(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          StringToSet(AFields[J].FieldType.Handle,
                          AChild.AsString);
                    end;
                  otSWord:
                    begin
                      if AChild.DataType = jdtInteger then
                        PSmallint(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          AChild.AsInteger
                      else
                        PSmallint(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          StringToSet(AFields[J].FieldType.Handle,
                          AChild.AsString);
                    end;
                  otUWord:
                    begin
                      if AChild.DataType = jdtInteger then
                        PWord(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          AChild.AsInteger
                      else
                        PWord(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          StringToSet(AFields[J].FieldType.Handle,
                          AChild.AsString);
                    end;
                  otSLong:
                    begin
                      if AChild.DataType = jdtInteger then
                        PInteger(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          AChild.AsInteger
                      else
                        PInteger(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          StringToSet(AFields[J].FieldType.Handle,
                          AChild.AsString);
                    end;
                  otULong:
                    begin
                      if AChild.DataType = jdtInteger then
                        PCardinal(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          AChild.AsInteger
                      else
                        PCardinal(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                          StringToSet(AFields[J].FieldType.Handle,
                          AChild.AsString);
                    end;
                end;
              end;
            tkChar, tkWChar:
              AFields[J].SetValue(ABaseAddr, AChild.AsString);
            tkFloat:
              if (AFields[J].FieldType.Handle = TypeInfo(TDateTime)) or
                (AFields[J].FieldType.Handle = TypeInfo(TTime)) or
                (AFields[J].FieldType.Handle = TypeInfo(TDate)) then
              begin
                if AChild.IsDateTime then
                  AFields[J].SetValue(ABaseAddr, AChild.AsDateTime)
                else if AChild.DataType in [jdtNull, jdtUnknown] then
                  AFields[J].SetValue(ABaseAddr, 0)
                else
                  raise Exception.CreateFmt(SBadConvert,
                    [AChild.AsString, JsonTypeName[AChild.DataType]]);
              end
              else
                AFields[J].SetValue(ABaseAddr, AChild.AsFloat);
            tkInt64:
              AFields[J].SetValue(ABaseAddr, AChild.AsInt64);
            tkVariant:
              PVariant(IntPtr(ABaseAddr) + AFields[J].Offset)^ :=
                AChild.AsVariant;
            tkArray, tkDynArray:
              AChild.ToRtti(Pointer(IntPtr(ABaseAddr) + AFields[J].Offset),
                AFields[J].FieldType.Handle);
            tkClass:
              begin
                AObj := AFields[J].GetValue(ABaseAddr).AsObject;
                if AObj is TStrings then
                  (AObj as TStrings).Text := AChild.AsString
                else if AObj is TCollection then
                  LoadCollection(AChild, AObj as TCollection)
                else
                  AChild.ToRtti(AObj);
              end;
            tkRecord:
              AChild.ToRtti(Pointer(IntPtr(ABaseAddr) + AFields[J].Offset),
                AFields[J].FieldType.Handle);
          end;
        end;
      end;
    end;
  end;

  procedure ToObject;
  var
    AProp: PPropInfo;
    ACount: Integer;
    J: Integer;
    AObj, AChildObj: TObject;
    AChild: TQJson;
  begin
    AObj := ADest;
    ACount := Count;
    if AObj is TStrings then
      (AObj as TStrings).Text := AsString
    else if AObj is TCollection then
      LoadCollection(Self, AObj as TCollection)
    else
    begin
      for J := 0 to ACount - 1 do
      begin
        AChild := Items[J];
        AProp := GetPropInfo(AObj, AChild.Name);
        if AProp <> nil then
        begin
          case AProp.PropType^.Kind of
            tkClass:
              begin
                AChildObj := Pointer(GetOrdProp(AObj, AProp));
                if AChildObj is TStrings then
                  (AChildObj as TStrings).Text := AChild.AsString
                else if AChildObj is TCollection then
                  LoadCollection(AChild, AChildObj as TCollection)
                else
                  AChild.ToRtti(AChildObj);
              end;
            tkRecord, tkArray, tkDynArray:
              // tkArray,tkDynArray���͵�����û����,tkRecord����
              begin
                AChild.ToRtti(Pointer(GetOrdProp(AObj, AProp)),
                  AProp.PropType^);
              end;
            tkInteger:
              SetOrdProp(AObj, AProp, AChild.AsInteger);
            tkFloat:
              begin
                if (AProp.PropType^ = TypeInfo(TDateTime)) or
                  (AProp.PropType^ = TypeInfo(TTime)) or
                  (AProp.PropType^ = TypeInfo(TDate)) then
                  SetFloatProp(AObj, AProp, AChild.AsDateTime)
                else
                  SetFloatProp(AObj, AProp, AChild.AsFloat);
              end;
            tkChar, tkString, tkWChar, tkLString, tkWString, tkUString:
              SetStrProp(AObj, AProp, AChild.AsString);
            tkEnumeration:
              begin
                if GetTypeData(AProp.PropType^)^.BaseType^ = TypeInfo(Boolean)
                then
                  SetOrdProp(AObj, AProp, Integer(AChild.AsBoolean))
                else if AChild.DataType = jdtInteger then
                  SetOrdProp(AObj, AProp, AChild.AsInteger)
                else
                  SetEnumProp(AObj, AProp, AChild.AsString);
              end;
            tkSet:
              begin
                if AChild.DataType = jdtInteger then
                  SetOrdProp(AObj, AProp, AChild.AsInteger)
                else
                  SetSetProp(AObj, AProp, AChild.AsString);
              end;
            tkVariant:
              SetVariantProp(AObj, AProp, AChild.AsVariant);
            tkInt64:
              SetInt64Prop(AObj, AProp, AChild.AsInt64);
          end;
        end;
      end;
    end;
  end;

  procedure SetDynArrayLen(arr: Pointer; AType: PTypeInfo; ALen: NativeInt);
  var
    pmem: Pointer;
  begin
    pmem := PPointer(arr)^;
    DynArraySetLength(pmem, AType, 1, @ALen);
    PPointer(arr)^ := pmem;
  end;

  procedure ToArray;
  var
    AContext: TRttiContext;
    ASubType: TRttiType;
    I, l, AOffset: Integer;
    S: QStringW;
    pd, pi: PByte;
    AChildObj: TObject;
    ASubTypeInfo: PTypeInfo;
    AChild: TQJson;
  begin
    AContext := TRttiContext.Create;
{$IF RTLVersion>25}
    S := ArrayItemTypeName(AType.NameFld.ToString);
{$ELSE}
    S := ArrayItemTypeName(String(AType.Name));
{$IFEND}
    if Length(S) > 0 then
      ASubType := AContext.FindType(S)
    else
      ASubType := nil;
    if ASubType <> nil then
    begin
      ASubTypeInfo := ASubType.Handle;
      l := Count;
      SetDynArrayLen(ADest, AType, l);
      pd := PPointer(ADest)^;
      for I := 0 to l - 1 do
      begin
        AOffset := I * GetTypeData(AType).elSize;
        pi := Pointer(IntPtr(pd) + AOffset);
        AChild := Items[I];
        case ASubType.TypeKind of
          tkInteger:
            begin
              case GetTypeData(ASubTypeInfo).OrdType of
                otSByte:
                  PShortint(pi)^ := AChild.AsInteger;
                otUByte:
                  pi^ := Items[I].AsInteger;
                otSWord:
                  PSmallint(pi)^ := AChild.AsInteger;
                otUWord:
                  PWord(pi)^ := AChild.AsInteger;
                otSLong:
                  PInteger(pi)^ := AChild.AsInteger;
                otULong:
                  PCardinal(pi)^ := AChild.AsInteger;
              end;
            end;
{$IFNDEF NEXTGEN}
          tkChar:
            pi^ := Ord(PAnsiChar(AnsiString(AChild.AsString))[0]);
{$ENDIF !NEXTGEN}
          tkEnumeration:
            begin
              if GetTypeData(ASubTypeInfo)^.BaseType^ = TypeInfo(Boolean) then
                PBoolean(pi)^ := AChild.AsBoolean
              else
              begin
                case GetTypeData(ASubTypeInfo)^.OrdType of
                  otSByte:
                    begin
                      if AChild.DataType = jdtInteger then
                        PShortint(pi)^ := AChild.AsInteger
                      else
                        PShortint(pi)^ := GetEnumValue(ASubTypeInfo,
                          AChild.AsString);
                    end;
                  otUByte:
                    begin
                      if AChild.DataType = jdtInteger then
                        pi^ := AChild.AsInteger
                      else
                        pi^ := GetEnumValue(ASubTypeInfo, AChild.AsString);
                    end;
                  otSWord:
                    begin
                      if AChild.DataType = jdtInteger then
                        PSmallint(pi)^ := AChild.AsInteger
                      else
                        PSmallint(pi)^ := GetEnumValue(ASubTypeInfo,
                          AChild.AsString);
                    end;
                  otUWord:
                    begin
                      if AChild.DataType = jdtInteger then
                        PWord(pi)^ := AChild.AsInteger
                      else
                        PWord(pi)^ := GetEnumValue(ASubTypeInfo,
                          AChild.AsString);
                    end;
                  otSLong:
                    begin
                      if AChild.DataType = jdtInteger then
                        PInteger(pi)^ := AChild.AsInteger
                      else
                        PInteger(pi)^ := GetEnumValue(ASubTypeInfo,
                          AChild.AsString);
                    end;
                  otULong:
                    begin
                      if AChild.DataType = jdtInteger then
                        PCardinal(pi)^ := AChild.AsInteger
                      else
                        PCardinal(pi)^ := GetEnumValue(ASubTypeInfo,
                          Items[I].AsString);
                    end;
                end;
              end;
            end;
          tkFloat:
            case GetTypeData(ASubTypeInfo)^.FloatType of
              ftSingle:
                PSingle(pi)^ := Items[I].AsFloat;
              ftDouble:
                PDouble(pi)^ := Items[I].AsFloat;
              ftExtended:
                PExtended(pi)^ := Items[I].AsFloat;
              ftComp:
                PComp(pi)^ := Items[I].AsFloat;
              ftCurr:
                PCurrency(pi)^ := Items[I].AsFloat;
            end;
{$IFNDEF NEXTGEN}
          tkString:
            PShortString(pi)^ := ShortString(Items[I].AsString);
{$ENDIF !NEXTGEN}
          tkSet:
            begin
              case GetTypeData(ASubTypeInfo)^.OrdType of
                otSByte:
                  begin
                    if AChild.DataType = jdtInteger then
                      PShortint(pi)^ := AChild.AsInteger
                    else
                      PShortint(pi)^ := StringToSet(ASubTypeInfo,
                        AChild.AsString);
                  end;
                otUByte:
                  begin
                    if AChild.DataType = jdtInteger then
                      pi^ := AChild.AsInteger
                    else
                      pi^ := StringToSet(ASubTypeInfo, AChild.AsString);
                  end;
                otSWord:
                  begin
                    if AChild.DataType = jdtInteger then
                      PSmallint(pi)^ := AChild.AsInteger
                    else
                      PSmallint(pi)^ := StringToSet(ASubTypeInfo,
                        AChild.AsString);
                  end;
                otUWord:
                  begin
                    if AChild.DataType = jdtInteger then
                      PWord(pi)^ := AChild.AsInteger
                    else
                      PWord(pi)^ := StringToSet(ASubTypeInfo, AChild.AsString);
                  end;
                otSLong:
                  begin
                    if AChild.DataType = jdtInteger then
                      PInteger(pi)^ := AChild.AsInteger
                    else
                      PInteger(pi)^ := StringToSet(ASubTypeInfo,
                        AChild.AsString);
                  end;
                otULong:
                  begin
                    if AChild.DataType = jdtInteger then
                      PCardinal(pi)^ := AChild.AsInteger
                    else
                      PCardinal(pi)^ := StringToSet(ASubTypeInfo,
                        Items[I].AsString);
                  end;
              end;
            end;
          tkClass:
            begin
              if PPointer(pi)^ <> nil then
              begin
                AChildObj := PPointer(pi)^;
                if AChildObj is TStrings then
                  (AChildObj as TStrings).Text := Items[I].AsString
                else if AChildObj is TCollection then
                  LoadCollection(Items[I], AChildObj as TCollection)
                else
                  Items[I].ToRtti(AChildObj);
              end;
            end;
          tkWChar:
            PWideChar(pi)^ := PWideChar(Items[I].AsString)[0];
{$IFNDEF NEXTGEN}
          tkLString:
            PAnsiString(pi)^ := AnsiString(Items[I].AsString);
          tkWString:
            PWideString(pi)^ := Items[I].AsString;
{$ENDIF}
          tkVariant:
            PVariant(pi)^ := Items[I].AsVariant;
          tkArray, tkDynArray:
            Items[I].ToRtti(pi, ASubTypeInfo);
          tkRecord:
            Items[I].ToRtti(pi, ASubTypeInfo);
          tkInt64:
            PInt64(pi)^ := Items[I].AsInt64;
          tkUString:
            PUnicodeString(pi)^ := Items[I].AsString;
        end;
      end;
    end
    else
      raise Exception.CreateFmt(SMissRttiTypeDefine, [AType.Name]);
  end;
  function GetFixedArrayItemType: PTypeInfo;
  var
    pType: PPTypeInfo;
  begin
    pType := GetTypeData(AType)^.ArrayData.elType;
    if pType = nil then
      Result := nil
    else
      Result := pType^;
  end;
  procedure ToFixedArray;
  var
    I, c, ASize: Integer;
    ASubType: PTypeInfo;
    AChild: TQJson;
    AChildObj: TObject;
    pi: Pointer;
  begin
    c := GetTypeData(AType).ArrayData.ElCount;
    ASubType := GetFixedArrayItemType;
    if ASubType = nil then
      Exit;
    ASize := GetTypeData(ASubType).elSize;
    for I := 0 to c - 1 do
    begin
      pi := Pointer(IntPtr(ADest) + ASize * I);
      AChild := Items[I];
      case ASubType.Kind of
        tkInteger:
          begin
            case GetTypeData(ASubType).OrdType of
              otSByte:
                PShortint(pi)^ := AChild.AsInteger;
              otUByte:
                PByte(pi)^ := AChild.AsInteger;
              otSWord:
                PSmallint(pi)^ := AChild.AsInteger;
              otUWord:
                PWord(pi)^ := AChild.AsInteger;
              otSLong:
                PInteger(pi)^ := AChild.AsInteger;
              otULong:
                PCardinal(pi)^ := AChild.AsInteger;
            end;
          end;
{$IFNDEF NEXTGEN}
        tkChar:
          PByte(pi)^ := Ord(PAnsiChar(AnsiString(AChild.AsString))[0]);
{$ENDIF !NEXTGEN}
        tkEnumeration:
          begin
            if GetTypeData(ASubType)^.BaseType^ = TypeInfo(Boolean) then
              PBoolean(pi)^ := AChild.AsBoolean
            else
            begin
              case GetTypeData(ASubType)^.OrdType of
                otSByte:
                  begin
                    if AChild.DataType = jdtInteger then
                      PShortint(pi)^ := AChild.AsInteger
                    else
                      PShortint(pi)^ := GetEnumValue(ASubType, AChild.AsString);
                  end;
                otUByte:
                  begin
                    if AChild.DataType = jdtInteger then
                      PByte(pi)^ := AChild.AsInteger
                    else
                      PByte(pi)^ := GetEnumValue(ASubType, AChild.AsString);
                  end;
                otSWord:
                  begin
                    if AChild.DataType = jdtInteger then
                      PSmallint(pi)^ := AChild.AsInteger
                    else
                      PSmallint(pi)^ := GetEnumValue(ASubType, AChild.AsString);
                  end;
                otUWord:
                  begin
                    if AChild.DataType = jdtInteger then
                      PWord(pi)^ := AChild.AsInteger
                    else
                      PWord(pi)^ := GetEnumValue(ASubType, AChild.AsString);
                  end;
                otSLong:
                  begin
                    if AChild.DataType = jdtInteger then
                      PInteger(pi)^ := AChild.AsInteger
                    else
                      PInteger(pi)^ := GetEnumValue(ASubType, AChild.AsString);
                  end;
                otULong:
                  begin
                    if AChild.DataType = jdtInteger then
                      PCardinal(pi)^ := AChild.AsInteger
                    else
                      PCardinal(pi)^ :=
                        GetEnumValue(ASubType, Items[I].AsString);
                  end;
              end;
            end;
          end;
        tkFloat:
          case GetTypeData(ASubType)^.FloatType of
            ftSingle:
              PSingle(pi)^ := Items[I].AsFloat;
            ftDouble:
              PDouble(pi)^ := Items[I].AsFloat;
            ftExtended:
              PExtended(pi)^ := Items[I].AsFloat;
            ftComp:
              PComp(pi)^ := Items[I].AsFloat;
            ftCurr:
              PCurrency(pi)^ := Items[I].AsFloat;
          end;
{$IFNDEF NEXTGEN}
        tkString:
          PShortString(pi)^ := ShortString(Items[I].AsString);
{$ENDIF !NEXTGEN}
        tkSet:
          begin
            case GetTypeData(ASubType)^.OrdType of
              otSByte:
                begin
                  if AChild.DataType = jdtInteger then
                    PShortint(pi)^ := AChild.AsInteger
                  else
                    PShortint(pi)^ := StringToSet(ASubType, AChild.AsString);
                end;
              otUByte:
                begin
                  if AChild.DataType = jdtInteger then
                    PByte(pi)^ := AChild.AsInteger
                  else
                    PByte(pi)^ := StringToSet(ASubType, AChild.AsString);
                end;
              otSWord:
                begin
                  if AChild.DataType = jdtInteger then
                    PSmallint(pi)^ := AChild.AsInteger
                  else
                    PSmallint(pi)^ := StringToSet(ASubType, AChild.AsString);
                end;
              otUWord:
                begin
                  if AChild.DataType = jdtInteger then
                    PWord(pi)^ := AChild.AsInteger
                  else
                    PWord(pi)^ := StringToSet(ASubType, AChild.AsString);
                end;
              otSLong:
                begin
                  if AChild.DataType = jdtInteger then
                    PInteger(pi)^ := AChild.AsInteger
                  else
                    PInteger(pi)^ := StringToSet(ASubType, AChild.AsString);
                end;
              otULong:
                begin
                  if AChild.DataType = jdtInteger then
                    PCardinal(pi)^ := AChild.AsInteger
                  else
                    PCardinal(pi)^ := StringToSet(ASubType, Items[I].AsString);
                end;
            end;
          end;
        tkClass:
          begin
            if PPointer(pi)^ <> nil then
            begin
              AChildObj := PPointer(pi)^;
              if AChildObj is TStrings then
                (AChildObj as TStrings).Text := Items[I].AsString
              else if AChildObj is TCollection then
                LoadCollection(Items[I], AChildObj as TCollection)
              else
                Items[I].ToRtti(AChildObj);
            end;
          end;
        tkWChar:
          PWideChar(pi)^ := PWideChar(Items[I].AsString)[0];
{$IFNDEF NEXTGEN}
        tkLString:
          PAnsiString(pi)^ := AnsiString(Items[I].AsString);
        tkWString:
          PWideString(pi)^ := Items[I].AsString;
{$ENDIF}
        tkVariant:
          PVariant(pi)^ := Items[I].AsVariant;
        tkArray, tkDynArray:
          Items[I].ToRtti(pi, ASubType);
        tkRecord:
          Items[I].ToRtti(pi, ASubType);
        tkInt64:
          PInt64(pi)^ := Items[I].AsInt64;
        tkUString:
          PUnicodeString(pi)^ := Items[I].AsString;
      end;
    end;
  end;

begin
  if ADest <> nil then
  begin
    if AType.Kind = tkRecord then
      ToRecord
    else if AType.Kind = tkClass then
      ToObject
    else if AType.Kind = tkDynArray then
      ToArray
    else if AType.Kind = tkArray then
      ToFixedArray
    else
      raise Exception.Create(SUnsupportPropertyType);
  end;
end;

function TQJson.ToRttiValue: TValue;
  procedure AsDynValueArray;
  var
    AValues: array of TValue;
    I: Integer;
  begin
    SetLength(AValues, Count);
    for I := 0 to Count - 1 do
      AValues[I] := Items[I].ToRttiValue;
    Result := TValue.FromArray(TypeInfo(TValueArray), AValues);
  end;

begin
  case DataType of
    jdtString:
      Result := AsString;
    jdtInteger:
      Result := AsInt64;
    jdtFloat:
      Result := AsFloat;
    jdtDateTime:
      Result := AsDateTime;
    jdtBoolean:
      Result := AsBoolean;
    jdtArray, jdtObject:
      // ����Ͷ���ֻ�ܵ�������������
      AsDynValueArray
  else
    Result := TValue.Empty;
  end;
end;
{$IFEND >=2010}

function TQJson.ToString: string;
begin
  Result := AsString;
end;

function TQJson.TryParse(p: PWideChar; l: Integer): Boolean;

  procedure DoTry;
  var
    ABuilder: TQStringCatHelperW;
  begin
    ABuilder := TQStringCatHelperW.Create;
    try
      try
        SkipSpaceW(p);
        Result := ParseJsonPair(ABuilder, p) = 0;
      except
        on E: Exception do
          Result := False;
      end;
    finally
      FreeObject(ABuilder);
    end;
  end;

  procedure ParseCopy;
  var
    S: QStringW;
  begin
    S := StrDupW(p, 0, l);
    p := PQCharW(S);
    DoTry;
  end;

begin
  if DataType in [jdtObject, jdtArray] then
    Clear;
  if (l > 0) and (p[l] <> #0) then
    ParseCopy
  else
    DoTry;
end;

function TQJson.TryParse(const S: QStringW): Boolean;
begin
  Result := TryParse(PQCharW(S), Length(S));
end;

function TQJson.TryParseValue(ABuilder: TQStringCatHelperW;
  var p: PQCharW): Integer;
var
  ANum: Extended;
  AComment: QStringW;
const
  JsonEndChars: PWideChar = ',]}';
begin
  Result := 0;
  if p^ = '"' then
  begin
    BuildJsonString(ABuilder, p);
    AsString := ABuilder.Value;
  end
  else if p^ = '''' then
  begin
    if StrictJson then
      Result := EParse_BadStringStart;
    BuildJsonString(ABuilder, p);
    AsString := ABuilder.Value;
  end
  else if ParseNumeric(p, ANum) then // ���֣�
  begin
    SkipSpaceAndComment(p, AComment);
    if Length(AComment) > 0 then
      FComment := AComment;
    if (p^ = #0) or CharInW(p, JsonEndChars) then
    begin
      if SameValue(ANum, Trunc(ANum), 5E-324) then
        AsInt64 := Trunc(ANum)
      else
        AsFloat := ANum;
    end
    else
      Result := EParse_BadJson;
  end
  else if StartWithW(p, 'False', True) then // False
  begin
    Inc(p, 5);
    SkipSpaceAndComment(p, AComment);
    AsBoolean := False
  end
  else if StartWithW(p, 'True', True) then
  // True
  begin
    Inc(p, 4);
    SkipSpaceAndComment(p, AComment);
    AsBoolean := True;
  end
  else if StartWithW(p, 'NULL', True) then
  // Null
  begin
    Inc(p, 4);
    SkipSpaceAndComment(p, AComment);
    ResetNull;
  end
  else if (p^ = '[') or (p^ = '{') then
    Result := ParseJsonPair(ABuilder, p)
  else
    Result := 2;
end;

procedure TQJson.ValidArray;
begin
  if DataType in [jdtArray, jdtObject] then
    FItems := TQJsonItemList.Create
  else
    raise Exception.Create(Format(SVarNotArray, [FName]));
end;

function TQJson.ValueByName(AName, ADefVal: QStringW): QStringW;
var
  AChild: TQJson;
begin
  AChild := ItemByName(AName);
  if Assigned(AChild) then
    Result := AChild.Value
  else
    Result := ADefVal;
end;

function TQJson.ValueByPath(APath, ADefVal: QStringW): QStringW;
var
  AItem: TQJson;
begin
  AItem := ItemByPath(APath);
  if Assigned(AItem) then
    Result := AItem.Value
  else
    Result := ADefVal;
end;

procedure TQJson.ValueFromFile(AFileName: QStringW);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(AFileName, fmOpenRead);
  try
    ValueFromStream(AStream, 0);
  finally
    FreeObject(AStream);
  end;
end;

procedure TQJson.ValueFromStream(AStream: TStream; ACount: Cardinal);
var
  ABytes: TBytes;
begin
  if ACount = 0 then
  begin
    AStream.Position := 0;
    ACount := AStream.Size;
  end
  else if AStream.Position + ACount > AStream.Size then
    ACount := AStream.Size - AStream.Position;
  SetLength(ABytes, ACount);
  AStream.ReadBuffer(ABytes[0], ACount);
  AsBytes := ABytes;
end;

procedure TQJson.Delete;
begin
  if Assigned(FParent) then
    FParent.Delete(ItemIndex)
  else
    FreeObject(Self);
end;

{ TQJsonEnumerator }

constructor TQJsonEnumerator.Create(AList: TQJson);
begin
  inherited Create;
  FList := AList;
  FIndex := -1;
end;

function TQJsonEnumerator.GetCurrent: TQJson;
begin
  Result := FList[FIndex];
end;

function TQJsonEnumerator.MoveNext: Boolean;
begin
  if FIndex < FList.Count - 1 then
  begin
    Inc(FIndex);
    Result := True;
  end
  else
    Result := False;
end;

{ TQHashedJson }

procedure TQHashedJson.Assign(ANode: TQJson);
begin
  inherited;
  if (Length(FName) > 0) then
  begin
    if FNameHash = 0 then
      FNameHash := HashOf(PQCharW(FName), Length(FName) shl 1);
    if Assigned(Parent) then
      TQHashedJson(Parent).FHashTable.Add(Self, FNameHash);
  end;
end;

procedure TQHashedJson.Clear;
begin
  inherited;
  FHashTable.Clear;
end;

constructor TQHashedJson.Create;
begin
  inherited;
  FHashTable := TQHashTable.Create();
  FHashTable.AutoSize := True;
end;

function TQHashedJson.CreateJson: TQJson;
begin
  if Assigned(OnQJsonCreate) then
    Result := OnQJsonCreate
  else
    Result := TQHashedJson.Create;
end;

destructor TQHashedJson.Destroy;
begin
  Clear;
  inherited;
  FreeAndNil(FHashTable);
end;

procedure TQHashedJson.DoJsonNameChanged(AJson: TQJson);
  procedure Rehash;
  var
    AIndex: Integer;
    AHash: TQHashType;
    AList: PQHashList;
    AItem: TQJson;
  begin
    AHash := HashName(AJson.Name);
    if AHash <> AJson.FNameHash then
    begin
      AList := TQHashedJson(AJson.Parent).FHashTable.FindFirst(AJson.FNameHash);
      while AList <> nil do
      begin
        AItem := AList.Data;
        if AItem = AJson then
        begin
          TQHashedJson(AJson.Parent).FHashTable.ChangeHash(AJson,
            AJson.FNameHash, AHash);
          AJson.FNameHash := AHash;
          Break;
        end
        else
          AList := TQHashedJson(AJson.Parent).FHashTable.FindNext(AList);
      end;
    end;
  end;

begin
  if AJson.FNameHash = 0 then
  begin
    AJson.FNameHash := HashName(AJson.Name);
    if Assigned(AJson.Parent) then
    begin
      TQHashedJson(AJson.Parent).FHashTable.Add(Self, AJson.FNameHash);
    end;
  end
  else
    Rehash;
end;

function TQHashedJson.IndexOf(const AName: QStringW): Integer;
var
  AHash: Integer;
  AList: PQHashList;
  AItem: TQJson;
begin
  AHash := HashName(AName);
  AList := FHashTable.FindFirst(AHash);
  Result := -1;
  while AList <> nil do
  begin
    AItem := AList.Data;
    if AItem.Name = AName then
    begin
      Result := AItem.ItemIndex;
      Break;
    end
    else
      AList := FHashTable.FindNext(AList);
  end;
end;

function TQHashedJson.ItemByName(AName: QStringW): TQJson;
  function ByHash: TQJson;
  var
    AIndex, AHash: Integer;
    AList: PQHashList;
    AItem: TQJson;
  begin
    AHash := HashName(AName);
    AList := FHashTable.FindFirst(AHash);
    Result := nil;
    while AList <> nil do
    begin
      AItem := AList.Data;
      if AItem.Name = AName then
      begin
        Result := AItem;
        Break;
      end
      else
        AList := FHashTable.FindNext(AList);
    end;
  end;

begin
  if DataType = jdtObject then
    Result := ByHash
  else
    Result := inherited ItemByName(AName);
end;

procedure TQHashedJson.DoParsed;
var
  I: Integer;
  AJson: TQJson;
begin
  FHashTable.Resize(Count);
  for I := 0 to Count - 1 do
  begin
    AJson := Items[I];
    if Length(AJson.FName) > 0 then
    begin
      if AJson.FNameHash = 0 then
        AJson.FNameHash := HashName(AJson.FName);
      FHashTable.Add(AJson, AJson.FNameHash);
    end;
    if AJson.Count > 0 then
      AJson.DoParsed;
  end;
end;

function TQHashedJson.Remove(AIndex: Integer): TQJson;
begin
  Result := inherited Remove(AIndex);
  if Assigned(Result) then
    FHashTable.Delete(Result, Result.NameHash);
end;

procedure TQHashedJson.Replace(AIndex: Integer; ANewItem: TQJson);
var
  AOld: TQJson;
begin
  if not(ANewItem is TQHashedJson) then
    raise Exception.CreateFmt(SReplaceTypeNeed, ['TQHashedJson']);
  AOld := Items[AIndex];
  FHashTable.Delete(AOld, AOld.NameHash);
  inherited;
  if Length(ANewItem.FName) > 0 then
    FHashTable.Add(ANewItem, ANewItem.FNameHash);
end;

procedure DoEncodeAsBase64(const ABytes: TBytes; var AResult: QStringW);
{$IFNDEF UNICODE}
  function EncodeBase64(const V: Pointer; len: Integer): QStringW;
  var
    AIn, AOut: TMemoryStream;
    T: QStringA;
  begin
    AIn := TMemoryStream.Create;
    AOut := TMemoryStream.Create;
    try
      AIn.WriteBuffer(V^, len);
      AIn.Position := 0;
      EncodeStream(AIn, AOut);
      T.Length := AOut.Size;
      Move(AOut.Memory^, PQCharA(T)^, AOut.Size);
      Result := qstring.Utf8Decode(T);
    finally
      FreeObject(AIn);
      FreeObject(AOut);
    end;
  end;
{$ENDIF}

begin
  if Length(ABytes) > 0 then
    AResult := QStringW(EncodeBase64(@ABytes[0], Length(ABytes)))
  else
    SetLength(AResult, 0);
end;

procedure DoDecodeAsBase64(const S: QStringW; var AResult: TBytes);
{$IFNDEF UNICODE}
  function DecodeBase64(const S: QStringW): TBytes;
  var
    AIn, AOut: TMemoryStream;
    T: QStringA;
  begin
    AIn := TMemoryStream.Create;
    AOut := TMemoryStream.Create;
    try
      T := qstring.UTF8Encode(S);
      AIn.WriteBuffer(PQCharA(T)^, T.Length);
      AIn.Position := 0;
      DecodeStream(AIn, AOut);
      SetLength(Result, AOut.Size);
      Move(AOut.Memory^, Result[0], AOut.Size);
    finally
      FreeObject(AIn);
      FreeObject(AOut);
    end;
  end;
{$ENDIF}

begin
  if Length(S) > 0 then
    AResult := DecodeBase64({$IFNDEF NEXTGEN}AnsiString(S){$ELSE}S{$ENDIF})
  else
    SetLength(AResult, 0);
end;

procedure EncodeJsonBinaryAsBase64;
begin
  OnQJsonEncodeBytes := DoEncodeAsBase64;
  OnQJsonDecodeBytes := DoDecodeAsBase64;
end;

procedure EncodeJsonBinaryAsHex;
begin
  OnQJsonEncodeBytes := nil;
  OnQJsonDecodeBytes := nil;
end;

{ TQJsonStreamHelper }

procedure TQJsonStreamHelper.BeginArray;
begin
  InternalWriteString('[', False);
  Push;
end;

procedure TQJsonStreamHelper.BeginObject;
begin
  Inc(FLast.Count);
  InternalWriteString('{', False);
  Push;
end;

procedure TQJsonStreamHelper.BeginObject(const AName: QStringW);
begin
  Inc(FLast.Count);
  InternalWriteString('"' + TQJson.JsonEscape(AName, FDoEscape) + '":{', False);
  Push;
end;

procedure TQJsonStreamHelper.BeginWrite(AStream: TStream;
  AEncoding: TTextEncoding; ADoEscape: Boolean);
begin
  FStream := AStream;
  FEncoding := AEncoding;
  FDoEscape := ADoEscape;
  FLast := nil;
  Push;
end;

procedure TQJsonStreamHelper.EndArray;
begin
  if not IsEmpty then
  begin
    case FEncoding of
      teUnicode16LE, teUnicode16BE:
        FStream.Seek(-2, soCurrent);
    else
      FStream.Seek(-1, soCurrent);
    end;
  end;
  InternalWriteString(']');
  Pop;
end;

procedure TQJsonStreamHelper.EndObject;
begin
  if not IsEmpty then
  begin
    case FEncoding of
      teUnicode16LE, teUnicode16BE:
        FStream.Seek(-2, soCurrent);
    else
      FStream.Seek(-1, soCurrent);
    end;
  end;
  InternalWriteString('}');
  Pop;
end;

procedure TQJsonStreamHelper.EndWrite;
begin
  if not IsEmpty then
  begin
    if FStream.Size > FStream.Position then
      FStream.Seek(-1, soCurrent)
    else
      FStream.Size := FStream.Size - 1;
  end;
  Pop;
end;

procedure TQJsonStreamHelper.InternalWriteString(S: QStringW;
  ADoAppend: Boolean);
  procedure AnsiWrite;
  var
    T: QStringA;
  begin
    T := AnsiEncode(S);
    FStream.WriteBuffer(T.Data^, T.Length);
  end;
  procedure Utf8Write;
  var
    T: QStringA;
  begin
    T := qstring.UTF8Encode(S);
    FStream.WriteBuffer(T.Data^, T.Length);
  end;
  procedure BEWrite;
  var
    T: QStringW;
  begin
    T := StrDupX(PQCharW(S), Length(S));
    ExchangeByteOrder(PQCharA(T), Length(T) shl 1);
    FStream.WriteBuffer(PQCharW(T)^, Length(T) shl 1);
  end;

begin
  FIsEmpty := False;
  if ADoAppend then
    S := S + ',';
  case FEncoding of
    teAnsi:
      AnsiWrite;
    teUnicode16LE:
      FStream.Write(PQCharW(S)^, Length(S) shl 1);
    teUnicode16BE:
      BEWrite;
  else
    Utf8Write;
  end;
end;

procedure TQJsonStreamHelper.Pop;
var
  ALast: PQStreamHelperStack;
begin
  if Assigned(FLast) then
  begin
    ALast := FLast;
    FLast := ALast.Prior;
    Dispose(ALast);
  end;
end;

procedure TQJsonStreamHelper.Push;
var
  AItem: PQStreamHelperStack;
begin
  New(AItem);
  AItem.Prior := FLast;
  AItem.Count := 0;
  FLast := AItem;
end;

procedure TQJsonStreamHelper.Write(const S: QStringW);
begin
  InternalWriteString('"' + TQJson.JsonEscape(S, FDoEscape) + '"');
end;

procedure TQJsonStreamHelper.Write(const ABytes: TBytes);
var
  S: QStringW;
begin
  if Assigned(OnQJsonEncodeBytes) then
    OnQJsonEncodeBytes(ABytes, S)
  else
    S := qstring.BinToHex(ABytes);
  InternalWriteString('"' + S + '"');
end;

procedure TQJsonStreamHelper.Write(const p: PByte; l: Integer);
var
  ATemp: TBytes;
begin
  SetLength(ATemp, l);
  Move(p^, ATemp[0], l);
  Write(ATemp);
end;

procedure TQJsonStreamHelper.Write(const b: Boolean);
begin
  if b then
    InternalWriteString('true')
  else
    InternalWriteString('false');
end;

procedure TQJsonStreamHelper.Write(const I: Int64);
begin
  InternalWriteString(IntToStr(I));
end;

procedure TQJsonStreamHelper.Write(const D: Double);
begin
  InternalWriteString(FloatToStr(D));
end;

procedure TQJsonStreamHelper.Write(const c: Currency);
begin
  InternalWriteString(CurrToStr(c));
end;

procedure TQJsonStreamHelper.WriteDateTime(const V: TDateTime);
  function JsonDateTime: QStringW;
  var
    MS: Int64;
    // ʱ����Ϣ������
  begin
    MS := Trunc(V * 86400000);
    Result := '"/DATE(' + IntToStr(MS) + ')/"';
  end;
  function FormatedJsonTime: QStringW;
  var
    ADate: Integer;
  begin
    ADate := Trunc(V);
    if SameValue(ADate, 0) then // DateΪ0����ʱ��
    begin
      if SameValue(V, 0) then
        Result := '"' + FormatDateTime(JsonDateFormat, V) + '"'
      else
        Result := '"' + FormatDateTime(JsonTimeFormat, V) + '"';
    end
    else
    begin
      if SameValue(V - ADate, 0) then
        Result := '"' + FormatDateTime(JsonDateFormat, V) + '"'
      else
        Result := '"' + FormatDateTime(JsonDateTimeFormat, V) + '"';
    end;
  end;

begin
  if StrictJson then
    InternalWriteString(JsonDateTime)
  else
    InternalWriteString(FormatedJsonTime);
end;

procedure TQJsonStreamHelper.WriteName(const S: QStringW);
begin
  InternalWriteString('"' + TQJson.JsonEscape(S, FDoEscape) + '":', False);
  Inc(FLast.Count);
end;

procedure TQJsonStreamHelper.WriteNull(const AName: QStringW);
begin
  WriteName(AName);
  WriteNull;
end;

procedure TQJsonStreamHelper.WriteNull;
begin
  InternalWriteString('null');
end;

procedure TQJsonStreamHelper.Write(const AName: QStringW; AValue: Double);
begin
  WriteName(AName);
  InternalWriteString(FloatToStr(AValue));
end;

procedure TQJsonStreamHelper.Write(const AName: QStringW; AValue: Int64);
begin
  WriteName(AName);
  Write(IntToStr(AValue));
end;

procedure TQJsonStreamHelper.Write(const AName, AValue: QStringW);
begin
  WriteName(AName);
  Write(AValue);
end;

procedure TQJsonStreamHelper.Write(const AName: QStringW; const p: PByte;
  const l: Integer);
begin
  WriteName(AName);
  Write(p, l);
end;

procedure TQJsonStreamHelper.Write(const AName: QStringW; AValue: Boolean);
begin
  WriteName(AName);
  Write(AValue);
end;

procedure TQJsonStreamHelper.Write(const AName: QStringW; AValue: TBytes);
begin
  WriteName(AName);
  Write(AValue);
end;

procedure TQJsonStreamHelper.WriteDateTime(const AName: QStringW;
  AValue: TDateTime);
begin
  WriteName(AName);
  WriteDateTime(AValue);
end;

procedure TQJsonStreamHelper.BeginArray(const AName: QStringW);
begin
  InternalWriteString('"' + TQJson.JsonEscape(AName, FDoEscape) + '":[', False);
  Push;
end;

initialization

StrictJson := False;
JsonRttiEnumAsInt := True;
JsonCaseSensitive := True;
JsonDateFormat := 'yyyy-mm-dd';
JsonDateTimeFormat := 'yyyy-mm-dd''T''hh:nn:ss.zzz';
JsonTimeFormat := 'hh:nn:ss.zzz';
OnQJsonCreate := nil;
OnQJsonFree := nil;

end.
