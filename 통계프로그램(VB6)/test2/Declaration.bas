Attribute VB_Name = "Declaration"
Option Explicit



'ó�� ���� �� ���� �ð� Ȯ��
Public f_StDt As String
Public f_EdDt As String

'ADO���� ����
Public G_Host_Con As ADODB.Connection
'Public G_Host_Rs As ADODB.Recordset
Public G_Host_Con_FLAG As Boolean
Public G_Param As ADODB.Parameter
Public G_Print_Con As String

Public G_MDB_Con As ADODB.Connection
Public G_MDB_Rs As ADODB.Recordset
'Public G_MDB_Con_Flag As Boolean

Public G_Freeday As String

Public G_Con_Str As String

'�޼��� ���� ����
Public G_Msg As String
Public G_Title As String
Public G_Result As String
Public G_Vboption As String

Public G_CurrentDateTime As String
Public G_CurrentDate As String
Public G_CurrentTime As String
Public G_PrintDate As String
Public G_BeforeFiveDateTime As String        '���� ��¥��  5���� ��¥ ����
Public G_PjobDate As String                  '���� ��¥��  1���� ��¥ ����
Public G_BeforeTwoDate As String             '���� ��¥��  2���� ��¥ ����
Public G_ChehaDate As String                 'üȭ ���� ��¥ ����

Public G_Login_Form As Form                 'MDI_Form ����
Public G_UserID As String                   '����� �����ȣ
Public G_TEST_Code As String                '�׽�Ʈ �ڵ� ����
Public G_PassWord As String                 '����� PassWord
'Public G_GroupID As String                  '����� Group
Public G_MenuCheck As Boolean
Public G_UserSEQ As String                   '����� ������

Global AppPath As String                    'Directory path

Public G_MRN As String
Public G_Ship_Info As String
Public G_FormJump As Boolean                'E71A068C���� ���̵� Ȯ�� ����

Global Const G_BOSE_Code = "03086064"        '�����ϼ���� Code
Global Const G_CFS_Code = "03086067"         'CFS �ϼ���� Code
'Global Const G_PG_Passwd = "CFS"            '���α׷� ��밡���� PassWord
Global Const G_Comma = ","
Global Const G_Strng = "'"
Global Const G_Space = " "
Global Const G_Equal = "="

'Global Const G_Company = "Dongbu KwangYang Container Terminal Co., LTD."
Global Const G_Company = "Dongbu Pusan Container Terminal Co., LTD."

Global Const G_AccUnit = "J"
Global Const G_AgentCode = ""

'����Ʈ ����
Public G_PrintSetUp As Boolean
Public G_PaperSize As Integer
Public G_Orientation As Integer
Public G_Copies As Integer
Public G_PrintDriver As String
Public G_PrintName As String
Public G_PrintPort As String

'�ּҰ���
Global gs_mail_no    As String
Global gs_addr1      As String

'���ã��
Global gs_empno As String
Global gs_empnm As String
Global gs_deptno As String
Global gs_deptnm As String
Global gQry_flg As Boolean

'/* �� �� �� */
' -----------------------------------------------------------------
Public update_ok As String * 1

'�ѱ۵� ���ڿ�����
Public Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" _
  (ByVal ipstring As String) As Long

' �ѱۿ��� ��ȯ
Public Const IME_CMODE_NATIVE = &H1
Public Const IME_CMODE_HANGEUL = IME_CMODE_NATIVE
Public Const IME_CMODE_ALPHANUMERIC = &H0
Public Const IME_SMODE_NONE = &H0
Public Declare Function ImmGetContext Lib "imm32.dll" (ByVal hwnd As Long) As Long
Public Declare Function ImmSetConversionStatus Lib "imm32.dll" (ByVal himc As Long, ByVal dw1 As Long, ByVal dw2 As Long) As Long
' __________________________________________________________________

Public G_Update As Boolean

Global CLLrcD() As CLLrEcorD

Public G_Chk_RFLoca As String
Public G_GateNo As String

Type CLLrEcorD
    Cntr_no As String
    SZ_CD As String
    TY_CD As String
    FM_CD As String
    pod As String
    Oper_Cd As String
    ShipCall As String
    Weight As String
    Ts_ID As String
    Cmp_ID As Boolean  'true:�����̳ʹ�ȣ�� �������� �ִ�. false:�����̳ʹ�ȣ�� ���� ���� ����.
    dest As String
    oPod1 As String
    Seal_No As String
    SOC_Yn As String
    Temp As String
    SocOperCd As String
    bkNo As String
    vgmWeight As String
End Type

Type MibanipSummary 'CLL, TDR���� ���δ�
    pod As String
    Oper_Cd As String
    f20 As Integer
    f40 As Integer
    fHC As Integer
    f45 As Integer '5/29 �߰�(for TDR)
    fWGT As Double '5/29 �߰�(for TDR)
    m20 As Integer
    m40 As Integer
    mHC As Integer
    m45 As Integer '5/29 �߰�(for TDR)
    mWGT As Double '5/29 �߰�(for TDR)
    Van As Integer '5/29 �߰�(for TDR)
    Teu As Integer '5/29 �߰�(for TDR)
    l20 As Integer 'Light - Weight
    l40 As Integer
    lHC As Integer
    h20 As Integer 'Heavy - Weight
    h40 As Integer
    hHC As Integer
    
End Type

Global MibanipSum() As MibanipSummary

' 2001-08-07   �����
Public G_Tmnl_CD As String                        '  �͹̳� cd
Public G_Tmnl_NM As String                        '  �͹̳� ��Ī
Public G_MaxTier As Integer                       '  ����ܼ�
Public G_DG_MaxTier As Integer                    '  ���蹰��ġ�ܼ�
Public G_RF_MaxTier As Integer                    '  �õ���ġ�ܼ�
Public G_SPC_Block As String                      '  Ư��ȭ�� ��ġ��
Public G_Chk_Loc As String                        '  ��ġ��ġcheck����
Public G_Sensor_Chk As String                     '  ����� sensor check����

'2001-10-22   ����ȿ
Public G_GateMoni As Form

Type Cntr_Information
    Cntr_no As String
    ship_cd As String
    call_no As String
    call_yy As String
    SZ_CD As String
    TY_CD As String
    FM_CD As String
    pod As String
    pol As String
    Oper_Cd As String
    Weight As String
    Cur_Stat As String
    Ts_ID As String
    Rtn_CD As String
    Bond_ID As String
    Temp_ID As String
    Temp As String
    unno As String
    Imdg As String
    y_tblock As String
    y_tbay As String
    y_trow As String
    y_ttier As String
    trucker_cd As String
    CarNo As String
    Over_H As String
    Over_WS As String
    Over_WP As String
    Over_LF As String
    Over_LB As String
    Seal_No As String
    IO_CD As String
    ioUdest As String
    CurX As Long
    CurY As Long
End Type

Public CntrInfo As Cntr_Information
Public CntrInfoClear As Cntr_Information

Type Plan_List
    Vessel As String
    pod As String
    SZ_CD As String
    FM_CD As String
    HiCubic As String
    Weight As String
    TY_CD As String
    IO_CD As String
    Tot_Cnt As String
    Use_Cnt As String
End Type
Public PlanList() As Plan_List

Type Worktm_List  ' ����� ���¹��ð� ���� dpctgm.worktm
    work_date As String     ' �ٹ�����
    emp_no As String        ' �����ȣ
    emp_name As String      ' �����
    g_cd As String          ' ���¸�
    g_cdnm As String        ' �����ڵ�
End Type
Public WorktmList() As Worktm_List

Public G_TmnlFull As String

'������ ĸ���� �̿��Ͽ� �ش� �������� handle���� �����ϴ� �Լ�
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" _
    (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

'�ý��ۿ� �޼����� �����ϴ� �Լ�
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
(ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Integer, _
ByVal lParam As Any) As Long

Public Const WM_CLOSE = &H10 '�����츦 �ݱ����� �Լ����� ����ϴ� �����

Public Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Public Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" _
        (ByVal hwnd As Long) As Long
Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, _
        ByVal lpString As String, ByVal cch As Long) As Long

Public Const GW_HWNDFIRST = 0
Public Const GW_HWNDNEXT = 2
Public Const GW_OWNER = 4

Public Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long

'Version CLL
Public C_ver As String

Public G_GroupID As String


Type to_Tos
  sCntr As String * 11            '�����̳� ��ȣ
  sBlock As String * 2            'Block
  sBay As String * 2              'Bay
  sRow As String * 2              'Row
  sTier As String * 1             'Tier
  sYear As String * 4             '�����⵵
  sVsl As String * 7              '�͹̳� ����
  sCallSign As String * 6         'ȣ���ȣ
  sBlNo As String * 20            'BL No
  sIxCd As String * 2             '������ ���� �ڵ�
  sGCTS As String * 3             'GCTS ������ �ڵ�
  sState As String * 3            '�͹̳� ������ �ڵ�
  sFm As String * 1               '��������
  sPod As String * 5              'POD
  sPol As String * 5              'POL
  sImdg As String * 4             'IMDG
  sUNNO As String * 4             'UNNO
  sSeal As String * 10            'Seal No.
  sOper As String * 3             '�����ڵ�
  sTemp As String * 5             '�õ��µ�
  sTempId As String * 1           '����/ȭ�� ����
  sWeight As String * 5           '����
  sSndId As String * 8            '��ۻ� �ڵ�
  sReturn As String               'ó�����
  sFT1 As String * 10
  sFT2 As String * 10
  sSize As String
  sIO As String
  sTrucker_cd As String
  sCar_no As String
  sTel As String * 20
End Type

Public gTel As String * 20

Public toTos() As to_Tos

Public rfErrMsg As String

Public rfCarNo As String
Public rfCode As String
Public rfNHYN As String     '900�±� ��밡��
Public rfNHID As String     '900�±� ID

Public blnMsg As Boolean
Public blnMsg1 As Boolean
Public blnMenual As Boolean


Public G_GCCNT As String
Public G_TCCNT As String
Public G_TCECNT As String
Public G_RSCNT As String
Public G_YTCNT As String
Public G_YCCNT As String
Public G_SYCNT As String
Public G_RENCNT As String

Public G_Trucker_cd As String
Public G_Car_no As String

'Public G_ErrCD As String

Type Block_Cnt
    Block As String
    Cnt As String
End Type
Public BlockCnt() As Block_Cnt

Public G_version As String                                                 '���ڹ��� Version
Public G_function As String


Public F_CY As String

'������ �˻� ��� ����
Public F_Rpr_Yn As Boolean



