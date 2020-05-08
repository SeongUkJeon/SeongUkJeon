Attribute VB_Name = "MainFunction"
Option Explicit

Dim ToDate As String

'========================������ ��=============================
Public Function Host_Temp_Connect(argHost As String) As Boolean
    Dim X As String

On Error GoTo ConnectHostErr
    If App.PrevInstance Then
        MsgBox "   Application is already running !   "
        Screen.MousePointer = 0
        End
    End If
    
    AppPath = App.Path

    If argHost = "A" Then  'Test Host
        G_Print_Con = "dsn=DEVDPCT;uid=dpctos;pwd=ehdqn;database=DEVDPCT;"

        Set G_Host_Con = New ADODB.Connection
        G_Host_Con.CursorLocation = adUseClient
        G_Con_Str = "PROVIDER=MSDASQL;dsn=DEVDPCT;uid=dpctos;pwd=ehdqn;database=DEVDPCT;"
    Else                   'Real Host
'        G_Print_Con = "dsn=DKCT;uid=dkctos;pwd=ehdqn;database=dkct;"
        G_Print_Con = "dsn=dpctos;uid=dpctos;pwd=ehdqn;database=dpcta;"

        Set G_Host_Con = New ADODB.Connection
        G_Host_Con.CommandTimeout = 1000
        G_Host_Con.CursorLocation = adUseClient
        G_Con_Str = "PROVIDER=MSDASQL;dsn=dpctos;uid=dpctos;pwd=ehdqn;database=dpcta;"
'        G_Con_Str = "PROVIDER=MSDASQL;dsn=DKCT;uid=dkctos;pwd=ehdqn;database=dkct;"
    End If

    G_Host_Con.ConnectionString = G_Con_Str
    G_Host_Con.Open G_Con_Str
    G_Host_Con_FLAG = True
    
    Host_Temp_Connect = True
    Exit Function
    
ConnectHostErr:
    G_Host_Con_FLAG = False
    Host_Temp_Connect = False
    Screen.MousePointer = 0
    Exit Function
End Function

'HOST Connect
Public Function Host_Connect() As Boolean
    Dim X As String

On Error GoTo ConnectHostErr
    If App.PrevInstance Then
        MsgBox "   Application is already running !   "
        Screen.MousePointer = 0
        Unload frmStartScreen
        End
    End If
    
    AppPath = App.Path
'    G_Print_Con = "dsn=dkct;uid=dkctos;pwd=ehdqn;database=dkct;"
    'G_Print_Con = "dsn=dpctos;uid=dpctts;pwd=ehdqn;database=dpcta;"
    G_Print_Con = "dsn=dpctos;uid=dpctos;pwd=ehdqn;database=dpcta;"

    Set G_Host_Con = New ADODB.Connection
    G_Host_Con.CursorLocation = adUseClient
'    G_Con_Str = "PROVIDER=MSDASQL;dsn=dkct;uid=dkctos;pwd=ehdqn;database=dkct;"
    'G_Con_Str = "PROVIDER=MSDASQL;dsn=dpctos;uid=dpctos;pwd=ehdqn;database=dpcta;"
    G_Con_Str = "PROVIDER=MSDASQL;dsn=dpctos;uid=dpctos;pwd=ehdqn;database=dpcta;"
    G_Host_Con.ConnectionString = G_Con_Str
    G_Host_Con.Open G_Con_Str
    G_Host_Con_FLAG = True
    
    Host_Connect = True
    Exit Function
    
ConnectHostErr:
    G_Host_Con_FLAG = False
    Unload frmStartScreen
    Host_Connect = False
    Screen.MousePointer = 0
    Exit Function
End Function

' MDB Connect
Public Function MDB_Connect(DB_name As String) As Integer
On Error GoTo Connect_Err
    Set G_MDB_Con = New ADODB.Connection
    G_MDB_Con.Open "PROVIDER=Microsoft.Jet.OLEDB.4.0;" & _
                  "data source = " & App.Path & "\" & DB_name & ""
    If G_MDB_Con.Errors.Count > 0 Then
        MsgBox G_MDB_Con.Errors
        MsgBox "[AdoEnvironment]DB Open Failed !!", 64, "Print DB :'" & DB_name & "'"
        MDB_Connect = -1
        Exit Function
    End If
    MDB_Connect = 0
    Exit Function
Connect_Err:
    Resume Next
End Function

' �ش� Form�� ������Ŵ
Public Sub Exit_Form(form_Name As Form)
    Unload form_Name
    Set form_Name = Nothing
    Screen.MousePointer = 0
End Sub

Public Function DateToStr(InDate As Date) As String
'    If InDate <> Null Then
        DateToStr = Trim(Format(Mid(InDate, 1, 8), "YYYY/MM/DD"))
'    End If
End Function

'�޸��� �ִ� �������� ���������� ��ȯ       ex) 10,210,200 ==> 10210200
Public Function CommaTransNumber(Comma_STR As String) As String
    Dim Len_no, Comma_pos As Integer
    Dim Trans_STR, Total_STR As String

    Comma_pos = InStr(Comma_STR, ",")
   
    Do While Comma_pos <> 0
        Len_no = Len(Comma_STR)
        Comma_pos = InStr(Comma_STR, ",")

        If Comma_pos = 0 Then
            Total_STR = Total_STR & Comma_STR
            CommaTransNumber = Total_STR
            Exit Function
        Else
            Trans_STR = Mid(Comma_STR, 1, Comma_pos - 1)
            Total_STR = Total_STR & Trans_STR
            Comma_STR = Mid(Comma_STR, Comma_pos + 1, Len_no)
        End If
    Loop

    CommaTransNumber = Comma_STR

End Function

'���ڿ��� �߰��� �ִ� Ư�����ڸ� ���� ��
Public Function Delete_Character(Source_Str As String, Del_Str As String) As String
    Dim Len_no, Str_Pos As Integer
    Dim Trans_STR, Total_STR As String

    Str_Pos = InStr(Source_Str, Del_Str)
   
    Do While Str_Pos <> 0
        Len_no = Len(Source_Str)
        Str_Pos = InStr(Source_Str, Del_Str)

        If Str_Pos = 0 Then
            Total_STR = Total_STR & Source_Str
            Delete_Character = Total_STR
            Exit Function
        Else
            Trans_STR = Mid(Source_Str, 1, Str_Pos - 1)
            Total_STR = Total_STR & Trans_STR
            Source_Str = Mid(Source_Str, Str_Pos + 1, Len_no)
        End If
    Loop

    Delete_Character = Source_Str

End Function

'�ý��۳�¥�� �ð��� ����
Public Function GetHostDateTime() As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo GetCurrentDate_Err
    
    SQL = "SELECT sysdate FROM dual"
'    Sql = "SELECT TO_DATE('200110102300','YYYYMMDDHH24MISS') FROM dual"
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        MsgBox "�ý��� �ð��� �� �� �����ϴ�!!"
        GetHostDateTime = -1
        Exit Function
    End If
    
    Rs.MoveFirst
    G_CurrentDateTime = Format(Rs(0), "YYYYMMDDHHMMSS")
    G_CurrentDate = Mid(G_CurrentDateTime, 1, 8)
    G_CurrentTime = Mid(G_CurrentDateTime, 9, 11)
    G_BeforeFiveDateTime = Format(Rs(0) - 5, "YYYYMMDDHHMMSS")   '���� ��¥��  5���� ��¥
    G_BeforeTwoDate = Format(Rs(0) - 2, "YYYYMMDD")   '���� ��¥��  2���� ��¥
    G_PjobDate = Format(Rs(0) - 1, "YYYYMMDD")        '���� ��¥��  1���� ��¥
    
    G_PrintDate = "�������� : " & Trim(Format(Rs(0), "YYYY.MM.DD HH:MM"))

    Rs.Close
    Set Rs = Nothing

    GetHostDateTime = 0
    Exit Function
    
GetCurrentDate_Err:
    MsgBox Err.Description
    G_CurrentDate = ""
    G_CurrentTime = ""
    GetHostDateTime = -1
    Exit Function
End Function

'MSFlexGrid�� ����BAR Display
Public Sub State_Bar(Grid_Name As Control, nrow As Integer, NCol_Count As Integer, gubun As String)
    Dim i As Integer
    
    If gubun = "D" Then
        Grid_Name.ReDraw = False
        For i = 1 To NCol_Count
            Grid_Name.Row = nrow
            Grid_Name.Col = i
            Grid_Name.CellForeColor = &H0&         '������
            Grid_Name.CellBackColor = &HFFFFFF     '���
        Next i
        Grid_Name.ReDraw = True
        
    ElseIf gubun = "I" Then
        Grid_Name.ReDraw = False
        For i = 1 To NCol_Count
            Grid_Name.Row = nrow
            Grid_Name.Col = i
            Grid_Name.CellForeColor = &HFFFFFF         '���
            Grid_Name.CellBackColor = &H800000         '����
        Next i
        Grid_Name.ReDraw = True
    End If
    
End Sub

Function Lenh(s As String) As String
  Lenh = LenB(StrConv(s, 128))
End Function

'�ѱ۸��� ��ȯ
Public Sub Korea_Mode(Control_NM As Object)
  Dim himc As Long
  
  himc = ImmGetContext(Control_NM.hwnd)
  ImmSetConversionStatus himc, IME_CMODE_HANGEUL, IME_SMODE_NONE
End Sub

'�������� ��ȯ
Public Sub English_Mode(Control_NM As Object)
  Dim himc As Long
  
  himc = ImmGetContext(Control_NM.hwnd)
  ImmSetConversionStatus himc, IME_CMODE_ALPHANUMERIC, IME_SMODE_NONE
End Sub

'FromDate�� ToDate���� �۰ų� ������ Check
Public Function DurationCheck(FromDate As String, ToDate As String) As Boolean
    Dim Diff As Integer
    
    Diff = DateDiff("d", DateSerial(Val(Left(FromDate, 4)), Val(Mid(FromDate, 5, 2)), Val(Mid(FromDate, 7, 2))), _
                         DateSerial(Val(Left(ToDate, 4)), Val(Mid(ToDate, 5, 2)), Val(Mid(ToDate, 7, 2))))

    If Diff >= 0 Then
        DurationCheck = True
    Else    'FromDate �� ToDate���� ū ��� ==> Error
        MsgBox "FromDate�� ToDate ������ ���ڰ��� �����Ǿ����ϴ�"
        DurationCheck = False
    End If
End Function

'FromDate�� ToDate���� �۰ų� ������ Check
Public Function DurationChkDateTime(FromDateTime As String, ToDateTime As String) As Boolean
    Dim FromDate As String
    Dim ToDate As String
    Dim Diff As Integer
    
    FromDate = Mid(FromDateTime, 1, 4) & "-" & Mid(FromDateTime, 5, 2) & "-" & Mid(FromDateTime, 7, 2) & " "
    FromDate = FromDate & Mid(FromDateTime, 9, 2) & ":" & Mid(FromDateTime, 11, 2) & ":" & Mid(FromDateTime, 13, 2)
    
    ToDate = Mid(ToDateTime, 1, 4) & "-" & Mid(ToDateTime, 5, 2) & "-" & Mid(ToDateTime, 7, 2) & " "
    ToDate = ToDate & Mid(ToDateTime, 9, 2) & ":" & Mid(ToDateTime, 11, 2) & ":" & Mid(ToDateTime, 13, 2)
    
    If IsDate(FromDate) = False Then
        MsgBox "�������ڰ� Date�������� ��ȯ���� �ʽ��ϴ�"
        DurationChkDateTime = False:        Exit Function
    End If
    
    If IsDate(ToDate) = False Then
        MsgBox "�������ڰ� Date�������� ��ȯ���� �ʽ��ϴ�"
        DurationChkDateTime = False:        Exit Function
    End If
    
    Diff = DateDiff("s", FromDate, ToDate)

    If Diff >= 0 Then
        DurationChkDateTime = True
    Else    'FromDate �� ToDate���� ū ��� ==> Error
        MsgBox "FromDate�� ToDate ������ ���ڰ��� �����Ǿ����ϴ�"
        DurationChkDateTime = False
    End If
End Function

'FromDate�� ToDate���� �۰ų� ������ Check
Public Function AddDateTime(argDateTime As String, argInterval As String, argIntervalType As String) As String
    Dim DateTime As String
    
    DateTime = Mid(argDateTime, 1, 4) & "-" & Mid(argDateTime, 5, 2) & "-" & Mid(argDateTime, 7, 2) & " "
    DateTime = DateTime & Mid(argDateTime, 9, 2) & ":" & Mid(argDateTime, 11, 2) & ":" & Mid(argDateTime, 13, 2)

    If IsDate(DateTime) = False Then
        MsgBox "�������ڰ� Date�������� ��ȯ���� �ʽ��ϴ�"
        AddDateTime = ""
        Exit Function
    End If
    
    AddDateTime = Format(DateAdd("h", argInterval, DateTime), "YYYYMMDDHHMMSS")
    
End Function

'��¥���� Check
Public Function DateCheck(Chk_Date As String) As Boolean
    Dim yyyy As Integer
    Dim MM As Integer
    Dim DD As Integer
    Dim Diff As Integer
    
    If Trim(Chk_Date) = "" Then
        MsgBox ("��¥�� �Է� �Ǿ� ���� �ʽ��ϴ�, �ٽ� �Է��ϼ��� !!")
        DateCheck = False
        Exit Function
    Else
        If Len(Trim(Chk_Date)) <> 8 Then
            MsgBox ("��¥������ �߸��Ǿ����ϴ�, �ٽ� �Է��ϼ��� !!")
            DateCheck = False
            Exit Function
        Else
            yyyy = Mid(Trim(Chk_Date), 1, 4)
            MM = Mid(Trim(Chk_Date), 5, 2)
            DD = Mid(Trim(Chk_Date), 7, 2)
            If (Val(MM) > 0) And (Val(MM) < 13) Then
                Diff = DateDiff("d", DateSerial(Val(yyyy), Val(MM), 1), _
                                    DateSerial(Val(yyyy), Val(MM) + 1, 1))
                If Val(DD) >= 1 And Val(DD) <= Diff Then
                    DateCheck = True
                    Exit Function
                Else
                    MsgBox ("��¥����(��)�� �߸��Ǿ����ϴ�, �ٽ� �Է��ϼ���!!")
                    DateCheck = False
                    Exit Function
                End If
            Else
                MsgBox ("��¥����(��)�� �߸��Ǿ����ϴ�, �ٽ� �Է��ϼ��� !!")
                DateCheck = False
                Exit Function
            End If
        End If
    End If
End Function
'�ð����� Check
Public Function TimeCheck(Chk_time As String) As Boolean
    Dim HH, MM, ss
    Dim Diff
    
    If Trim(Chk_time) = "" Then
        MsgBox ("�ð��� �Էµ��� �ʾҽ��ϴ�, �ٽ� �Է��ϼ��� !!")
        TimeCheck = False
        Exit Function
    Else
        If Len(Trim(Chk_time)) <> 6 Then
            MsgBox ("�ð������� �߸��Ǿ����ϴ�, �ٽ� �Է��ϼ��� !!")
            TimeCheck = False
            Exit Function
        Else
            HH = Left(Trim(Chk_time), 2)
            MM = Mid(Trim(Chk_time), 3, 2)
            ss = Mid(Trim(Chk_time), 5, 2)
            If (Val(HH) < 0) Or (Val(HH) >= 25) Then
                    MsgBox ("�ð�����(��)�� �߸��Ǿ����ϴ�, �ٽ� �Է��ϼ���!!")
                TimeCheck = False
                Exit Function
            End If
            If (Val(MM) < 0) Or (Val(MM) >= 60) Then
                MsgBox ("��¥����(��)�� �߸��Ǿ����ϴ�, �ٽ� �Է��ϼ���!!")
                TimeCheck = False
                Exit Function
            End If
            If (Val(ss) < 0) Or (Val(ss) >= 60) Then
                MsgBox ("��¥����(��)�� �߸��Ǿ����ϴ�, �ٽ� �Է��ϼ���!!")
                TimeCheck = False
                Exit Function
            End If
        End If
    End If
    
    TimeCheck = True
End Function

'���� Check
Public Function DayOfTheWeek(Day_Format As String) As String
    Dim A As Date
    Dim bb As String
    
    bb = Mid(Day_Format, 1, 4) & "/" & Mid(Day_Format, 5, 2) & "/" & Mid(Day_Format, 7, 2)
    A = CDate(bb)
    
On Error GoTo Err
    Select Case Weekday(A)
        Case 1
            DayOfTheWeek = "��"
        Case 2
            DayOfTheWeek = "��"
        Case 3
            DayOfTheWeek = "ȭ"
        Case 4
            DayOfTheWeek = "��"
        Case 5
            DayOfTheWeek = "��"
        Case 6
            DayOfTheWeek = "��"
        Case 7
            DayOfTheWeek = "��"
        Case Else
            DayOfTheWeek = ""
    End Select
    Exit Function
Err:
    DayOfTheWeek = ""
End Function

'���� Check(����)
Public Function DayOfTheWeek_Eng(Day_Format As String) As String
    Dim A As Date
    Dim bb As String
    
    bb = Mid(Day_Format, 1, 4) & "/" & Mid(Day_Format, 5, 2) & "/" & Mid(Day_Format, 7, 2)
    A = CDate(bb)
    
On Error GoTo Err
    Select Case Weekday(A)
        Case 1
            DayOfTheWeek_Eng = "Sun"
        Case 2
            DayOfTheWeek_Eng = "Mon"
        Case 3
            DayOfTheWeek_Eng = "Teu"
        Case 4
            DayOfTheWeek_Eng = "Wed"
        Case 5
            DayOfTheWeek_Eng = "Thu"
        Case 6
            DayOfTheWeek_Eng = "Fri"
        Case 7
            DayOfTheWeek_Eng = "Sat"
        Case Else
            DayOfTheWeek_Eng = ""
    End Select
    Exit Function
Err:
    DayOfTheWeek_Eng = ""
End Function

'���� ������ ��¥ �˾ƺ���
Public Function LastDaysOfMonths(yyyymm As Long) As Integer
    Dim Year As Integer
    Dim MM As Integer
    
On Error GoTo Err
    Year = Val(Mid(yyyymm, 1, 4))
    MM = Val(Mid(yyyymm, 5, 2))
    LastDaysOfMonths = Val(Day(DateSerial(Year, MM + 1, 1 - 1)))
    Exit Function
    
Err:
    LastDaysOfMonths = -1
End Function

'print�� ��ġ�� �μ�
Public Function Print_Text(X As Integer, Y As Integer, txt As String)
  Printer.CurrentX = X
  Printer.CurrentY = Y
  
  Printer.Print txt
End Function

'���ڿ� ������ ����
Public Sub Print_String_Right(X As Integer, Y As Integer, X1 As Integer, Y1 As Integer, printStr As String)
    Dim Cur_X As Integer, Cur_Y As Integer

   If Trim(printStr) = "" Then Exit Sub

   Cur_X = X1 - Printer.TextWidth(printStr)
   Printer.CurrentX = Cur_X
   If Y <> Y1 Then
      Cur_Y = Y + CInt((Abs(Y1 - Y) - Printer.TextHeight(printStr)) / 2)
      Printer.CurrentY = Cur_Y
   Else
      Printer.CurrentY = Y
   End If
   Printer.Print printStr
End Sub
'������check
Public Function CHECK_VESCALL(ShipCode As String, CallNo As String, CallYear As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg

    If ShipCode = "" Then
        MsgBox "���ڵ带 ���� �Է��Ͻÿ�":        CHECK_VESCALL = 2
        Exit Function
    End If
    
    If CallNo = "" Then
        MsgBox "������ ���� �Է��Ͻÿ�":            CHECK_VESCALL = 3
        Exit Function
    End If
    
    If CallYear = "" Then
        MsgBox "�⵵�� ���� �Է��Ͻÿ�":            CHECK_VESCALL = 4
        Exit Function
    End If
    
    SQL = "SELECT ship_cd,call_no,call_yy FROM t_vescall"
    SQL = SQL & " WHERE ship_cd = '" & ShipCode & "'"
    SQL = SQL & "   AND call_no =  " & CallNo & " "
    SQL = SQL & "   AND call_yy =  " & CallYear & " "
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        CHECK_VESCALL = 1
    Else
        CHECK_VESCALL = 0
    End If
    Rs.Close:       Set Rs = Nothing
    
    Exit Function
    
ErrMsg:
    Screen.MousePointer = 0
    CHECK_VESCALL = -1
    MsgBox "�Լ�(CHECK_VESCALL) Error(T_Vescall)" & vbCrLf & Err.Description
End Function

Public Function Check_ShipCode(cboCallNo As ComboBox, Ship_Code As String, Call_Year As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim SaveCallNo As String
    Dim tempNo As String
    Dim CallNo As String
    
    Dim FoundCallNo As Boolean
    
    Dim i As Integer

    If Trim(Ship_Code) = "" Then
        MsgBox "���ڵ带 �Է��Ͻÿ�":        Check_ShipCode = -1:         Exit Function
    End If

    If Trim(Call_Year) = "" Then
        MsgBox "�⵵�� �Է��Ͻÿ�":            Check_ShipCode = -1:         Exit Function
    End If
    
    SaveCallNo = cboCallNo.Text
On Error GoTo ErrMsg

    SQL = "SELECT DISTINCT(call_no) FROM t_vescall"
    SQL = SQL & " WHERE ship_cd = '" & Trim(Ship_Code) & "'"
    SQL = SQL & "   AND call_yy =  " & Val(Trim(Call_Year)) & " "
    SQL = SQL & " ORDER BY call_no"

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    i = 0
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        MsgBox "�ش�⵵���� �������� �������� �ʽ��ϴ�"
        Check_ShipCode = 1:         Exit Function
    End If
    
    cboCallNo.Clear
    
    Rs.MoveFirst
    Do While Not Rs.EOF
        i = i + 1
        tempNo = IIf(IsNull(Rs(0)), 0, Trim(Rs(0)))
        If Len(Trim(Str(tempNo))) = 1 Then
            CallNo = "0" & Trim(Str(tempNo))
        Else
            CallNo = Trim(Str(tempNo))
        End If

        cboCallNo.AddItem CallNo
        Rs.MoveNext
    Loop
    
    For i = 0 To cboCallNo.ListCount - 1
        If Trim(cboCallNo.List(i)) = Format(Trim(SaveCallNo), "00") Then                '�޺�List�� ������
            FoundCallNo = True:                Exit For
        End If
        FoundCallNo = False
    Next i
    
    If FoundCallNo = True Then
        cboCallNo.ListIndex = i
    Else
        cboCallNo.ListIndex = cboCallNo.ListCount - 1
    End If

    Rs.Close:                      Set Rs = Nothing
    Check_ShipCode = 0:            Exit Function

ErrMsg:
    Check_ShipCode = -1
    MsgBox "�Լ�(Check_ShipCode) Error(T_Vescall)" & vbCrLf & Err.Description
End Function

'UNNO CHECK
Public Function CHECK_UNNO(R_UNNO As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg
    
    SQL = "SELECT imdg,dg_ytype,dg_fgrade,dg_nm FROM t_unno"
    SQL = SQL & " WHERE unno = '" & Trim(R_UNNO) & "'"
    SQL = SQL & " ORDER BY unno,imdg"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        CHECK_UNNO = 1
    Else
        CHECK_UNNO = 0
    End If

    Rs.Close
    Set Rs = Nothing

    Exit Function
    
ErrMsg:
    CHECK_UNNO = -1
    MsgBox "�Լ�(CHECK_UNNO) Error(T_UNNO)" & vbCrLf & Err.Description
End Function
'UNNO�Է½� ���õǴ� �׸� Return
Public Function UNNO_RELATION_SHOW(ParamArray Arrary_Unno()) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim i As Integer
    Dim Factor As Integer
    
    Factor = UBound(Arrary_Unno)

On Error GoTo ErrMsg

    SQL = "SELECT imdg,dg_ytype,dg_fgrade,dg_nm,dg_jisu FROM t_unno"
    SQL = SQL & " WHERE unno = '" & Trim(Arrary_Unno(0)) & "'"
    SQL = SQL & " ORDER BY unno,imdg"

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        UNNO_RELATION_SHOW = 1
    Else
        For i = 1 To Factor
            Arrary_Unno(i) = IIf(IsNull(Rs(i - 1)), "", Trim(Rs(i - 1)))
        Next i
        UNNO_RELATION_SHOW = 0
    End If

    Rs.Close
    Set Rs = Nothing

    Exit Function

ErrMsg:
    UNNO_RELATION_SHOW = -1
    MsgBox "�Լ�(UNNO_RELATION_SHOW) Error(T_UNNO)" & vbCrLf & Err.Description
End Function

'�޺��ڽ� List�� �ִ� �������� Check�Ѵ�
Public Function Check_ComboList(Combo As ComboBox) As Boolean
    Dim i As Integer

On Error GoTo ErrMsg

    For i = 0 To Combo.ListCount
        If Trim(Combo.List(i)) = Trim(Combo.Text) Then
            Check_ComboList = True                '�޺�List�� ������
            Screen.MousePointer = 0
            Exit Function
        End If
    Next i
   
    Check_ComboList = False                        '�޺�List�� ������
    
    Exit Function
    
ErrMsg:
    Check_ComboList = False
    MsgBox "�Լ�(Check_ComboList) Error" & vbCrLf & Err.Description
End Function

'�����̳ʹ�ȣ Check Digit
Public Function CNTR_CheckDigit(cntrNo As String) As Boolean
    Dim temp_data As String
    Dim Temp_Sum As Integer
    Dim Temp_Pos1 As Integer
    Dim Temp_Pos2 As Integer
    Dim Temp_Pos3 As Integer
    Dim Temp_Pos4 As Integer
    Dim Temp_Mod As Integer
    Dim Response As String
    
On Error GoTo ErrMsg
    temp_data = "1012131415161718192021232425262728293031323435363738"
    
    
    Temp_Pos1 = Val(Mid(temp_data, ((Asc(Mid(cntrNo, 1, 1)) - 64) * 2 - 1), 2)) * 1
    Temp_Pos2 = Val(Mid(temp_data, ((Asc(Mid(cntrNo, 2, 1)) - 64) * 2 - 1), 2)) * 2
    Temp_Pos3 = Val(Mid(temp_data, ((Asc(Mid(cntrNo, 3, 1)) - 64) * 2 - 1), 2)) * 4
    Temp_Pos4 = Val(Mid(temp_data, ((Asc(Mid(cntrNo, 4, 1)) - 64) * 2 - 1), 2)) * 8
    
    Temp_Sum = Temp_Pos1 + Temp_Pos2 + Temp_Pos3 + Temp_Pos4 _
             + (Mid(cntrNo, 5, 1) * 16) + (Mid(cntrNo, 6, 1) * 32) + (Mid(cntrNo, 7, 1) * 64) _
             + (Mid(cntrNo, 8, 1) * 128) + (Mid(cntrNo, 9, 1) * 256) + (Mid(cntrNo, 10, 1) * 512)

    Temp_Mod = Temp_Sum Mod 11

    If Mid(cntrNo, 11, 1) = Right(Temp_Mod, 1) Or Chk_TCntr(cntrNo) = True Then
        CNTR_CheckDigit = True
    Else
        Response = MsgBox("��ȿ���� �ʴ� �����̳ʹ�ȣ�Դϴ�.����Ͻðڽ��ϱ�?", vbYesNo + vbCritical + vbDefaultButton1)
        
        If Response = vbYes Then CNTR_CheckDigit = True Else CNTR_CheckDigit = False
    End If
    Exit Function
    
ErrMsg:
    Response = MsgBox("��ȿ���� �ʴ� �����̳ʹ�ȣ�Դϴ�.����Ͻðڽ��ϱ�?", vbYesNo + vbCritical + vbDefaultButton1)
    
    If Response = vbYes Then CNTR_CheckDigit = True Else CNTR_CheckDigit = False
End Function

Public Function Chk_TCntr(cntrNo As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg
    SQL = "SELECT * FROM t_cntr"
    SQL = SQL & " WHERE cntr_no = '" & cntrNo & "'"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        Chk_TCntr = False
        Exit Function
    Else
        Chk_TCntr = True
    End If
    
    Rs.Close
    Set Rs = Nothing
    Exit Function
    
ErrMsg:
    
End Function

'PORT �Է½� �����ڵ� Return
Public Function Check_Port(PortCode As String) As String
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim Country(2) As String * 2
    Dim i As Integer
    
On Error GoTo ErrMsg
    SQL = "SELECT country_cd FROM t_port"
    SQL = SQL & " WHERE port_cd = '" & Trim(PortCode) & "'"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        Erase Country
        MsgBox "��ϵ��� ���� PORT�Դϴ�"
        Check_Port = ""
        Exit Function
    End If
    
    i = 0
    Rs.MoveFirst
    Do While Not Rs.EOF
        i = i + 1
        Country(i - 1) = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
        Rs.MoveNext
    Loop
    
    Rs.Close
    Set Rs = Nothing
    
    If i = 1 Then                     '�����ڵ尡 1���ϰ��
        Check_Port = Country(0)
    ElseIf i > 1 Then
        G_Msg = "�����ڵ尡 '" & Country(0) & "'�̸� 'Yes'��ư��," & vbCrLf & "�����ڵ尡 '" & Country(1) & "'�̸� 'No'��ư�� Ŭ���Ͻÿ�"
        G_Title = "�����ڵ弱��"
        G_Vboption = vbYesNo + vbQuestion + vbDefaultButton1
        G_Result = MsgBox(G_Msg, G_Vboption, G_Title)
        If G_Result = vbYes Then
            Check_Port = Country(0)
        Else
            Check_Port = Country(1)
        End If
    End If
    
    Erase Country
    
    Exit Function
    
ErrMsg:
    Erase Country
    Check_Port = ""
    MsgBox "�Լ�(Check_Port) Error(T_PORT)" & vbCrLf & Err.Description
End Function

'�ش�𼱿� ���� (�ش缱�翡 ����) �����̳ʹ�ȣ  Check ==>TABLE�Է� ���
Public Function Check_CNTR(ShipCode As String, CallNo As String, CallYear As String, OperCode As String, _
                           cntrNo As String, Table_Name As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg
    
    If ShipCode = "" Then
        MsgBox "���ڵ带 ���� �Է��Ͻÿ�"
        Check_CNTR = 2
        Exit Function
    End If

    If CallNo = "" Then
        MsgBox "������ ���� �Է��Ͻÿ�"
        Check_CNTR = 3
        Exit Function
    End If

    If CallYear = "" Then
        MsgBox "�⵵�� ���� �Է��Ͻÿ�"
        Check_CNTR = 4
        Exit Function
    End If

    SQL = "SELECT cntr_no FROM " & Table_Name & " "
    SQL = SQL & " WHERE ship_cd = '" & Trim(ShipCode) & "'"
    SQL = SQL & "   AND call_no =  " & Val(Trim(CallNo)) & " "
    SQL = SQL & "   AND call_yy =  " & Val(Trim(CallYear)) & " "
    
    If OperCode = " " Then
        SQL = SQL & " ORDER BY cntr_no"
    Else
        SQL = SQL & "   AND oper_cd = '" & Trim(OperCode) & "'"
        SQL = SQL & " ORDER BY cntr_no"
    End If
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        Check_CNTR = 1
    Else
        Check_CNTR = 0
    End If
    
    Rs.Close
    Set Rs = Nothing
    Exit Function
    
ErrMsg:
    Screen.MousePointer = 0
    Check_CNTR = -1
    MsgBox "�Լ�(Check_CNTR) Error" & vbCrLf & Err.Description
End Function

'Dup_no Max���ϱ�
Public Function Max_DupNo(cntrNo As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg
    
    SQL = "SELECT MAX(dup_no) FROM t_cntr"
    SQL = SQL & " WHERE cntr_no = '" & Trim(cntrNo) & "'"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        Max_DupNo = 0
    Else
        Max_DupNo = IIf(IsNull(Rs(0)), 0, Trim(Rs(0)))
    End If

    Rs.Close
    Set Rs = Nothing

    Exit Function
    
ErrMsg:
    Max_DupNo = -1
    MsgBox "�Լ�(Max_DupNo) Error(T_CNTR)" & vbCrLf & Err.Description
End Function

'�빮�ڷ� ��ȯ
Public Function Upper(KeyAsc As Integer) As Integer
    If KeyAsc > 96 And KeyAsc < 124 Then
        Upper = KeyAsc - 32
    Else
        Upper = KeyAsc
    End If

    If KeyAsc = 37 Or KeyAsc = 38 Or KeyAsc = 39 Then
        MsgBox "Ư������(  % , & , ' )�� ����� �� �����ϴ�"
        Upper = 0
    End If
End Function

'�������� �Է°���
Public Function Onum(KeyAsc As Integer) As Integer    'Onum ==> Only Num
    If (KeyAsc < 48 Or KeyAsc > 57) And KeyAsc <> 8 And KeyAsc <> 9 Then
        Onum = 0
    Else
        Onum = KeyAsc
    End If
End Function

'�����ڿ� ���ڸ� �Է°���(�ҹ���==>�빮��)
Public Function OnlyStrNum(KeyAsc As Integer) As Boolean
    If KeyAsc > 96 And KeyAsc < 124 Then            '�ҹ��� => �빮��
        KeyAsc = KeyAsc - 32:        OnlyStrNum = True
    ElseIf KeyAsc > 64 And KeyAsc < 92 Then         '�빮��
        OnlyStrNum = True
    ElseIf KeyAsc > 47 And KeyAsc < 58 Then         '����
        OnlyStrNum = True
    ElseIf KeyAsc = 8 Or KeyAsc = 9 Or KeyAsc = 42 Then        'BackSpace Key(8),  Tab Key(9),  * Key(42)
        OnlyStrNum = True
    Else
        KeyAsc = 0:        OnlyStrNum = False
    End If
End Function

'������'A','F' �� SPACE �׸��� ���ڸ� �Է°���(�ҹ���==>�빮��)
Public Function OnlyS_Bay(KeyAsc As Integer) As Boolean
    If KeyAsc = 96 Or KeyAsc = 101 Then            '�ҹ��� => �빮��
        KeyAsc = KeyAsc - 32:        OnlyS_Bay = True
    ElseIf KeyAsc = 64 Or KeyAsc = 69 Then         'A,F
        OnlyS_Bay = True
    ElseIf KeyAsc > 47 And KeyAsc < 58 Then         '����
        OnlyS_Bay = True
    ElseIf KeyAsc = 8 Or KeyAsc = 9 Or KeyAsc = 42 Or KeyAsc = 32 Then        'BackSpace Key(8),  Tab Key(9),  * Key(42). Space Key(32)
        OnlyS_Bay = True
    Else
        KeyAsc = 0:        OnlyS_Bay = False
    End If
End Function
'�����ڸ� �Է°���(�ҹ���==>�빮��)
Public Function OnlyStr(KeyAsc As Integer) As Boolean
    If KeyAsc > 96 And KeyAsc < 124 Then            '�ҹ��� => �빮��
        KeyAsc = KeyAsc - 32:        OnlyStr = True
    ElseIf KeyAsc > 64 And KeyAsc < 92 Then         '�빮��
        OnlyStr = True
    ElseIf KeyAsc = 8 Or KeyAsc = 9 Or KeyAsc = 42 Then           'BackSpace Key(8),  Tab Key(9),  * Key(42)
        OnlyStr = True
    Else
        KeyAsc = 0:        OnlyStr = False
    End If
End Function

'�������� �Է°���
Public Function OnlyNum(KeyAsc As Integer) As Boolean    'onlynum ==> Only Num
    If (KeyAsc < 48 Or KeyAsc > 57) And KeyAsc <> 8 And KeyAsc <> 9 Then
        KeyAsc = 0:             OnlyNum = False
    Else
        OnlyNum = True
    End If
End Function

'OnlyStrNum�Լ��� +,-�߰�
Public Function OnlyTemp(KeyAsc As Integer) As Boolean
    If KeyAsc > 96 And KeyAsc < 124 Then            '�ҹ��� => �빮��
        KeyAsc = KeyAsc - 32:        OnlyTemp = True
    ElseIf (KeyAsc > 64 And KeyAsc < 92) Or (KeyAsc > 47 And KeyAsc < 58) Then    '�빮��, ����
        OnlyTemp = True
    ElseIf KeyAsc = 8 Or KeyAsc = 9 Or KeyAsc = 43 Or KeyAsc = 45 Then            'BackSpace Key(8),  Tab Key(9), '+' Key, '-' Key
        OnlyTemp = True
    Else
        KeyAsc = 0:        OnlyTemp = False
    End If
End Function

'2001/05/30 CREATEDED BY SSW
'������, -�� �Է°���
Public Function OnlyTELNum(KeyAsc As Integer) As Boolean
    If (KeyAsc < 45 Or KeyAsc > 57) And KeyAsc <> 8 And KeyAsc <> 9 And KeyAsc <> 46 And KeyAsc <> 47 Then
        KeyAsc = 0:             OnlyTELNum = False:       MsgBox "���� �Ǵ� '-' �� �Է��Ͻÿ�"
    Else
        OnlyTELNum = True
    End If
End Function

'�������� ��(.)�� �Է°��� ==> ��(.)�� �ϳ��� �Է°���     (Float_Check�Լ��� �����ֽ�)
Public Function Pnum(KeyAsc As Integer, InsertValue As String) As Integer   'Pnum ==> Ponint And Num
    If (KeyAsc < 48 Or KeyAsc > 57) And KeyAsc <> 8 And KeyAsc <> 9 And KeyAsc <> 13 And KeyAsc <> 27 And KeyAsc <> 46 Then
        Pnum = 0
    Else
        If KeyAsc = 46 Then
            If InStr(InsertValue, ".") = 0 Then
                Pnum = KeyAsc
            Else
                Pnum = 0
            End If
        Else
            Pnum = KeyAsc
        End If
    End If
End Function

Public Function Float_Check(TempText As TextBox, KeyAsc As Integer, tempStr As String, IntPart As Integer, _
                            FloatPart As Integer, CusPos As Integer) As Integer
    Dim TotLen As Integer
    Dim PnumReturn As Integer
    Dim TextLen As Integer
    Dim DotPos As Integer

    TotLen = Len(tempStr)
    PnumReturn = Pnum(KeyAsc, tempStr)
    DotPos = InStr(tempStr, ".")
    
    If IntPart <= 0 Then
        MsgBox "�����κ��� 1�̻��� ������ �����Ͻÿ�"
        Float_Check = -1
        Exit Function
    End If
    
    If FloatPart <= 0 Then
        MsgBox "�Ҽ��κ��� 1�̻��� ������ �����Ͻÿ�"
        Float_Check = -1
        Exit Function
    End If
    
    If TotLen <> 0 And TempText.Text = TempText.SelText Then
        If KeyAsc = 46 Or KeyAsc = 48 Then                      '�Է¹��� ���� ��(.)�� ��
            KeyAsc = 0:    tempStr = "0.":    CusPos = 2:     Float_Check = 1
        ElseIf KeyAsc > 48 And KeyAsc <= 57 Then                '1~9�� ��
            If IntPart = 1 Then                                          '�����κ��� 1�ڸ��̸�
                KeyAsc = 0:     tempStr = Chr(PnumReturn) & ".":     CusPos = 2:      Float_Check = 1
            Else                                                          '�����κ��� 1�ڸ� �̻��̸�
                KeyAsc = PnumReturn:      Float_Check = 0
            End If
        ElseIf KeyAsc = 8 Then                                   'BackSpace Key�� ��
            KeyAsc = PnumReturn:      tempStr = "":      CusPos = 0:       Float_Check = 1
        Else                                                     '��Ÿ
            KeyAsc = 0:     Float_Check = 0
        End If
        
        Exit Function
    End If
    
    If TotLen = 0 Then   'ù��° �ڸ��� ��
        If IntPart = 1 Then              '�����κ��� 1�ڸ��� ���
            If PnumReturn = 46 Then                          '�Ҽ����� ��
                KeyAsc = 0:     tempStr = "0.":      CusPos = 2:       Float_Check = 1
            ElseIf KeyAsc >= 48 And KeyAsc <= 57 Then        ' 0~9�� ��
                KeyAsc = 0:     tempStr = Chr(PnumReturn) & ".":       CusPos = 2:      Float_Check = 1
            Else                                             '��Ÿ
                KeyAsc = PnumReturn:      Float_Check = 0
            End If
        Else                             '�����κ��� 1�ڸ� �̻��� ���
            If PnumReturn = 46 Or PnumReturn = 48 Then       '�Ҽ����� ���� 0�� ��
                KeyAsc = 0:     tempStr = "0.":      CusPos = 2:       Float_Check = 1
            Else                                             '
                KeyAsc = PnumReturn:      Float_Check = 0
            End If
        End If
    Else                 'ù��° �ڸ��� �ƴ� ��
        If DotPos = 0 Then               '���� ���� ��(.)�� ������
            If TotLen < IntPart - 1 Then
                KeyAsc = PnumReturn:      Float_Check = 0
            ElseIf TotLen = IntPart - 1 Then
                If PnumReturn = 46 Then
                    KeyAsc = 0:     tempStr = Trim(tempStr & Chr(PnumReturn))
                    CusPos = IntPart:     Float_Check = 1
                ElseIf PnumReturn = 8 Then
                    KeyAsc = PnumReturn:      Float_Check = 0
                ElseIf PnumReturn = 9 Then
                    KeyAsc = PnumReturn:      Float_Check = 0
                Else
                    KeyAsc = 46:    tempStr = Trim(tempStr & Chr(PnumReturn))
                    CusPos = IntPart:      Float_Check = 1
                End If
            Else
                If CusPos <= IntPart And (TotLen - CusPos) <= FloatPart Then
                    If PnumReturn = 46 Then
                        KeyAsc = 0
                        tempStr = Mid(tempStr, 1, CusPos) & "." & Mid(tempStr, CusPos + 1, TotLen - CusPos + 1)
                        CusPos = CusPos + 1:      Float_Check = 1
                    ElseIf PnumReturn = 8 Then
                        KeyAsc = PnumReturn:      Float_Check = 0
                    Else
                        KeyAsc = 0:      Float_Check = 0
                    End If
                Else
                    KeyAsc = 0:     Float_Check = 0
                End If
            End If
        Else                            '���� ���� ��(.)�� ���� ��
            If CusPos < DotPos Then
                If Len(Mid(tempStr, 1, DotPos - 1)) < IntPart Then
                    KeyAsc = PnumReturn:       Float_Check = 0
                Else
                    If PnumReturn = 8 Then
                        KeyAsc = PnumReturn:       Float_Check = 0
                    Else
                        KeyAsc = 0:      Float_Check = 0
                    End If
                End If
            Else
                If (TotLen - DotPos) >= 0 And (TotLen - DotPos) < FloatPart - 1 Then
                    KeyAsc = PnumReturn:      Float_Check = 0
                ElseIf (TotLen - DotPos) = FloatPart - 1 Then
                    If PnumReturn = 8 Then
                        KeyAsc = PnumReturn:       Float_Check = 0
                    Else
                        KeyAsc = PnumReturn:       Float_Check = 9
                    End If
                Else
                    If PnumReturn = 8 Then
                        KeyAsc = PnumReturn:       Float_Check = 0
                    Else
                        KeyAsc = 0:                Float_Check = 0
                    End If
                End If
            End If
        End If
    End If
End Function
'2001/02/06  ������
Function Check_OperCD(Oper_Code As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg
    If Oper_Code = "" Then
        MsgBox "���縦 �Է��Ͻÿ�"
        Check_OperCD = False
        Exit Function
    End If
    
    SQL = "SELECT oper_cd FROM t_oper "
    SQL = SQL & " WHERE oper_cd = '" & Trim(Oper_Code) & "'"
        
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        MsgBox "��ϵ� ���簡 �ƴմϴ�.���縦 Ȯ���ϼ���"
        Check_OperCD = False
    Else
        Check_OperCD = True
    End If
    
    Rs.Close
    Set Rs = Nothing
    
    Exit Function
 
ErrMsg:
    Check_OperCD = False
    MsgBox "�Լ�(Oper_Chk) Error(T_OPER)" & vbCrLf & Err.Description
End Function

Public Function Check_Wkcd_Des(IO_Code As String, WK_Code As String) As String
    If WK_Code = "" Then
        Check_Wkcd_Des = "":        Exit Function
    End If
    
    Select Case WK_Code
        Case "R"
            If IO_Code = "X" Then
                Check_Wkcd_Des = "������ġ"
            ElseIf IO_Code = "M" Then
                Check_Wkcd_Des = "�µ���ġ"
            End If
        Case "D"
            If IO_Code = "I" Or IO_Code = "X" Then
                Check_Wkcd_Des = "�������"
            ElseIf IO_Code = "M" Then
                Check_Wkcd_Des = "�µ�����"
            End If
        Case "U"
            Check_Wkcd_Des = "������ġ"
        Case "L"
            Check_Wkcd_Des = "���ϻ���"
        Case "S"
            Check_Wkcd_Des = "Shift����"
        Case "T"
            Check_Wkcd_Des = "Shift��ġ"
        Case "G"
            Check_Wkcd_Des = "Moving"
        Case "M"
            Check_Wkcd_Des = "MainTenance"
        Case "F"
            Check_Wkcd_Des = "Failure"
        Case "W"
            Check_Wkcd_Des = "Waiting"
        Case "B"
            Check_Wkcd_Des = "������������"
        Case "E"
            Check_Wkcd_Des = "����������ġ"
    End Select
End Function

Public Sub Sps_Option(spsList As vaSpread, Opt As Integer)
    With spsList
        .Row = .RowsFrozen + 1
        .Col = .ColsFrozen + 1
        .Row2 = .MaxRows
        .Col2 = .MaxCols
        
        .BlockMode = True
        
        If Opt = 1 Then       'Init
            .BlockMode = False:                .UserResize = UserResizeNone
            .SelBackColor = &H8000000D:        .SelForeColor = &HFFFFFF
        ElseIf Opt = 2 Then   'Clear ==> Data
            .Action = 12:                      .BlockMode = False
        ElseIf Opt = 3 Then   'Lock ==> �ԷºҰ���
            .Lock = True:                      .BlockMode = False
        ElseIf Opt = 4 Then   'Unlock ==> �Է°���
            .Lock = False:                     .BlockMode = False
        ElseIf Opt = 7 Then   'Cell Color����
            .BlockMode = False:                .SelBackColor = &HFFFFFF
            .SelForeColor = &H0&
        ElseIf Opt = 8 Then   '(Init���� + Clear + Lock)
            .Action = 12:                      .Lock = True
            .BlockMode = False:                .UserResize = UserResizeNone
            .SelBackColor = &HFFFFFF:           .SelForeColor = &H0&
        ElseIf Opt = 9 Then   'All(Init + Clear + Lock)  ==>  Form Load�� ����ϼſ�~
            .Action = 12:                      .Lock = True
            .BlockMode = False:                .UserResize = UserResizeNone
            .SelBackColor = &H8000000D:        .SelForeColor = &HFFFFFF
        ElseIf Opt = 28 Then
            .Action = 3:                      .BlockMode = False
        End If
    End With
End Sub

Public Sub Sps_Sort(spsList As vaSpread, SpsCol As Long, AscDsc As Boolean)
    With spsList
        .Row = .RowsFrozen + 1
        .Col = .ColsFrozen + 1
        .Row2 = .MaxRows
        .Col2 = .MaxCols
        .SortBy = 0                         '0:ROW 1:COLUMN SORT
        .SortKey(1) = SpsCol                '��Ʈ1����(����������1��°��02)
        If AscDsc = False Then
            .SortKeyOrder(1) = 1          '0:NONE 1:�������� 2:��������
            AscDsc = True
        ElseIf AscDsc = True Then
            .SortKeyOrder(1) = 2           '0:NONE 1:�������� 2:��������
            AscDsc = False
        End If
        '        .SortKey(2) = 1                    '��Ʈ2����
        '        .SortKeyOrder(2) = 1               '0:NONE 1:�������� 2:��������
        .Action = 25                        '��Ʈ������ȣ
    End With
End Sub

Public Sub SetSpsSort(spsList As vaSpread, SpsCol As Long, AscDsc As Boolean)
    With spsList
        .Row = 1
        .Col = 1
        .Row2 = .MaxRows
        .Col2 = .MaxCols
        .SortBy = 0                         '0:ROW 1:COLUMN SORT
        .SortKey(1) = SpsCol                '��Ʈ1����(����������1��°��02)
        If AscDsc = False Then
            .SortKeyOrder(1) = 1          '0:NONE 1:�������� 2:��������
            AscDsc = True
        ElseIf AscDsc = True Then
            .SortKeyOrder(1) = 2           '0:NONE 1:�������� 2:��������
            AscDsc = False
        End If
        '        .SortKey(2) = 1                    '��Ʈ2����
        '        .SortKeyOrder(2) = 1               '0:NONE 1:�������� 2:��������
        .Action = 25                        '��Ʈ������ȣ
    End With
End Sub

'Spread�� ����BAR Display
Public Sub Sps_Bar(spsList As vaSpread, ncol As Long, nrow As Long, gubun As String)
    With spsList
        .ReDraw = False
        .Row = nrow: .Col = ncol
        .Row2 = nrow: .Col2 = .MaxCols
        
        If gubun = "D" Then
            .BlockMode = True
            .BackColor = &HFFFFFF
            .ForeColor = &H0&
            .BackColorStyle = BackColorStyleUnderGrid
            .BlockMode = False
        ElseIf gubun = "I" Then
            .BlockMode = True
            .BackColor = &H8000000D
            .ForeColor = &HFFFFFF
            .BackColorStyle = BackColorStyleUnderGrid
            .BlockMode = False
        End If
        .ReDraw = True
    End With
End Sub
'2001/02/28   ��õ��
Public Function Chk_PassDay(txtCntr_no As String, txtDup_no As String, return_day As Integer) As Integer
    Dim chkOper As String
    Dim chkDate As String
    Dim chkix As String
    Dim chkHM As Integer
    Dim chkfree As Integer
    Dim chkfrom As String
    Dim chkTo As String
    Dim Over_Day As Integer
    Dim chk_CValue As String
    Dim chk_FValue As String

On Error GoTo ErrPassDay
        
    chk_CValue = Chk_CNTR(txtCntr_no, txtDup_no, chkOper, chkDate, chkix, chkHM, chkfrom, chkTo)
    
    If chk_CValue = -1 Then
        Chk_PassDay = -1
        Exit Function
    ElseIf chk_CValue = 0 Then
        MsgBox "t_cntr�� �ڷᰡ �����ϴ�"
        Chk_PassDay = -1
        Exit Function
    ElseIf chk_CValue = 2 Then
        MsgBox "t_vescall �� �ڷᰡ �����ϴ�"
        Chk_PassDay = -1
        Exit Function
    End If
    
    chk_FValue = Chk_FreeDay(chkOper, chkix, chkHM, chkDate, chkfree)           '**������ġ�ϼ�
    
    If chk_FValue = -1 Then
        Chk_PassDay = -1
        Exit Function
    ElseIf chk_FValue = 0 Then
        MsgBox "t_freeday �� �ڷᰡ �����ϴ�"
        Chk_PassDay = -1
        Exit Function
    End If
    
    If Chk_Imnday(chkfrom, chkTo, Over_Day) = -1 Then                                       '**������� ������
        Chk_PassDay = -1
        Exit Function
    End If
    
    If Chk_Return(chkfrom, chkTo, chkfree, chkix, Over_Day, return_day) = -1 Then  '** ���� ������
        Chk_PassDay = -1
       Exit Function
    End If
    
'    Text4 = return_day                                                                                     '** RETURN_DAY ������
        
    Chk_PassDay = 1
    Exit Function
ErrPassDay:
    Screen.MousePointer = 0
    Chk_PassDay = -1
    MsgBox "chk_PassDay Error" & vbCrLf & Err.Description
End Function

Public Function Chk_CNTR(Cntr As String, Dup As String, chkOper As String, chkDate As String, _
                                     chkix As String, chkHM As Integer, chkfrom As String, chkTo As String)
    Dim Rs As ADODB.Recordset               '* t_cntr, t_vescall���� t_freeday�ڷ� ȹ��
    Dim SQL As String
    Dim imsiShip_cd As String
    Dim imsiCall_yy As Integer
    Dim imsiCall_no As Integer
    Dim imsiCur_stat As String
    Dim imsiBond_id As String
    Dim imsiTs_id As String
    Dim imsiOper_cd As String
    Dim imsiGin_dt As String
    Dim imsiGout_dt As String
    Dim imsiAtb_dt As String
    Dim imsiStv_end_dt As String
    
On Error GoTo Errcntr

    SQL = "select nvl(cur_stat, ' '),nvl(bond_id, ' '),nvl(ts_id, ' '),nvl(ship_cd, ' '),nvl(call_yy, 0),nvl(call_no, 0),nvl(oper_cd, ' '),"
    SQL = SQL & " nvl(to_char(gin_dt, 'yyyymmddhh24miss'), ' '),nvl(to_char(gout_dt, 'yyyymmddhh24miss'), ' ') from  t_cntr"
    SQL = SQL & " where cntr_no = '" & Cntr & "'"
    SQL = SQL & " and dup_no = '" & Dup & "'"
    SQL = SQL & " and cur_stat like '%D'"
  
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        Chk_CNTR = 0
        Exit Function
    End If
    
    imsiCur_stat = Mid(Rs(0).value, 1, 1)
    imsiBond_id = Trim(Rs(1).value)
    imsiTs_id = Trim(Rs(2).value)
    imsiShip_cd = Trim(Rs(3).value)
    imsiCall_yy = Trim(Rs(4).value)
    imsiCall_no = Trim(Rs(5).value)
    imsiOper_cd = Trim(Rs(6).value)
    imsiGin_dt = Trim(Rs(7).value)
    imsiGout_dt = Trim(Rs(8).value)

    SQL = "select  nvl(to_char(atb_dt, 'yyyymmddhh24miss'), ' '), "
    SQL = SQL & " nvl(to_char(stv_end_dt, 'yyyymmddhh24miss'), ' ') "
    SQL = SQL & " from  t_vescall "
    SQL = SQL & " where ship_cd = '" & imsiShip_cd & "' "
    SQL = SQL & " and call_yy = '" & imsiCall_yy & "'  "
    SQL = SQL & " and call_no = '" & imsiCall_no & "'  "
  
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        Chk_CNTR = 2
        Exit Function
    End If

    imsiAtb_dt = Trim(Rs(0).value)
    imsiStv_end_dt = Trim(Rs(1).value)
    
    If imsiCur_stat = "X" Then                                       '*return ��
        chkDate = imsiAtb_dt
        chkfrom = imsiGin_dt
        chkTo = imsiAtb_dt
    Else
        chkDate = imsiStv_end_dt
        chkfrom = imsiStv_end_dt
        chkTo = imsiGout_dt
    End If
    chkOper = imsiOper_cd                                           '*return ��
    chkix = imsiCur_stat                                             '*return ��
    
    If imsiBond_id = "" And imsiTs_id = "" Then               '*return ��
        chkHM = 1
    ElseIf imsiBond_id = "B" Then
        chkHM = 2
    ElseIf imsiBond_id = "C" Then
        chkHM = 3
    ElseIf imsiTs_id = "1" Or imsiTs_id = "2" Then
        chkHM = 4
    End If
    
    Chk_CNTR = 1
    
    Rs.Close
    Set Rs = Nothing
    Exit Function
Errcntr:
    Screen.MousePointer = 0
    Chk_CNTR = -1
    MsgBox "chk_cntr Error" & vbCrLf & Err.Description
End Function

Public Function Chk_FreeDay(Oper As String, iX As String, hm As Integer, date_1 As String, _
                                          chkfree As Integer)
    Dim Rs As ADODB.Recordset        '* �����̸� atb_dt, �����̸� stv_end_dt��
    Dim SQL As String                          '* ���Ͽ�(date_1) t_freeday���� ������ ���Ͽ�
                                                       '* free_dy ������ġ �ϼ��� ���Ѵ�.
On Error GoTo Errfreeday

    date_1 = Mid(date_1, 1, 8)
   
    SQL = " select nvl(free_day, 0)"
    SQL = SQL & " from t_freeday"
    SQL = SQL & " where bgn_dt = (select max(nvl(to_char(bgn_dt, 'yyyymmdd'), ' '))"
    SQL = SQL & " from t_freeday"
    SQL = SQL & " where oper_cd = '" & Oper & "' "
    SQL = SQL & " and ix_cd ='" & iX & "'  "
    SQL = SQL & " and cargo_cd ='" & hm & "'  "
    SQL = SQL & " and bgn_dt < to_date('" & date_1 & "', 'yyyymmdd')) "   '******
    SQL = SQL & " and oper_cd = '" & Oper & "' "
    SQL = SQL & " and ix_cd = '" & iX & "'  "
    SQL = SQL & " and cargo_cd = '" & hm & "'  "

    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        Chk_FreeDay = 0
        Exit Function
    End If
    
    chkfree = Trim(Rs(0).value)
    
    Chk_FreeDay = 1
    
    Rs.Close
    Set Rs = Nothing
    Exit Function
    
Errfreeday:
    Screen.MousePointer = 0
    Chk_FreeDay = -1
    MsgBox "Chk_FreeDay Error" & vbCrLf & Err.Description
End Function

 Public Function Chk_Imnday(In_date As String, Out_date As String, Over_Day As Integer)
    Dim Rs As ADODB.Recordset               '* �ð��� ���Ͽ� �������� ���Ѵ�.(t_imnday)
    Dim SQL As String                                 '* ������ gin_dt���� atb_dt����
    Dim ChkImnDay As String                     '* ������ stv_end_dt���� gout_dt���� �����Ѵ�.
    Dim imIndate As String
    Dim imOutdate As String

On Error GoTo ErrImnDay
    
    SQL = "select nvl(to_char(imn_dt, 'yyyymmddhh24miss'), ' ') "
    SQL = SQL & "   from t_imnday"
    SQL = SQL & " order by imn_dt desc "

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        MsgBox "t_imnday�� �ڷᰡ �����ϴ�"
         
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If

    Do While Not Rs.EOF
        ChkImnDay = Mid(Rs.Fields(0).value, 1, 8)
        imIndate = Mid(In_date, 1, 8)
        imOutdate = Mid(Out_date, 1, 8)
        If ChkImnDay < imIndate Then
            Exit Do
        ElseIf ChkImnDay > imOutdate Then
        ElseIf imIndate <= ChkImnDay And ChkImnDay <= imOutdate Then
            Over_Day = Over_Day + 1
        End If

        Rs.MoveNext
    Loop
    
    Rs.Close
    Set Rs = Nothing
    Chk_Imnday = 1
    
    Exit Function
ErrImnDay:
    Screen.MousePointer = 0
    Chk_Imnday = -1
    MsgBox "chk_Imnday Error" & vbCrLf & Err.Description
End Function

Public Function Chk_Return(chkfrom As String, chkTo As String, chkfree As Integer, _
                                                chkix As String, Over_Day As Integer, return_day As Integer)
    Dim newFdate As Date                        '*�� �Լ����� �����߿��� in, out �ð��� ���Ͽ�
    Dim newTdate As Date                        '*������ ���Ҽ� �ִ� �ϼ�(return_day)�� ���Ѵ�.
    Dim number As Integer
    Dim fDate As String
    Dim Tdate As String
    Dim nu As Integer
    Dim imsiFdate As String
    Dim imsiTdate As String

On Error GoTo ErrReturn
    If chkix = "X" Then
        fDate = Mid(chkfrom, 1, 4) & "/" & Mid(chkfrom, 5, 2) & "/" & Mid(chkfrom, 7, 2)
        Tdate = Mid(chkTo, 1, 4) & "/" & Mid(chkTo, 5, 2) & "/" & Mid(chkTo, 7, 2)
        newFdate = fDate
        newTdate = Tdate
                number = chkfree + Over_Day
        imsiFdate = Format(newTdate - number, "yyyymmdd")
        imsiTdate = Format(newFdate, "yyyymmdd")
        
        If imsiTdate >= imsiFdate Then
            return_day = 0
        Else
            return_day = newTdate - newFdate - number
        End If
    ElseIf chkix = "I" Then
        fDate = Mid(chkfrom, 1, 4) & "/" & Mid(chkfrom, 5, 2) & "/" & Mid(chkfrom, 7, 2)
        Tdate = Mid(chkTo, 1, 4) & "/" & Mid(chkTo, 5, 2) & "/" & Mid(chkTo, 7, 2)
        newFdate = fDate
        newTdate = Tdate
        If Mid(chkTo, 9, 6) < "080000" Then
            nu = 0
        Else
            nu = 1
        End If

        number = chkfree + nu + Over_Day
        imsiFdate = Format(newFdate + number, "yyyymmdd")
        imsiTdate = Format(newTdate, "yyyymmdd")
        
        If imsiTdate <= imsiFdate Then
            return_day = 0
        Else
            return_day = newTdate - newFdate - number
        End If
    End If
    
    Chk_Return = 1
    Exit Function
ErrReturn:
    Screen.MousePointer = 0
    Chk_Return = -1
    MsgBox "chk_Return Error" & vbCrLf & Err.Description
End Function

'����� 2001/03/07
'  2001/04/09   �����κ� �߰�

'  �ش������̳��� over�ϼ��� ������
'    ���� : Over_ilsu(��������(return��), �۾�����(return��))
'            �۾����� : 1:����, 2:����,3:�ںε�t/s,4:Ÿ�ε�t/s,5:�ݼ�, 6:����, 7:�ε����
'
''    ���� : Over_ilsu(�����̳ʹ�ȣ, DUP NO., ��������+freeday�ϼ�(return��))
'  ��ȯ�� : over�ϼ�
Public Function over_ilsu(Cntr_no As String, FM_CD As String, CurStat As String, Ts_ID As String, Oper_Cd As String, Bond_ID As String, _
                          Rtn_CD As String, Gin_dt As String, Gout_dt As String, Stv_End_DT As String, _
                          Ata_dt As String, Ex_Ship_Call As String, Rtn_Date As String, work_cd As String) As Integer
                              '����DT�� �������̶� 'YYYY/MM/DD HH:MM:SS'�������� �μ��� �Ѱܾ��Ѵ�...
    
    Dim Start_dt As Date
    Dim End_dt As Date
    
    Dim free_ilsu  As Integer
    Dim ilsu  As Integer
    Dim Over_Day As Integer
    
    Dim good_cd  As String
    Dim ix_cd  As String
    
''    If cntr_no = "TRIU0603584" Then
''    MsgBox ("OK")
''    End If

    
    ix_cd = Mid(CurStat, 1, 1)
    
    If ix_cd = "I" Then   '  ����
        If Trim(Ts_ID) = "" Then           ' �Ϲ�
            If Trim(Bond_ID) = "" Then                           ' �Ϲ�
                work_cd = "1":                good_cd = "1"
            ElseIf Trim(Bond_ID) = "B" Then                     ' ����
                If FM_CD = "F" Then
                    work_cd = "6":                good_cd = "2"
                Else
                    work_cd = "1":                good_cd = "1"
                End If
                
            ElseIf Trim(Bond_ID) = "C" Then                     ' �ε����
                work_cd = "7":                good_cd = "3"
            Else
                over_ilsu = -1:               Exit Function
            End If
            Start_dt = CDate(IIf(Stv_End_DT = "", "1000/01/01 00:00:00", Trim(Stv_End_DT)))
            End_dt = CDate(IIf(Gout_dt = "", "1000/01/01 00:00:00", Trim(Gout_dt)))
        ElseIf Trim(Ts_ID) = "1" Then      ' �ںε�t/s
            If Trim(Bond_ID) = "" Then                          ' �Ϲ�
                work_cd = "3"
                good_cd = "5"
            ElseIf Trim(Bond_ID) = "B" Then   ' ����
                work_cd = "6"
                good_cd = "2"
            ElseIf Trim(Bond_ID) = "C" Then   ' �ε����
                work_cd = "7"
                good_cd = "3"
            End If
'            work_cd = "3":                good_cd = "5"
            Start_dt = CDate(IIf(Stv_End_DT = "", "1000/01/01 00:00:00", Trim(Stv_End_DT)))
            End_dt = CDate(IIf(Gout_dt = "", "1000/01/01 00:00:00", Trim(Gout_dt)))
        Else                               ' Ÿ�ε�t/s
            If Trim(Bond_ID) = "" Then                          ' �Ϲ�
                work_cd = "4"
                good_cd = "5"
            ElseIf Trim(Bond_ID) = "B" Then                          ' ����
                work_cd = "4"
                good_cd = "5"
'''            ElseIf Trim(Bond_ID) = "B" Then   ' ����
'''                work_cd = "6"
'''                good_cd = "2"
            ElseIf Trim(Bond_ID) = "C" Then   ' �ε����
                work_cd = "7"
                good_cd = "3"
            End If
            Start_dt = CDate(IIf(Stv_End_DT = "", "1000/01/01 00:00:00", Trim(Stv_End_DT)))
            End_dt = CDate(IIf(Gout_dt = "", "1000/01/01 00:00:00", Trim(Gout_dt)))
'        Else                               ' Ÿ�ε�t/s�� �������� ����
'            over_ilsu = -1:               Exit Function
        End If
        
        If Format(Start_dt, "HHMM") >= "0800" Then
            Start_dt = Start_dt + 1
        End If
        Start_dt = CDate(Format(Start_dt, "YYYY/MM/DD") + " 08:00:00")
        
    ElseIf ix_cd = "X" Then   ' ����
        If Trim(Ts_ID) = "" Then
            If Trim(Rtn_CD) = "R" Then   '  �ݼ�
                'If Trim(Bond_ID) = "" Then
                    work_cd = "5":                    good_cd = "6"
                'ElseIf Trim(Bond_ID) = "B" Then   '  ����
                '    work_cd = "6":                    good_cd = "2"
                'ElseIf Trim(Bond_ID) = "C" Then   ' �ε����
                '    work_cd = "7":                    good_cd = "3"
                'Else
                '    over_ilsu = -1:               Exit Function
                'End If
                Start_dt = CDate(IIf(Gin_dt = "", "1000/01/01 00:00:00", Trim(Gin_dt)))
                Start_dt = CDate(Format(Start_dt, "YYYY/MM/DD") + " 00:00:00")
                End_dt = CDate(IIf(Gout_dt = "", "1000/01/01 00:00:00", Trim(Gout_dt)))
                End_dt = CDate(Format(End_dt, "YYYY/MM/DD") + " 00:00:00")
            Else                       '  �Ϲ�
                If Trim(Bond_ID) = "" Then
                    work_cd = "2":                    good_cd = "1"
                ElseIf Trim(Bond_ID) = "B" Then   '  ����
                    work_cd = "6":                    good_cd = "2"
                ElseIf Trim(Bond_ID) = "C" Then   ' �ε����
                    work_cd = "7":                    good_cd = "3"
                Else
                    over_ilsu = -1:               Exit Function
                End If
                Start_dt = CDate(IIf(Gin_dt = "", "1000/01/01 00:00:00", Trim(Gin_dt)))
                End_dt = CDate(IIf(Ata_dt = "", "1000/01/01 00:00:00", Trim(Ata_dt)))
                
                End_dt = CDate(Format(End_dt, "YYYY/MM/DD") + " 00:00:00")
            End If
        ElseIf Trim(Ts_ID) = "1" Then  '  �ںε�t/s
            work_cd = "3":                good_cd = "4"
            If Len(Ex_Ship_Call) > 8 Then
                If ship_date(Mid(Ex_Ship_Call, 1, 4), Mid(Ex_Ship_Call, 5, 4), Mid(Ex_Ship_Call, 9), Start_dt, End_dt) = -1 Then
'                        MsgBox "���� �������� Ʋ���ϴ� - " & Cntr_no
                    over_ilsu = -1:                    Exit Function
                End If
            Else
'                    MsgBox "���� �������� �����ϴ� - " & Cntr_no
                over_ilsu = -1:                    Exit Function
            End If
            Start_dt = End_dt
            If Format(Start_dt, "HHMM") >= "0800" Then
                Start_dt = Start_dt + 1
            End If
            Start_dt = CDate(Format(Start_dt, "YYYY/MM/DD") + " 08:00:00")
            End_dt = CDate(IIf(Ata_dt = "", "1000/01/01 00:00:00", Trim(Ata_dt)))
            End_dt = CDate(Format(End_dt, "YYYY/MM/DD") + " 00:00:00")
        ElseIf Trim(Ts_ID) = "2" Then   '  Ÿ�ε�t/s
        
            If Trim(Rtn_CD) = "R" Then   '  �ݼ�
                work_cd = "5":                    good_cd = "6"
                Start_dt = CDate(IIf(Gin_dt = "", "1000/01/01 00:00:00", Trim(Gin_dt)))
                Start_dt = CDate(Format(Start_dt, "YYYY/MM/DD") + " 00:00:00")
                End_dt = CDate(IIf(Gout_dt = "", "1000/01/01 00:00:00", Trim(Gout_dt)))
                End_dt = CDate(Format(End_dt, "YYYY/MM/DD") + " 00:00:00")
            Else
                work_cd = "4":                good_cd = "5"
                Start_dt = CDate(IIf(Gin_dt = "", "1000/01/01 00:00:00", Trim(Gin_dt)))
                End_dt = CDate(IIf(Ata_dt = "", "1000/01/01 00:00:00", Trim(Ata_dt)))
                End_dt = CDate(Format(End_dt, "YYYY/MM/DD") + " 00:00:00")
            End If
        Else
            over_ilsu = -1:                    Exit Function
        End If
    ElseIf ix_cd = "S" Then   ' SHIFT
        over_ilsu = 0:                    Exit Function
    ElseIf ix_cd = "M" Then   ' ONDOCK ����
        ' ODEM �� CHECK ����
        If Oper_Cd = "EMC" Or Oper_Cd = "HML" Or Oper_Cd = "UGL" Or Oper_Cd = "LTX" Or Oper_Cd = "ITS" Or Oper_Cd = "EGH" Or Oper_Cd = "EMS" Or Oper_Cd = "WHL" Or Oper_Cd = "IAL" Then
            over_ilsu = 0:                    Exit Function
        End If
        work_cd = "9"
        good_cd = "9"
        
        Start_dt = CDate(IIf(Gin_dt = "", "1000/01/01 00:00:00", Trim(Gin_dt)))
        Start_dt = CDate(Format(Start_dt, "YYYY/MM/DD") + " 00:00:00")
        End_dt = CDate(IIf(Gout_dt = "", "1000/01/01 00:00:00", Trim(Gout_dt)))
        End_dt = CDate(Format(End_dt, "YYYY/MM/DD") + " 00:00:00")
        
    End If

    
    If Format(Start_dt, "YYYY-MM-DD") = "1000-01-01" Then
'        MsgBox "�Լ�(Over_ilsu) Error(T_vercall)" & vbCrLf & "�����Ͻð� �����ϴ� - " & Cntr_no
        over_ilsu = -1:                    Exit Function
    End If
    
    If Format(End_dt, "YYYY-MM-DD") = "1000-01-01" Then
'        MsgBox "�Լ�(Over_ilsu) Error(T_vercall)" & vbCrLf & "�����Ͻð� �����ϴ� - " & Cntr_no
        over_ilsu = -1:                    Exit Function
    End If
    
'''    If good_cd = "" Then
'''        over_ilsu = 0
'''    End If
    
    
    free_ilsu = FreeDay_ilsu(Start_dt, ix_cd, good_cd, Oper_Cd)
    If free_ilsu < 0 Then
        over_ilsu = -1:                    Exit Function
    End If
    
    ilsu = imn_ilsu(Start_dt, End_dt)
    If ilsu < 0 Then
        over_ilsu = -1:                    Exit Function
    End If
    
    If ix_cd = "X" Then
        Rtn_Date = Format(Start_dt + free_ilsu + ilsu, "yyyy-mm-dd") & " 00:00:00"
    Else
        Rtn_Date = Format(Start_dt + free_ilsu + ilsu, "yyyy-mm-dd hh:mm:ss")
    End If
'    rtn_date = Format(start_dt + free_ilsu + ilsu, "yyyy-mm-dd hh:mm:ss") + "+" + Format(free_ilsu + ilsu, "00")
    Over_Day = Round((End_dt - Start_dt) - free_ilsu - ilsu + 0.501)
    
    If Over_Day <= 0 Then
       over_ilsu = 0
    Else
       over_ilsu = Over_Day
'       FreeDay_Cntr = Over_Day + 1
    End If
'''    Rtn_Date = Format(start_dt + free_ilsu + ilsu, "yyyy-mm-dd hh:mm:ss")
'''
'''    Over_Day = Int((end_dt - start_dt) - free_ilsu - ilsu)
'''
'''    If Over_Day <= 0 Then
'''       over_ilsu = 0
'''    Else
'''       over_ilsu = Over_Day + 1
'''    End If
    
    Exit Function

ErrMsg:
    over_ilsu = -1
    MsgBox "�Լ�(Over_ilsu) Error" & vbCrLf & Err.Description
End Function
' DB Get_FTOver �Լ� �̿�
Public Function OverDay_UseGetFTover(Cntr_no As String, Dup_no As String, Cur_Stat As String, Oper_Cd As String, _
                                                        Gout_dt As String, Gin_dt As String, Bond_ID As String, _
                                                        Ts_ID As String, Rtn_CD As String, Gc_ldt As String)
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim Strt_dt As Date, End_dt As Date
    
On Error GoTo ErrMsg
    
    SQL = " select ship_cd, call_yy, call_no from t_cntr where cntr_no='" & Cntr_no & "' and dup_no =" & Dup_no
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then Rs.Close: Set Rs = Nothing: OverDay_UseGetFTover = 0: Exit Function
    
    Call ship_date(Rs!ship_cd, Rs!call_yy, Rs!call_no, Strt_dt, End_dt)
    Rs.Close
    
    
    SQL = "select get_ftover("
    SQL = SQL & "'" & Cntr_no & "','" & Dup_no & "','" & Cur_Stat & "','"
    SQL = SQL & Oper_Cd & "',"
    
    SQL = SQL & IIf(Gout_dt = "", "null", "to_date('" & Format(Gout_dt, "yyyymmddhhmmss") & "','yyyymmddhh24miss')") & ","
    SQL = SQL & IIf(CStr(Strt_dt) = "", "null", "to_date('" & Format(Strt_dt, "yyyymmddhhmmss") & "','yyyymmddhh24miss')") & ","
    SQL = SQL & IIf(Gin_dt = "", "null", "to_date('" & Format(Gin_dt, "yyyymmddhhmmss") & "','yyyymmddhh24miss')") & ","
    
    SQL = SQL & IIf(Bond_ID = "", "null", "'" & Bond_ID & "'") & ","
    SQL = SQL & IIf(Ts_ID = "", "null", "'" & Ts_ID & "'") & ","
    SQL = SQL & IIf(Rtn_CD = "", "null", "'" & Rtn_CD & "'") & ","
    SQL = SQL & IIf(Gc_ldt = "", "null", "to_date('" & Format(Gc_ldt, "yyyymmddhhmmss") & "','yyyymmddhh24miss')") & ","
    SQL = SQL & "null"
    SQL = SQL & " ) from dual "
          
    Rs.Open SQL, G_Host_Con
    If Not Rs.EOF Then
        OverDay_UseGetFTover = IIf(IsNull(Rs(0)), "0", Rs(0))
    Else
        OverDay_UseGetFTover = 0
    End If
    Exit Function
ErrMsg:
    OverDay_UseGetFTover = 0
    MsgBox "�Լ�(OverDay_UseGetFTover) Error" & vbCrLf & Err.Description
End Function
'  2001/04/09   �����κ� �߰�


'  �ش������̳��� over�ϼ��� ������
'    ���� : FreeDay_Cntr(�����̳ʹ�ȣ, DUP NO., ��������(return��), �۾�����(return��))
'            �۾����� : 1:����, 2:����,3:�ںε�t/s,4:Ÿ�ε�t/s,5:�ݼ�, 6:����, 7:�ε����
'
''    ���� : FreeDay_Cntr(�����̳ʹ�ȣ, DUP NO., ��������+freeday�ϼ�(return��))
'  ��ȯ�� : over�ϼ�
Public Function FreeDay_Cntr(Cntr_no As String, Dup_no As Integer, Rtn_Date As String, work_cd As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim Start_dt As Date
    Dim End_dt As Date
    
    Dim free_ilsu  As Integer
    Dim ilsu  As Integer
    Dim Over_Day  As Integer
    
    Dim good_cd  As String
    Dim ix_cd  As String
    Dim Oper_Cd  As String
    
On Error GoTo ErrMsg
    
'    Sql = "select substr(cur_stat,1,1) cur_stat, nvl(ts_id,' ') ts_id, decode(a.oper_cd1,null,a.oper_cd,a.oper_cd1) oper_cd, " & _
'          "       decode(nvl(rtn_cd,' '),' ',' ','C',' ', rtn_cd) rtn_cd, nvl(gin_dt,'') gin_dt, nvl(a.bond_id,' ') bond_id," & _
'          "       decode(cur_stat,'ID', nvl(gout_dt,''), 'XD', decode(nvl(rtn_cd,' '), 'R', gout_dt, sysdate), sysdate) gout_dt, nvl(stv_end_dt,nvl(etd_dt,'')) stv_end_dt, " & _
'          "       decode(cur_stat,'XD', to_date(to_char(nvl(ata_dt,nvl(eta_dt,'')),'yyyymmdd')||'000000','yyyymmddhh24miss'), sysdate)  ata_dt, nvl(ta_ship_call,' ') ex_ship_call, " & _
'          "       a.ship_cd SHIP_CD, a.call_no CALL_NO, a.call_yy CALL_YY" & _
'          "  from t_cntr a, t_vescall b" & _
'          " Where cntr_no = '" + cntr_no + "' " & _
'          "   and a.dup_no = " + CStr(DUP_NO) + " " & _
'          "   and a.Ship_Cd = b.Ship_Cd(+) " & _
'          "   and a.call_yy = b.call_yy(+) " & _
'          "   and a.call_no = b.call_no(+) "
'
''          "       decode(cur_stat,'XD', to_date(to_char(nvl(ata_dt,nvl(eta_dt,'')),'yyyymmdd')||'000000','yyyymmddhh24miss'), sysdate)  ata_dt, nvl(ex_ship_call,' ') ex_ship_call" & _


    SQL = "SELECT SUBSTR(cur_stat, 1, 1)    cur_stat, "
    SQL = SQL & "       NVL(ts_id, ' ')       ts_id, "
    SQL = SQL & "       DECODE(a.oper_cd1, NULL, a.oper_cd, a.oper_cd1)    oper_cd,"
    SQL = SQL & "       DECODE(nvl(rtn_cd, ' '), ' ', ' ', 'C', ' ', rtn_cd)    rtn_cd,"
    SQL = SQL & "       NVL(gin_dt, '')       gin_dt,"
    SQL = SQL & "       NVL(a.bond_id, ' ')       bond_id,"
    SQL = SQL & "       DECODE(cur_stat,"
    SQL = SQL & "              'ID',"
    SQL = SQL & "              nvl(gout_dt, ''),"
    SQL = SQL & "              'XD',"
    SQL = SQL & "              DECODE(nvl(rtn_cd, ' '), 'R', gout_dt, SYSDATE),"
    SQL = SQL & "              SYSDATE)    gout_dt,"
    SQL = SQL & "       NVL(stv_end_dt, nvl(etd_dt, ''))       stv_end_dt,"
    SQL = SQL & "       DECODE(cur_stat,"
    SQL = SQL & "              'XD',"
    SQL = SQL & "              TO_DATE(TO_CHAR(NVL(ata_dt, nvl(eta_dt, '')), 'YYYYMMDD') ||"
    SQL = SQL & "                      '000000',"
    SQL = SQL & "                      'YYYYMMDDHH24MISS'),"
    SQL = SQL & "              SYSDATE)    ata_dt,"
    SQL = SQL & "       NVL(ta_ship_call, ' ')       ex_ship_call,"
    SQL = SQL & "       a.ship_cd SHIP_CD,"
    SQL = SQL & "       a.call_no CALL_NO,"
    SQL = SQL & "       a.call_yy call_yy"
    SQL = SQL & "  FROM t_cntr a, t_vescall b"
    SQL = SQL & " WHERE cntr_no = '" + Cntr_no + "' AND"
    SQL = SQL & "       a.dup_no = " & Dup_no & " AND"
    SQL = SQL & "       a.Ship_Cd = b.Ship_Cd(+) AND"
    SQL = SQL & "       a.call_yy = b.call_yy(+) AND"
    SQL = SQL & "       a.call_no = b.call_no(+)"


    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �����̳ʰ� �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        FreeDay_Cntr = -1
        Exit Function
    Else
        Rs.MoveFirst
        If Rs!Cur_Stat = "I" Then   '  ����
            ix_cd = IIf(IsNull(Rs!Cur_Stat), "", Trim(Rs!Cur_Stat))
            If Rs!Ts_ID = " " Then   '  �Ϲ�
                If Rs!Bond_ID = " " Then
                    work_cd = "1"
                    good_cd = "1"
                ElseIf Rs!Bond_ID = "B" Then   '  ����
                    work_cd = "6"
                    good_cd = "2"
                ElseIf Rs!Bond_ID = "C" Then   ' �ε����
                    work_cd = "7"
                    good_cd = "3"
                End If
                Start_dt = CDate(IIf(IsNull(Rs!Stv_End_DT), "1000/01/01 00:00:00", Trim(Rs!Stv_End_DT)))
                End_dt = CDate(IIf(IsNull(Rs!Gout_dt), "1000/01/01 00:00:00", Trim(Rs!Gout_dt)))
            ElseIf Rs!Ts_ID = "2" Then    '  Ÿ�ε�t/s
                If Rs!Bond_ID = " " Then
                    work_cd = "4"
                    good_cd = "5"
                ElseIf Rs!Bond_ID = "B" Then   '  ����
                    work_cd = "4"
                    good_cd = "5"
                ElseIf Rs!Bond_ID = "C" Then   ' �ε����
                    work_cd = "7"
                    good_cd = "3"
                End If
                Start_dt = CDate(IIf(IsNull(Rs!Stv_End_DT), "1000/01/01 00:00:00", Trim(Rs!Stv_End_DT)))
                End_dt = CDate(IIf(IsNull(Rs!Gout_dt), "1000/01/01 00:00:00", Trim(Rs!Gout_dt)))
            Else    '  �ںε�t/s
                If Rs!Bond_ID = " " Then
                    work_cd = "3"
                    good_cd = "4"
                ElseIf Rs!Bond_ID = "B" Then
                    work_cd = "3"
                    good_cd = "4"
                ElseIf Rs!Bond_ID = "C" Then   ' �ε����
                    work_cd = "7"
                    good_cd = "3"
                End If
                Start_dt = CDate(IIf(IsNull(Rs!Stv_End_DT), "1000/01/01 00:00:00", Trim(Rs!Stv_End_DT)))
                End_dt = CDate(IIf(IsNull(Rs!Gout_dt), "1000/01/01 00:00:00", Trim(Rs!Gout_dt)))
            End If
            If Format(Start_dt, "hhmm") >= "0800" Then
                Start_dt = Start_dt + 1
            End If
            Start_dt = CDate(Format(Start_dt, "yyyy/mm/dd") + " 08:00:00")
        ElseIf Rs!Cur_Stat = "X" Then   '  ����
            ix_cd = IIf(IsNull(Rs!Cur_Stat), "", Trim(Rs!Cur_Stat))
            If Rs!Ts_ID = " " Then
                If Rs!Rtn_CD = " " Then   '  �Ϲ�
                    If Rs!Bond_ID = " " Then
                        work_cd = "2"
                        good_cd = "1"
                    ElseIf Rs!Bond_ID = "B" Then   '  ����
                        work_cd = "6"
                        good_cd = "2"
                    ElseIf Rs!Bond_ID = "C" Then   ' �ε����
                        work_cd = "7"
                        good_cd = "3"
                    End If
                    Start_dt = CDate(IIf(IsNull(Rs!Gin_dt), "1000/01/01 00:00:00", Trim(Rs!Gin_dt)))
                    End_dt = CDate(IIf(IsNull(Rs!Ata_dt), "1000/01/01 00:00:00", Trim(Rs!Ata_dt)))
                    End_dt = CDate(Format(End_dt, "YYYY/MM/DD") + " 00:00:00")
                Else                      '  �ݼ�
                    If Rs!Bond_ID = " " Then
                        work_cd = "5"
                        good_cd = "6"
                    ElseIf Rs!Bond_ID = "B" Then   '  ����
                        work_cd = "6"
                        good_cd = "2"
                    ElseIf Rs!Bond_ID = "C" Then   ' �ε����
                        work_cd = "7"
                        good_cd = "3"
                    End If
                    Start_dt = CDate(IIf(IsNull(Rs!Gin_dt), "1000/01/01 00:00:00", Trim(Rs!Gin_dt)))
                    End_dt = CDate(IIf(IsNull(Rs!Gout_dt), "1000/01/01 00:00:00", Trim(Rs!Gout_dt)))
                End If
            ElseIf Rs!Ts_ID = "2" Then    '  Ÿ�ε�t/s
                If Rs!Rtn_CD = " " Then
                    work_cd = "4"
                    good_cd = "5"
                    Start_dt = CDate(IIf(IsNull(Rs!Gin_dt), "1000/01/01 00:00:00", Trim(Rs!Gin_dt)))
                    End_dt = CDate(IIf(IsNull(Rs!Ata_dt), "1000/01/01 00:00:00", Trim(Rs!Ata_dt)))
                Else
                    work_cd = "5"
                    good_cd = "6"
                    Start_dt = CDate(IIf(IsNull(Rs!Gin_dt), "1000/01/01 00:00:00", CDate(Format(Rs!Gin_dt, "yyyy/mm/dd") + " 00:00:00")))
                    End_dt = CDate(IIf(IsNull(Rs!Gout_dt), "1000/01/01 00:00:00", CDate(Format(Rs!Gout_dt, "yyyy/mm/dd") + " 00:00:01")))
                End If
            Else    '  �ںε�t/s
                work_cd = "3"
                good_cd = "4"
                    If Len(Rs!Ex_Ship_Call) > 8 Then
                        If ship_date(Mid(Rs!Ex_Ship_Call, 1, 4), Mid(Rs!Ex_Ship_Call, 5, 4), Mid(Rs!Ex_Ship_Call, 9), Start_dt, End_dt) = -1 Then
                            FreeDay_Cntr = -1
                            MsgBox "���� �������� Ʋ���ϴ� - " & Cntr_no
                            Exit Function
                        End If
                    Else
                        FreeDay_Cntr = -1
                        MsgBox "���� �������� �����ϴ� - " & Cntr_no
                        Exit Function
                    End If
                Start_dt = End_dt
                If Format(Start_dt, "hhmm") >= "0800" Then
                    Start_dt = Start_dt + 1
                End If
                Start_dt = CDate(Format(Start_dt, "yyyy/mm/dd") + " 08:00:00")
                End_dt = CDate(IIf(IsNull(Rs!Ata_dt), "1000/01/01 00:00:00", Trim(Rs!Ata_dt)))
                End_dt = CDate(Format(End_dt, "yyyy/mm/dd") + " 00:00:00")
            End If
        ElseIf Rs!Cur_Stat = "S" Then   '  SHIFT
            Rs.Close:               Set Rs = Nothing
            FreeDay_Cntr = 0
            Exit Function
        ElseIf Rs!Cur_Stat = "M" Then   '  ONDOCK   ����
            Rs.Close:               Set Rs = Nothing
            FreeDay_Cntr = 0
            Exit Function
        End If
        
        Oper_Cd = Check_Feeder(Rs!ship_cd, Rs!call_no, Rs!call_yy)
        
        If Oper_Cd = "SKIP" Then
            Oper_Cd = IIf(IsNull(Rs!Oper_Cd), "", Trim(Rs!Oper_Cd))
        Else
            Oper_Cd = Oper_Cd
        End If
    End If

    Rs.Close
    Set Rs = Nothing

    
    If Format(Start_dt, "yyyy-mm-dd") = "1000-01-01" Then
        FreeDay_Cntr = -1
        MsgBox "�Լ�(FreeDay_Cntr) Error(T_vercall)" & vbCrLf & "�����Ͻð� �����ϴ�. - " & Cntr_no
        Exit Function
    End If
    
    If Format(End_dt, "yyyy-mm-dd") = "1000-01-01" Then
        FreeDay_Cntr = -1
        MsgBox "�Լ�(FreeDay_Cntr) Error(T_vercall)" & vbCrLf & "�����Ͻð� �����ϴ�. - " & Cntr_no
        Exit Function
    End If
    
    If good_cd = "" Then
        MsgBox "�ش��ϴ� free time�ϼ��� �����ϴ�" & vbCrLf & "  " + Cntr_no
    Else
        free_ilsu = FreeDay_ilsu(Start_dt, ix_cd, good_cd, Oper_Cd)
    End If
    If free_ilsu < 0 Then
        FreeDay_Cntr = -1
        Exit Function
    End If
    ilsu = imn_ilsu(Start_dt, End_dt)
    If ilsu < 0 Then
        FreeDay_Cntr = -1
        Exit Function
    End If
    
    Rtn_Date = Format(Start_dt + free_ilsu + ilsu, "yyyy-mm-dd hh:mm:ss")
'    rtn_date = Format(start_dt + free_ilsu + ilsu, "yyyy-mm-dd hh:mm:ss") + "+" + Format(free_ilsu + ilsu, "00")
    Over_Day = Round((End_dt - Start_dt) - free_ilsu - ilsu + 0.501)
    
    If Over_Day <= 0 Then
       FreeDay_Cntr = 0
    Else
       FreeDay_Cntr = Over_Day
'       FreeDay_Cntr = Over_Day + 1
    End If
    
    Exit Function

ErrMsg:
    FreeDay_Cntr = -1
    MsgBox "�Լ�(FreeDay_Cntr) Error(t_cntr, t_vescall)" & vbCrLf & Err.Description
End Function

'  �ش�������� free_time�ϼ��� ������
'    ���� : freeday_ilsu(������, �����Ա���, �۾�����, ����)
'  ��ȯ�� : free_time�ϼ�

Public Function FreeDay_ilsu(Chk_DT As Date, ix_cd As String, good_cd As String, Oper As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim free_ilsu  As Integer
    
On Error GoTo ErrMsg
        
    SQL = "select free_day from t_freeday" & _
          " where bgn_dt = (select max(bgn_dt) from t_freeday " & _
          "                  where ix_cd = '" + ix_cd + "' " & _
          "                    and cargo_cd = '" + good_cd + "' " & _
          "                    and bgn_dt <= to_date('" + Format(Chk_DT, "yyyymmddhhmmss") + "','yyyymmddhh24miss')" & _
          "                    and oper_cd = '" + Oper + "') " & _
          "   and ix_cd = '" + ix_cd + "' " & _
          "   and cargo_cd = '" + good_cd + "' " & _
          "   and oper_cd = '" & Oper & "' "
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        If Oper <> "*" Then
            FreeDay_ilsu = FreeDay_ilsu(Chk_DT, ix_cd, good_cd, "*")
        Else
            MsgBox "�ش��ϴ� free time�ϼ��� �����ϴ�" & vbCrLf & Format(Chk_DT, "yyyy/mm/dd") + "  " + ix_cd + "  " + good_cd
            FreeDay_ilsu = -1
        End If
        Exit Function
    Else
        Rs.MoveFirst
        free_ilsu = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
    End If

    Rs.Close
    Set Rs = Nothing

    FreeDay_ilsu = free_ilsu
    
    Exit Function
ErrMsg:
    FreeDay_ilsu = -1
    MsgBox "�Լ�(freeday_ilsu) Error(T_freeday)" & vbCrLf & Err.Description
End Function

'  �ش�Ⱓ�� �����ϼ��� ������
'    ���� : imn_ilsu(������, ������)
'  ��ȯ�� : �����ϼ�

Public Function imn_ilsu(from_dt As Date, to_dt As Date) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim ilsu  As Integer
    
On Error GoTo ErrMsg
    
    SQL = "select count(*) from t_imnday" & _
          " where imn_dt between to_date('" + Format(from_dt, "yyyymmdd") + "','yyyymmddhh24miss') and to_date('" + Format(to_dt, "yyyymmddhhmmss") + "','yyyymmddhh24miss') "
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
'        MsgBox "�ش��ϴ� free time�ϼ��� �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        imn_ilsu = 0
        Exit Function
    Else
        Rs.MoveFirst
        ilsu = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
    End If

    Rs.Close
    Set Rs = Nothing

    imn_ilsu = ilsu
    
    Exit Function
ErrMsg:
    imn_ilsu = -1
    MsgBox "�Լ�(imn_ilsu) Error(T_freeday)" & vbCrLf & Err.Description
End Function

'  �ش���� �۾��Ϸ��Ͻ��� ������
'    ���� : ship_date(���ڵ�, �𼱳⵵, ������, �����Ͻ�, �����Ͻ�):�����Ͻ�,�����Ͻô� �ǵ�����
'  ��ȯ�� : 0, -1(error)
Public Function ship_date(ship_cd As String, call_yy As String, call_no As String, Start_dt As Date, End_dt As Date) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg
    Screen.MousePointer = 11

    SQL = "select to_char(decode(ata_dt,null,decode(stv_begin_dt,null,etb_dt,stv_begin_dt), ata_dt),'yyyy/mm/dd hh24:mi:ss') �����Ͻ�, " & _
          "       to_char(decode(stv_end_dt,null,decode(atd_dt,null,etd_dt,atd_dt), stv_end_dt),'yyyy/mm/dd hh24:mi:ss') �۾��Ϸ�" & _
          "  from t_vescall" & _
          " where ship_cd = '" + ship_cd + "' " & _
          "   and call_yy = " + call_yy + " " & _
          "   and call_no = " + call_no + " "
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
'        MsgBox "�ش��ϴ� �������� �����ϴ�" & vbCrLf & ship_cd + "-" + call_no + "-" + call_yy
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ship_date = -1
        Exit Function
    Else
        Rs.MoveFirst
        Start_dt = CDate(IIf(IsNull(Rs(0)), "", Trim(Rs(0))))
        End_dt = CDate(IIf(IsNull(Rs(1)), "", Trim(Rs(1))))
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    
    ship_date = 0
    Exit Function

ErrMsg:
    Screen.MousePointer = 0
    ship_date = -1
    MsgBox "�Լ�(ship_date) Error(T_vercall)" & vbCrLf & Err.Description
End Function

'over-HWL 2001-03-06 ��õ��
Public Function Check_Owl(overH As Integer, overP As Integer, overS As Integer, overLf As Integer, _
                                    overLb As Integer, overRH As String, overRW As String, overRL As String) As Integer
On Error GoTo OwlErr
    
    If overH = 0 Then
        overRH = ""
    Else
        overRH = "1"
    End If
    
    If overP = 0 And overS = 0 Then
        overRW = ""
    ElseIf overP <> 0 And overS = 0 Then
        overRW = "1"
    ElseIf overP = 0 And overS <> 0 Then
        overRW = "2"
    ElseIf overP <> 0 And overS <> 0 Then
        overRW = "3"
    End If
    
     If overLf = 0 And overLb = 0 Then
        overRL = ""
    ElseIf overLf <> 0 And overLb = 0 Then
        overRL = "1"
    ElseIf overLf = 0 And overLb <> 0 Then
        overRL = "2"
    ElseIf overLf <> 0 And overLb <> 0 Then
        overRL = "3"
    End If
    
    Check_Owl = 0
    Exit Function
    
OwlErr:
    Screen.MousePointer = 0
    Check_Owl = -1
    MsgBox "chk_Owl Error" & vbCrLf & Err.Description
End Function

'2001.3.6 CREATE BY SSW
Public Function Check_S_Bay(Bay As String) As Boolean
    Dim Temp1, Temp2   As Integer
    Dim Temp3 As String

    If Len(Bay) = 1 Or Len(Bay) = 2 Or Len(Bay) = 3 Then
        Temp1 = Asc(Mid(Bay, 1, 1))
        If (Temp1 < 48 Or Temp1 > 57) And Temp1 <> 8 And Temp1 <> 9 Then
            Check_S_Bay = False
            MsgBox "��ȿ�� ���� �ƴմϴ�", 48, "Invalid Error":      Exit Function
        End If
    End If
    
    If Len(Bay) = 2 Or Len(Bay) = 3 Then
        Temp2 = Asc(Mid(Bay, 2, 1))
        If (Temp2 < 48 Or Temp2 > 57) And Temp2 <> 8 And Temp2 <> 9 Then
            Check_S_Bay = False
            MsgBox "��ȿ�� ���� �ƴմϴ�", 48, "Invalid Error":      Exit Function
        Else
            Check_S_Bay = True
        End If
    End If
    
    If Len(Bay) = 3 Then
        Temp3 = Mid(Bay, 3, 1)
        If Temp3 = "A" Or Temp3 = "F" Then
            Check_S_Bay = True
        Else
            Check_S_Bay = False
            MsgBox "��° �ڸ���A�Ǵ�F�� �Է°����մϴ�", 48, "Invalid Error":        Exit Function
        End If
    End If
    Check_S_Bay = True
End Function

'2001.3.6 CREATE BY SSW
Public Function Check_S_Row(Row As Integer) As Boolean

 
    If Row < 0 Or Row > 24 Then
        Check_S_Row = False
        MsgBox "��ȿ�� ���� �ƴմϴ�", 48, "Invalid Error"
    Else
        Check_S_Row = True
    End If
    
 
End Function

'2001.3.12 CREATE BY SSW
Public Function Check_S_Tier(hd As String, Tier As Integer) As Boolean   'HD�� hold, deck ����
    Dim Temp As Integer

    If Trim(hd) = "" Then
        MsgBox "Hold/Deck�� ���� �����Ͻÿ�", 48, "Invalid Error"
        Check_S_Tier = False:        Exit Function
    End If
    
On Error GoTo Err:
    Temp = Tier Mod 2
    If Temp = 1 Then
        Check_S_Tier = False:        MsgBox "Tier���� Ȧ���� �Է��� �� �����ϴ�", 48, "Invalid Error":      Exit Function
    End If
    
    If hd = "H" Or hd = "Hold" Then
        If Tier < 2 Or Tier > 18 Then
            Check_S_Tier = False
            MsgBox "Hold�� ����Ǵ� Tier�� �ƴմϴ�", 48, "Invalid Error"
        Else
            Check_S_Tier = True
        End If
    ElseIf hd = "D" Or hd = "Deck" Then
        If Tier < 80 Or Tier > 98 Then
            Check_S_Tier = False
            MsgBox "Deck�� ����Ǵ� Tier�� �ƴմϴ�", 48, "Invalid Error"
        Else
            Check_S_Tier = True
        End If
    End If
    Exit Function
Err:
    Check_S_Tier = False
End Function

'2001.3.7 CREATE BY SSW
Public Function Check_Sz_CD(Size As String) As Boolean
    Dim Temp As String
 
    Temp = Mid(Size, 1, 1)
    If Temp = "2" Or Temp = "4" Or Temp = "9" Or Temp = "L" Then
        Temp = Mid(Size, 2, 1)
        If Temp = "0" Or Temp = "1" Or Temp = "2" Or Temp = "3" Or Temp = "4" _
                      Or Temp = "5" Or Temp = "6" Or Temp = "7" Or Temp = "8" Or Temp = "9" Then
            Check_Sz_CD = True
        Else
            Check_Sz_CD = False:            MsgBox "��ȿ�� ���� �ƴմϴ�", 48, "Invalid Error"
        End If
    Else
        Check_Sz_CD = False:        MsgBox "��ȿ�� ���� �ƴմϴ�", 48, "Invalid Error"
    End If
     
End Function

'2001.3.7 CREATE BY SSW
Public Function Check_Ty_CD(Typ As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim TYPE_CODE As String
    Dim i As Integer
    
On Error GoTo ErrMsg

    For i = 1 To 2
        If i = 1 Then
            TYPE_CODE = "ty_cd"
        ElseIf i = 2 Then
            TYPE_CODE = "ty_cd1"
        End If
        
        SQL = "SELECT ty_snm FROM t_type"
        SQL = SQL & " WHERE " & TYPE_CODE & "  = '" & Trim(Typ) & "'"
        
        Set Rs = New ADODB.Recordset
        Rs.Open SQL, G_Host_Con
        
        If Rs.EOF Then
            Check_Ty_CD = False
            If i = 2 Then
                Typ = ""
            End If
            Rs.Close:        Set Rs = Nothing
        Else
            Check_Ty_CD = True
            Typ = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
            Rs.Close:        Set Rs = Nothing
            Exit For
        End If
    Next i
    
    If Check_Ty_CD = False Then
        Screen.MousePointer = 0
        MsgBox "��ȿ�� ���� �ƴմϴ�", 48, "Invalid Error"
    End If

    Exit Function
ErrMsg:
    Screen.MousePointer = 0
    Typ = ""
    Check_Ty_CD = False
    MsgBox "�Լ�(Check_Ty_CD) Error(T_TYPE)" & vbCrLf & Err.Description
End Function

'2001.3.7 CREATE BY SSW
Public Function Check_Weight(Size As String, FM As String, Weight As String) As Boolean
    Dim Temp1  As String
    Dim RLT As String
    
    '4���� �������� ���� 2M,2F,4M,4F
    
    If Trim(Weight) = "" Then Weight = "0"
    
    Temp1 = Mid(Size, 1, 1)
    
    If FM = "M" Then
        If Temp1 = "2" Or Temp1 = "3" Then
            RLT = "2M"
        ElseIf Temp1 = "4" Or Temp1 = "L" Or Temp1 = "9" Then
            RLT = "4M"
        End If
    ElseIf FM = "F" Then
        If Temp1 = "2" Or Temp1 = "3" Then
            RLT = "2F"
        ElseIf Temp1 = "4" Or Temp1 = "L" Or Temp1 = "9" Then
            RLT = "4F"
        End If
    End If
    
    '������ ��������
    
    If RLT = "2M" Then
        If Weight <= 2 Then
            Check_Weight = True
        Else
            Check_Weight = False
        End If
    ElseIf RLT = "4M" Then
        If Weight <= 4 Then
            Check_Weight = True
        Else
            Check_Weight = False
        End If
    ElseIf RLT = "2F" Then
        If Weight >= 2 And Weight < 30 Then
            Check_Weight = True
        Else
            Check_Weight = False
        End If
    ElseIf RLT = "4F" Then
        If Weight >= 4 And Weight < 40 Then
            Check_Weight = True
        Else
            Check_Weight = False
        End If
    End If
     
    If Check_Weight = False Then
        MsgBox "��ȿ�� ���� �ƴմϴ�", 48, "Invalid Error"
    End If
 
End Function

'2001.3.12
Public Function Check_Cur_Stat2(Code As String) As Boolean
    Select Case Code
        Case "B", "P", "G", "Y", "O", "D", "Z"
            Check_Cur_Stat2 = True
        Case Else
            MsgBox "��ȿ�� ���� �ƴմϴ�", 48, "Invalid Error"
            Check_Cur_Stat2 = False
    End Select
End Function

'�߷����� Rton���� ���
Public Function Check_Rton(Wgt As String) As String
    Dim value As Double
    
    If Wgt = "" Then Wgt = 0
    
    value = CDbl(Wgt)
    
    Check_Rton = Format(Round(value * 0.883, 3), "##0.000")
End Function
'OnDock ���� Check
Public Function Check_OnDockOper(OperCode As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg
    
    SQL = "SELECT ondock FROM t_oper"
    SQL = SQL & " WHERE oper_cd = '" & OperCode & "'"
    SQL = SQL & "   AND ondock = 'Y'"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        Check_OnDockOper = False
    Else
        Check_OnDockOper = True
    End If

    Rs.Close
    Set Rs = Nothing
    Exit Function
    
ErrMsg:
    Screen.MousePointer = 0
    Check_OnDockOper = False
    MsgBox "�Լ�(Check_OnDockOper) Error(t_Oper)" & vbCrLf & Err.Description
End Function

Public Function query_Equi(cboEqt_gb As ComboBox)
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim imsiEqui As String
    
On Error GoTo qEquiErr

    SQL = "select substr(eq_name, 1, 2) from t_equi "
    SQL = SQL & " order by eq_name "
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        query_Equi = -1
        
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If
    
    cboEqt_gb.Clear

    Do While Not Rs.EOF
        If imsiEqui <> Trim(Rs(0)) Then
            cboEqt_gb.AddItem Trim(Rs(0))
            imsiEqui = Trim(Rs(0))
        End If
        Rs.MoveNext
    Loop
    
    'cboEqt_gb.ListIndex = 0
    query_Equi = 1
    
    Rs.Close
    Set Rs = Nothing

    Exit Function
qEquiErr:
    Screen.MousePointer = 0
    query_Equi = -1
    MsgBox "�Լ� query_Equi Error" & vbCrLf & Err.Description
End Function


Public Function query_Equi_No(EQT As String, cboEqt_no As ComboBox, Typ As Integer)        'typ = 0:��񱺿� ������� ��� ���      1: ��񱺿� �ش�Ǵ°͸�
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo qEquiNoErr


    SQL = "SELECT distinct(eq_no) "
    SQL = SQL & "FROM T_EQUI"
    'Sql = Sql & "FROM T_EQPOS"
    
    If Typ = 1 Or Typ = 2 Then
        SQL = SQL & " WHERE"
        SQL = SQL & " SUBSTR(EQ_NAME,1,2)='" & EQT & "'"
    End If
    
    SQL = SQL & " ORDER BY EQ_NO"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        query_Equi_No = -1
        
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If
    
    cboEqt_no.Clear
    
    If Typ = 1 Or Typ = 3 Then '2001.06.5�߰�
        cboEqt_no.AddItem "*", 0  '2001.05.22�߰�
        cboEqt_no.ListIndex = 0
    End If
    

    Do While Not Rs.EOF
        cboEqt_no.AddItem Trim(Rs(0))
        Rs.MoveNext
    Loop
    
'    If typ = 1 Then
'        cboEqt_no.ListIndex = 0
'    End If

    
    query_Equi_No = 1
    
    Rs.Close
    Set Rs = Nothing

    Exit Function
qEquiNoErr:
    Screen.MousePointer = 0
    query_Equi_No = -1
    MsgBox "�Լ� query_equi_No Error" & vbCrLf & Err.Description
End Function

Public Function QUERY_EQPOS_NO(EQT As String, cboEqt_no As ComboBox)
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo QUERY_EQPOS_NO_ERR


    SQL = "SELECT"
    SQL = SQL & " EQ_NO"
    SQL = SQL & " FROM T_EQPOS"
    
    SQL = SQL & " WHERE"
    Select Case EQT
    Case "GC", "CC"
        SQL = SQL & " EQ_NO LIKE '1%'"
    Case "TC"
        SQL = SQL & " EQ_NO LIKE '2%'"
    Case "YT"                                   'Modify by ChuHan. 20060331, YT ����� �߰�
        SQL = SQL & " EQ_NO LIKE '3%'"
    Case "RS"
        SQL = SQL & " EQ_NO LIKE '5%'"
    End Select
    SQL = SQL & " ORDER BY EQ_NO"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        QUERY_EQPOS_NO = -1
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If
    
    cboEqt_no.Clear
    cboEqt_no.AddItem "*", 0  '2001.05.22�߰�
    cboEqt_no.ListIndex = 0

    Do Until Rs.EOF
        cboEqt_no.AddItem Trim(Rs(0))
        Rs.MoveNext
    Loop
    
    QUERY_EQPOS_NO = 1
    
    Rs.Close
    Set Rs = Nothing

    Exit Function
    
QUERY_EQPOS_NO_ERR:
    Screen.MousePointer = 0
    QUERY_EQPOS_NO = -1
    MsgBox "�Լ� QUERY_EQPOS_NO Error" & vbCrLf & Err.Description
End Function

Public Function QUERY_EMPNO(cboEmpNo As ComboBox)
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo QUERY_EMPNO_ERR

    SQL = "SELECT"
    SQL = SQL & " USER_ID"
    SQL = SQL & " FROM T_AUUSER"
    
    SQL = SQL & " WHERE"
    SQL = SQL & " substr(group_id,1,2) IN ('GC','TC','YT','RS')"  'Modify by ChuHan. 20060331, YT ����� �߰�
'    Sql = Sql & " GROUP_ID IN ('GC','TC','RS')"
    SQL = SQL & " GROUP BY USER_ID"
    SQL = SQL & " ORDER BY USER_ID"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        QUERY_EMPNO = -1
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If
    
    cboEmpNo.Clear
    'cboEmpNo.AddItem "*", 0
    cboEmpNo.AddItem "", 0
    cboEmpNo.ListIndex = 0

    Do Until Rs.EOF
        cboEmpNo.AddItem Trim(Rs(0))
        Rs.MoveNext
    Loop
    
    QUERY_EMPNO = 1
    
    Rs.Close
    Set Rs = Nothing

    Exit Function
    
QUERY_EMPNO_ERR:
    Screen.MousePointer = 0
    QUERY_EMPNO = -1
    MsgBox "�Լ� QUERY_EMPNO Error" & vbCrLf & Err.Description
End Function

Public Function QUERY_EMPNM(rEmpNo As String, txtEmpNm As TextBox)
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo QUERY_EMPNM_ERR

    SQL = "SELECT"
    SQL = SQL & " NAME"
    SQL = SQL & " FROM T_AUUSER"
    SQL = SQL & " WHERE"
    SQL = SQL & " USER_ID='" & rEmpNo & "'"

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        QUERY_EMPNM = -1
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If
    
    QUERY_EMPNM = 1
    txtEmpNm = Trim(Rs(0))
    
    Rs.Close
    Set Rs = Nothing

    Exit Function
    
QUERY_EMPNM_ERR:
    Screen.MousePointer = 0
    QUERY_EMPNM = -1
    MsgBox "�Լ� QUERY_EMPNM Error" & vbCrLf & Err.Description
End Function


''�⺻ȯ�溯��

'  t_config���� �⺻ ������ ���� ������
'    ���� : Fun_Get_Config()
'  ��ȯ�� : true or false
Public Function Fun_Get_Config() As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim v_port As String
    
On Error GoTo ErrMsg
    
    v_port = "DPCT"
     
    Screen.MousePointer = 11

    SQL = "SELECT "
    SQL = SQL + " tmnl_cd, "
    SQL = SQL + " tmnl_nm, "
    SQL = SQL + " dg_maxtier, "
    SQL = SQL + " rf_maxtier, "
    SQL = SQL + " oog_block, "
    SQL = SQL + " loc_chk, "
    SQL = SQL + " sensor_chk "
    SQL = SQL + " FROM t_config "
    SQL = SQL + " where tmnl_cd = '" & v_port & "'"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        MsgBox "t_config �ڷᰡ �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        Fun_Get_Config = False
        Exit Function
    Else
        Rs.MoveFirst
        G_Tmnl_CD = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
        G_Tmnl_NM = IIf(IsNull(Rs(1)), "", Trim(Rs(1)))
'        G_MaxTier = IIf(IsNull(Rs(1)), 0, Trim(Rs(1)))
        G_DG_MaxTier = IIf(IsNull(Rs(2)), 0, Trim(Rs(2)))
        G_RF_MaxTier = IIf(IsNull(Rs(3)), 0, Trim(Rs(3)))
        G_SPC_Block = IIf(IsNull(Rs(4)), "", Trim(Rs(4)))
        G_Chk_Loc = IIf(IsNull(Rs(5)), "", Trim(Rs(5)))
        G_Sensor_Chk = IIf(IsNull(Rs(6)), "", Trim(Rs(6)))
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    Fun_Get_Config = True
    
    
    Exit Function
ErrMsg:
    Screen.MousePointer = 0
    Fun_Get_Config = False
    MsgBox "Fun_Get_Config Error" & vbCrLf & _
           "Err No : " & CStr(Err.number) & vbCrLf & Err.Description
End Function


'�ش� Block Check
Public Function Chk_Block(Block_NM As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset

    If Trim(Block_NM) = "" Then
        MsgBox "BLOCK�� �����Է��Ͻÿ�"
        Chk_Block = False:        Exit Function
    End If
    
On Error GoTo ErrMsg

    SQL = "SELECT block FROM tb_block"
    SQL = SQL & " WHERE block = '" & Trim(Block_NM) & "'"

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        Chk_Block = False
        MsgBox "�����ϴ� BLOCK�� �ƴմϴ�"
    Else
        Chk_Block = True
    End If

    Rs.Close:       Set Rs = Nothing
    Exit Function

ErrMsg:
    Chk_Block = False
    MsgBox "�Լ�(Chk_Block) Error(tb_block)" & vbCrLf & Err.Description
End Function

'�ش� Block Check
Public Function Chk_PartLoc(Block_NM As String, Loc As String, Loc_CD As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim Location As Integer
    Dim Max_Value As Integer
    
On Error GoTo ErrMsg
    
    If Trim(Block_NM) = "" Or Trim(Loc) = "" Or Loc_CD = "" Then
        MsgBox "�μ��� �ϳ��� �����Ǿ����ϴ�"
        Chk_PartLoc = False:        Exit Function
    End If

    Location = Int(Loc)
    
    SQL = "SELECT mxbay,mxrow,mxtier FROM tb_block"
    SQL = SQL & " WHERE block = '" & Trim(Block_NM) & "'"

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        Chk_PartLoc = False:        MsgBox "�����ϴ� BLOCK�� �ƴմϴ�"
        Rs.Close:       Set Rs = Nothing
        Exit Function
    End If
    
    Select Case Loc_CD
        Case "B":            Max_Value = IIf(IsNull(Rs!MxBay), 0, (Rs!MxBay))
        Case "R":            Max_Value = IIf(IsNull(Rs!mxRow), 0, (Rs!mxRow))
        Case "T":            Max_Value = IIf(IsNull(Rs!MxTier), 0, (Rs!MxTier))
        Case Else
            Rs.Close:               Set Rs = Nothing
            Chk_PartLoc = False:      Exit Function
    End Select
    Rs.Close:       Set Rs = Nothing
    
    If Location > 0 And Location <= Max_Value Then
        Chk_PartLoc = True
    Else
        MsgBox "�ٽ��Է��Ͻÿ�":        Chk_PartLoc = False
    End If
    
    Exit Function

ErrMsg:
    Chk_PartLoc = False
    MsgBox "�Լ�(Chk_Location) Error(tb_block)" & vbCrLf & Err.Description
End Function

'�ش� Block Check
Public Function Chk_AllLoc(Block_NM As String, Bay_No As String, Row_No As String, Tier_No As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim BayNo As Integer
'    Dim Row_No As Integer
'    Dim Tier_No As Integer
    
    Dim Max_Bay As Integer
    Dim Max_Row As Integer
    Dim Max_Tier As Integer
    
    If Trim(Block_NM) = "" Or Trim(Bay_No) = "" Or Trim(Row_No) = "" Or Trim(Tier_No) = "" Then
        MsgBox "�μ��� �ϳ��� �����Ǿ����ϴ�"
        Chk_AllLoc = False:        Exit Function
    End If
    
On Error GoTo ErrMsg
    
    BayNo = Int(Bay_No)
    Row_No = Int(Row_No)
    Tier_No = Int(Tier_No)
    
    SQL = "SELECT mxbay,mxrow,mxtier FROM tb_block"
    SQL = SQL & " WHERE block = '" & Trim(Block_NM) & "'"

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        Chk_AllLoc = False:        MsgBox "�����ϴ� BLOCK�� �ƴմϴ�"
        Rs.Close:       Set Rs = Nothing
        Exit Function
    End If
    
    Max_Bay = IIf(IsNull(Rs!MxBay), 0, (Rs!MxBay))
    Max_Row = IIf(IsNull(Rs!mxRow), 0, (Rs!mxRow))
    Max_Tier = IIf(IsNull(Rs!MxTier), 0, (Rs!MxTier))
    
    Rs.Close:       Set Rs = Nothing
    
    If (BayNo > 0 And BayNo <= Max_Bay) Then
        If (Row_No > 0 And Row_No <= Max_Row) Then
            If (Tier_No > 0 And Tier_No <= Max_Tier) Then
                Chk_AllLoc = True
            Else
                Chk_AllLoc = False:        MsgBox "�����ϴ� Tier�� �ƴմϴ�"
            End If
        Else
            Chk_AllLoc = False:        MsgBox "�����ϴ� Row�� �ƴմϴ�"
        End If
    Else
        Chk_AllLoc = False:        MsgBox "�����ϴ� Bay�� �ƴմϴ�"
    End If
    
    Exit Function

ErrMsg:
    Chk_AllLoc = False
    MsgBox "�Լ�(Chk_AllLoc) Error(tb_block)" & vbCrLf & Err.Description
End Function

'Teir���� �Է��ϸ� Hold/Deck���� ������
Public Function Chk_HoldDeck(Tier As String) As String     'H : Hold,  D:Deck,  E:Error,   "":Tier���� ����
    Dim Temp As Integer

    If Trim(Tier) = "" Then
        Chk_HoldDeck = "":           Exit Function
    End If
    
On Error GoTo Err:
    Temp = Val(Tier) Mod 2
    If Temp = 1 Then
        MsgBox "Tier���� Ȧ���� �Է��� �� �����ϴ�", 48, "Invalid Error"
        Chk_HoldDeck = "E":          Exit Function
    End If
    
    If Val(Tier) >= 2 And Val(Tier) <= 18 Then
        Chk_HoldDeck = "H"
    ElseIf Val(Tier) >= 82 And Val(Tier) <= 98 Then
        Chk_HoldDeck = "D"
    Else
        MsgBox "��ȿ�� Tier���� �ƴմϴ�", 48, "Invalid Error"
        Chk_HoldDeck = "E"
    End If

    Exit Function
Err:
    MsgBox "�Լ�(Chk_HoldDeck) Error", 48, "Invalid Error"
    Chk_HoldDeck = "E"
End Function

'  hiqubic, reefer, 8' �����̳����� CHK
'  ���� : chk_t_cubic(�����̳ʹ�ȣ, ���� , size, type)
'          ��ȯ�� : TRUE, FALSE
'                   size, type�� ����Ǿ� ����
'         ����: H:H/Q, R:R/F, L:8'
Function Chk_t_cubic(Cntr_no As String, gubun As String, SZ_CD As String, TY_CD As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset

On Error GoTo ErrMsg

    If gubun <> "H" And gubun <> "R" And gubun <> "L" And gubun <> "O" And gubun <> "P" Then
        Chk_t_cubic = False
        Exit Function
    End If

    SQL = "SELECT count(*) cnt" & _
          "  from t_cubic"

    SQL = SQL & " where cu_cntr like '" + Cntr_no + "%' "
    SQL = SQL & "   and cu_cd = '" & gubun & "'"

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        If Len(Cntr_no) > 6 Then
            Chk_t_cubic = Chk_t_cubic(Mid(Cntr_no, 1, Len(Cntr_no) - 1), gubun, SZ_CD, TY_CD)
            Exit Function
        Else  ' �������
            Select Case gubun
              Case "H"
                   If Mid(SZ_CD, 2, 1) = "4" Or Mid(SZ_CD, 2, 1) = "5" Then
                       SZ_CD = Mid(SZ_CD, 1, 1) & "3"
                   End If
              Case "R"
                   If Mid(TY_CD, 1, 1) = "3" Then
                       TY_CD = "1" & Mid(TY_CD, 2, 1)
                   End If
              Case "L"
                   If Mid(SZ_CD, 2, 1) = "0" Or Mid(SZ_CD, 2, 1) = "1" Then
                       If Mid(SZ_CD, 1, 1) = "2" Then
                           SZ_CD = "22"
                       ElseIf Mid(SZ_CD, 1, 1) = "4" Then
                           SZ_CD = "43"
                       End If
                   End If
            End Select
            
            Chk_t_cubic = False
        End If
    Else
        Rs.MoveFirst

        If Rs!Cnt = 0 Then
            If Len(Cntr_no) > 6 Then
                Chk_t_cubic = Chk_t_cubic(Mid(Cntr_no, 1, Len(Cntr_no) - 1), gubun, SZ_CD, TY_CD)
                Exit Function
            Else  ' �������
                Select Case gubun
                  Case "H"
                       If Mid(SZ_CD, 2, 1) = "4" Or Mid(SZ_CD, 2, 1) = "5" Then
                           SZ_CD = Mid(SZ_CD, 1, 1) & "3"
                       End If
                  Case "R"
                       If Mid(TY_CD, 1, 1) = "3" Then
                           TY_CD = "1" & Mid(TY_CD, 2, 1)
                       End If
                  Case "L"
                       If Mid(SZ_CD, 2, 1) = "0" Or Mid(SZ_CD, 2, 1) = "1" Then
                           If Mid(SZ_CD, 1, 1) = "2" Then
                               SZ_CD = "22"
                           ElseIf Mid(SZ_CD, 1, 1) = "4" Then
                               SZ_CD = "43"
                           End If
                       End If
                End Select
                
                Chk_t_cubic = False
            End If
        Else  ' �������
            Select Case gubun
              Case "H"
                   If Mid(SZ_CD, 2, 1) <> "4" And Mid(SZ_CD, 2, 1) <> "5" Then SZ_CD = Mid(SZ_CD, 1, 1) & "5"
              Case "R"
                   If Mid(TY_CD, 1, 1) <> "3" Then TY_CD = "3" & Mid(TY_CD, 2, 1)
              Case "L"
                   If Mid(SZ_CD, 2, 1) <> "0" And Mid(SZ_CD, 2, 1) <> "1" Then SZ_CD = Mid(SZ_CD, 1, 1) & "0"
              Case "O"
                   If Mid(TY_CD, 1, 1) <> "5" Then TY_CD = "5" & Mid(TY_CD, 2, 1)
              Case "P"
                   If Mid(TY_CD, 1, 1) <> "6" Then TY_CD = "6" & Mid(TY_CD, 2, 1)
            End Select
            
            Chk_t_cubic = True
        End If

        Rs.Close
        Set Rs = Nothing
    End If

    Exit Function

ErrMsg:
    Chk_t_cubic = False
'    Unload frmMesg: frmMesg.ssMSG.Caption = "�Լ�(chk_t_hicubic) Error(t_hiqubic)"
'    frmMesg.Show 1
End Function
'20020316
Public Function Check_ShipBay(argBay As String) As String
    Dim Temp As Integer
    
    Select Case Len(argBay)
        Case 0
            Check_ShipBay = "00"
        Case 1
            Check_ShipBay = Format(argBay, "00")
        Case 2
            Temp = Asc(Mid(argBay, 2, 1))
            If Temp > 47 And Temp < 58 Then  ''�����̸�
                Check_ShipBay = Trim(argBay)
            Else
                Check_ShipBay = Format(Mid(argBay, 1, 1), "00") & Mid(argBay, 2, 1)
            End If
        Case 3
            Check_ShipBay = Trim(argBay)
    End Select
End Function



Public Function Check_Feeder(ShipCode As String, CallNo As String, CallYear As String) As String
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    SQL = "SELECT feeder, oper_cd "
    SQL = SQL & "From t_vescall "
    SQL = SQL & "WHERE ship_cd = '" & ShipCode & "' "
    SQL = SQL & "AND call_no = '" & CallNo & "' "
    SQL = SQL & "AND call_yy = '" & CallYear & "' "
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        Check_Feeder = "SKIP"
    Else
        If Rs!feeder = "Y" Then
            If Rs!Oper_Cd = "EAS" Then
                Check_Feeder = "FE1"
            ElseIf Rs!Oper_Cd = "COH" Then
                Check_Feeder = "FE2"
            ElseIf Rs!Oper_Cd = "COS" Or Rs!Oper_Cd = "CMA" Or Rs!Oper_Cd = "HJS" Then
                Check_Feeder = "SKIP"
            End If
        Else
            Check_Feeder = "SKIP"
        End If
        
    End If

    Rs.Close
    Set Rs = Nothing
    
End Function


'create by signal (02.05.15)------------------
Public Function GetSysDateTime() As String
    Dim strQry As String
    Dim strSysDate As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrHandler
    
    'GET SYSTEM TIME-----------------------------------------
    strQry = "SELECT to_char(sysdate, 'YYYYMMDDHH24MISS') FROM dual"
    Set Rs = New ADODB.Recordset
    Rs.Open strQry, G_Host_Con

    If Rs.EOF Then
        'MsgBox "�ý��� �ð��� �� �� �����ϴ�!!"
        GetSysDateTime = CStr(Format(Date, "YYYYMMDDHHMMSS"))
        Exit Function
    End If

    Rs.MoveFirst
    strSysDate = Rs(0).value
    
    Rs.Close
    Set Rs = Nothing
    
    GetSysDateTime = strSysDate

    'CHANG PRIVATE COMPUTER TIME(ONLY TIME)----------------------------
    'TO FILL CODE
                
    Exit Function

ErrHandler:
    MsgBox "GetSysDateTime" & vbCrLf & Err.Description
End Function
'^^create by signal (02.05.15)----

'�ý��۳�¥�� �ð��� ���� ���ڿ��� ��ȯ
Public Function GetSysdateToChar(Optional Cd$) As String
  Dim SQL$
  Dim Rs As ADODB.Recordset
  Dim rtnValue As Date

  SQL = "SELECT sysdate as DTTM FROM dual"
  Set Rs = New ADODB.Recordset
  Rs.Open SQL, G_Host_Con
  
  rtnValue = Rs!dttm
  
  If Cd = "" Then
    GetSysdateToChar = Format(rtnValue, "YYYYMMDDHHMMSS")
  Else
    GetSysdateToChar = Format(rtnValue, Cd)
  End If

  Rs.Close
  Set Rs = Nothing
    
End Function


'---CREATE BY J.W. Kim (03.03.17)------------------
Public Function ChkOverstorage(strCntr_no As String, strDup_no As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrHandler
    
    
    'GET FREETIME TIME-----------------------------------------
''''    Sql = "SELECT NVL(to_char(stv_end_dt,'YYYYMMDDHH24MISS'),'OK'), "
''''    Sql = Sql & "(SYSDATE - DECODE(f_freeday('" & strCntr_No & "','" & strDup_No & "'),'0',SYSDATE,to_date(f_freeday('" & strCntr_No & "','" & strDup_No & "'),'YYYYMMDDHH24MISS'))), "
''''    Sql = Sql & "NVL(CASH_DAY,'0') - (NVL(GOUT_DT,SYSDATE) - DECODE(f_freeday('" & strCntr_No & "','" & strDup_No & "'),'0',SYSDATE,to_date(f_freeday('" & strCntr_No & "','" & strDup_No & "'),'YYYYMMDDHH24MISS'))), "
''''    Sql = Sql & "f_freeday('" & strCntr_No & "','" & strDup_No & "')  "
''''    Sql = Sql & "FROM t_vescall a, t_cntr b "
''''    Sql = Sql & "WHERE a.ship_cd = b.ship_cd "
''''    Sql = Sql & "AND a.call_no = b.call_no "
''''    Sql = Sql & "AND a.call_yy = b.call_yy "
''''    Sql = Sql & "AND b.cntr_no = '" & strCntr_No & "' "
''''    Sql = Sql & "AND b.dup_no = '" & strDup_No & "' "




    SQL = "SELECT NVL(to_char(stv_end_dt,'YYYYMMDDHH24MISS'),'OK') Stv_End_Dt, "
    SQL = SQL & "dpctos.F_FREEDAYADDBOND(b.cntr_no,b.dup_no,b.bond_id,null) F_FREEDAY , "
    SQL = SQL & "NVL(CASH_DAY,'0') CASH_DAY, "
    SQL = SQL & "TO_CHAR(NVL(gout_dt,SYSDATE),'YYYYMMDDHH24MISS') GOUT_DT, "
    SQL = SQL & "NVL(c.hyunsu,'X') SHIP_CHK, "
    SQL = SQL & "NVL(d.hyunsu,'X') OPER_CHK, "
    SQL = SQL & "FROM t_vescall a, t_cntr b, t_vessel c, t_oper d "
    SQL = SQL & "WHERE a.ship_cd = b.ship_cd "
    SQL = SQL & "AND a.call_no = b.call_no "
    SQL = SQL & "AND a.call_yy = b.call_yy "
    SQL = SQL & "AND b.cntr_no = '" & strCntr_no & "' "
    SQL = SQL & "AND b.dup_no = '" & strDup_no & "' "
    SQL = SQL & "AND b.ship_cd = c.ship_cd "
    SQL = SQL & "AND b.oper_cd = d.oper_cd "
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        ChkOverstorage = False
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If

    Rs.MoveFirst
    
    ' // �� �۾����ΰ�� OK
    If Rs(0).value = "OK" Then
        ChkOverstorage = True
        G_Freeday = Rs(3)
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If
    '// FREETIME�� ���� ���� ��� OK
    If Rs(1).value <= 0 Then
        ChkOverstorage = True
        G_Freeday = Rs(3)
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If
    '// ��� ������ ���� ���
    If Rs(2).value >= 0 Then
        ChkOverstorage = True
        G_Freeday = Rs(3)
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If
                
    Exit Function

ErrHandler:
    Resume Next
End Function

Public Function Chk_Start_date(ship_cd As String, Cntr_no As String) As String
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim strShip_cd As String
    Dim strCall_no As String
    Dim strCall_yy As String
    Dim strCntr_no As String
    
    
On Error GoTo ErrHandler

    strShip_cd = Mid(ship_cd, 1, 4)
    
    strCall_yy = Mid(ship_cd, 5, 4)
    strCall_no = Mid(ship_cd, 9, 2)
    strCntr_no = Cntr_no



    SQL = "SELECT gc_ddt "
    SQL = SQL & "FROM t_cntr "
    SQL = SQL & "WHERE ship_cd = '" & strShip_cd & "' "
    SQL = SQL & "AND call_no = '" & strCall_no & "'  "
    SQL = SQL & "AND call_yy = '" & strCall_yy & "' "
    SQL = SQL & "AND cntr_no = '" & strCntr_no & "' "
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        Chk_Start_date = "--------"
        Rs.Close
        Set Rs = Nothing
        Exit Function
    End If

    Rs.MoveFirst
    Chk_Start_date = IIf(IsNull(Rs!gc_ddt), "--------", Rs!gc_ddt)
    Rs.Close
    Set Rs = Nothing

    Exit Function
ErrHandler:
    Resume Next
End Function



'------------------------------- ���������� ���� �Լ�
'----------------------------------------------------------------------------------------------------------
' ��  �� : �������� Row�� Col�� �޾Ƽ� �������尪 ��ȯ
' ��  �� : 2003.10.20 / �� �� ȣ
'----------------------------------------------------------------------------------------------------------
Public Function Get_Text(ByRef arg_Spread As vaSpread, _
                                    ByVal arg_Row As Integer, _
                                    ByVal arg_col As Integer)
    arg_Spread.Row = arg_Row
    arg_Spread.Col = arg_col
    
    Get_Text = Trim(arg_Spread.Text)
    
End Function

'Get_Value
Public Function Get_Value(ByRef arg_Spread As vaSpread, ByVal arg_Row As Integer, ByVal arg_col As Integer)
    With arg_Spread
        .Row = arg_Row: .Col = arg_col
        Get_Value = .value
    End With
End Function
'------------------------------------------------------------------------------
'   ��  �� : Query�� �迭�� �޾Ƽ� �����  2���� �迭�� ����.
'   ��ȯ�� : ���� : (1)
'            Query ������� ������� (0)
'            ���� : (-1)
'
'  �ۼ��� : ���ȣ
'  �ۼ��� : 2004.11.10
'------------------------------------------------------------------------------
Public Function db_Select_A2(ByVal arg_Query As String, _
                            ByRef arg_array() As Variant, _
                            Optional arg_RowCnt As Long) As Long
    Dim Rs As ADODB.Recordset
    Dim SQL As String

    Dim Column() As Object
    Dim RowCount As Long, ColCount As Long
    Dim i As Long, j As Long
    
    '�����߻��� ������ ������ƾ�� �����ϴ� �κ�
    
    On Error GoTo ErrHandler
    
    'Selet Query�� �����ϴ� �κ�
    
    Set Rs = New ADODB.Recordset
    Rs.Open arg_Query, G_Host_Con
    
    If Rs.EOF Then
        db_Select_A2 = 0
        Rs.Close
        Set Rs = Nothing
        Exit Function
    Else
    
        'ColCount = OraDynaset.Fields.Count
        ColCount = Rs.Fields.Count
        RowCount = Rs.RecordCount
        
    '����� ���� ����� ó��
        
        If RowCount = 0 Then
        
            ReDim arg_array(0, 0)
            db_Select_A2 = 0
            Exit Function
            
        End If
        
    '����� ���� ��� ����� Array�� �ִ� �κ�
        
        '���� : Column�� ����ϴ°� Fields�� ���� ����ϴ� �ͺ��� ����.
        
        ReDim Column(0 To ColCount - 1)
    
        For i = 0 To ColCount - 1
            Set Column(i) = Rs.Fields(i)
        Next i
        
    '����� �о�� �迭�� �ִ� �κ�
        
        '�迭�� ������ �������� �ʾ��� ���
        
        If IsNull(arg_RowCnt) Or arg_RowCnt = 0 Then
        
            ReDim arg_array(1 To RowCount, 1 To ColCount)
        
            For i = 1 To RowCount
                
                For j = 1 To ColCount
                    
                    arg_array(i, j) = IIf(IsNull(Column(j - 1).value), "", Column(j - 1).value)
                    
                Next j
                
                Rs.MoveNext
                
            Next i
        
        '�迭�� ������ �������� ���
        
        Else
        
            ReDim arg_array(1 To arg_RowCnt, 1 To ColCount)
        
            For i = 1 To arg_RowCnt
                
                'Query�� ����� ������ ������ �迭�� �������� ũ�ų� ���� ���
                
                If RowCount >= arg_RowCnt Then
                
                    For j = 1 To ColCount
                        
                        arg_array(i, j) = IIf(IsNull(Column(j - 1).value), "", Column(j - 1).value)
                        
                    Next j
                    
                    Rs.MoveNext
                
                'Query�� ����� ������ ������ �迭�� �������� ���� ���
                
                Else
                
                    If RowCount >= i Then
                    
                        For j = 1 To ColCount
                            
                            arg_array(i, j) = IIf(IsNull(Column(j - 1).value), "", Column(j - 1).value)
                            
                        Next j
                    
                        Rs.MoveNext
                    
                    Else
                    
                        For j = 1 To ColCount
                            
                            arg_array(i, j) = ""
                            
                        Next j
                    
                    End If
                    
                End If
                
            Next i
            
        End If
        
        Rs.Close
        Set Rs = Nothing
        'Function�� ������� ��ȯ�ϴ� �κ�
    End If
        db_Select_A2 = 1
    
    Exit Function
    
'������ ó���ϴ� �κ�

ErrHandler:

    db_Select_A2 = -1
    
    Rs.Close
    Set Rs = Nothing
    MsgBox "SpreadMod/db_Select_A2 Error" & vbCrLf & "Error No : " & CStr(Err.number) & vbCrLf & Err.Description, , "Warning"
    Exit Function

End Function

'��� �������� PGM ��� ���θ� ���� Chk �Ѵ�.
'20050610
Public Function ChkValid() As Boolean

On Error GoTo ErrHandler
  If G_GroupID = "XXX" Then ChkValid = True: Exit Function   '�����
  If G_GroupID = "CCC" Then ChkValid = True: Exit Function   '��Ÿ
  If G_UserID = "030805" Then ChkValid = True: Exit Function '�����
  If G_UserID = "020201" Then ChkValid = True: Exit Function '������
  If G_UserID = "011101" Then ChkValid = True: Exit Function '��ȯ��
  If G_UserID = "011102" Then ChkValid = True: Exit Function '������
  If G_UserID = "050107" Then ChkValid = True: Exit Function '������

  ChkValid = False

  Exit Function
ErrHandler:
  ChkValid = False
End Function

Public Function NullTrim(ss)

   On Error Resume Next

    If IsNull(ss) Then
        NullTrim = ""
    Else
        NullTrim = Trim(ss)
    End If

End Function

Public Function NullTrim_Num(ss)

   On Error Resume Next

    If IsNull(ss) Then
        NullTrim_Num = "0"
    ElseIf Trim(ss) = "" Then
        NullTrim_Num = "0"
    Else
        NullTrim_Num = Trim(ss)
    End If

End Function

Public Function HoldOldVan(strCntrNo$, strDupNo$, strGubun$) As Boolean
  Dim SQL As String
  Dim Rs As ADODB.Recordset

On Error GoTo ErrHandler

  SQL = "SELECT *"
  SQL = SQL & "  FROM t_cnfix"
  SQL = SQL & " WHERE '" & strCntrNo & "' BETWEEN frm_fix AND to_fix AND del_dt IS NULL"

  Set Rs = New ADODB.Recordset
  Rs.Open SQL, G_Host_Con

  If Rs.EOF Then
    Rs.Close
    Set Rs = Nothing
    HoldOldVan = True
    Exit Function
  Else
    If HoldRegisterAuto(strCntrNo, strDupNo, "F", "�Ű����", Now, strGubun) = True Then
      HoldOldVan = True
    Else
      HoldOldVan = False
    End If
  End If
  
  Exit Function
ErrHandler:
  HoldOldVan = False
End Function

Private Function HoldRegisterAuto(ByVal astrCntr As String, ByVal astrDupNo As String, _
                                ByVal astrHoldCd As String, ByVal astrRemark As String, ByVal adatDate As Date, _
                                ByVal astrEmp As String) As Boolean
  Dim strQry$, strTxMode$
  Dim intTx%
  Dim Rs As ADODB.Recordset
   
On Error GoTo ErrHandler

  HoldRegisterAuto = False
  
  '1st checking inserting or updating in T_Holding----------------
  strQry = "select count(*) from t_holding "
  strQry = strQry & "where "
  strQry = strQry & "cntr_no = '" & astrCntr & "' "
  strQry = strQry & "and dup_no = '" & astrDupNo & "' "
  strQry = strQry & "and group_id = 'OOO' "
  strQry = strQry & "AND hold_cd = '" & astrHoldCd & "'"
  strQry = strQry & "AND release_dt is null"
  
  Set Rs = New ADODB.Recordset
  Rs.Open strQry, G_Host_Con
                  
  If CInt(Rs(0).value) = 0 Then
      strTxMode = "I"
  Else
      strTxMode = "U"
  End If

  Rs.Close: Set Rs = Nothing
    
    '2nd Do
  If strTxMode = "I" Then
    'do execute
    strQry = "insert into t_holding "
    strQry = strQry & "(cntr_no, dup_no, group_id, hold_cd, "
    strQry = strQry & "remark, hold_dt, hold_emp) "
    strQry = strQry & "values "
    strQry = strQry & "('" & astrCntr & "', "
    strQry = strQry & "'" & astrDupNo & "', "
    strQry = strQry & "'OOO', "
    strQry = strQry & "'" & astrHoldCd & "', "
    strQry = strQry & "'" & astrRemark & "', "
    strQry = strQry & "to_date('" & Format(adatDate, "yyyy-mm-dd hh:mm") & "', 'yyyy-mm-dd hh24:mi'), "
    strQry = strQry & "'" & astrEmp & "' "
    strQry = strQry & ") "
    
    Call G_Host_Con.Execute(strQry, intTx)
  Else
    strQry = "update t_holding set "
    strQry = strQry & "hold_cd = '" & astrHoldCd & "', "
    strQry = strQry & "remark = '" & astrRemark & "', "
    strQry = strQry & "hold_dt = to_date('" & Format(adatDate, "yyyy-mm-dd hh:mm") & "', 'yyyy-mm-dd hh24:mi'), "
    strQry = strQry & "hold_emp = '" & astrEmp & "', "
    strQry = strQry & "release_dt = '', "
    strQry = strQry & "release_emp = '' "
    strQry = strQry & "where "
    strQry = strQry & "cntr_no = '" & astrCntr & "' "
    strQry = strQry & "and dup_no = '" & astrDupNo & "' "
    strQry = strQry & "and group_id = 'OOO' "
    strQry = strQry & "AND hold_cd = '" & astrHoldCd & "'"
    
    Call G_Host_Con.Execute(strQry, intTx)
  End If
  
  't_cntr asych....
  If intTx > 0 Then
    strQry = "update t_cntr set "
    strQry = strQry & "hold_cd = '*' "
    strQry = strQry & "where "
    strQry = strQry & "cntr_no = '" & astrCntr & "' "
    strQry = strQry & "and dup_no = '" & astrDupNo & "' "
    Call G_Host_Con.Execute(strQry, intTx)
  End If
        '^^
  If intTx > 0 Then HoldRegisterAuto = True

  Exit Function
ErrHandler:
  HoldRegisterAuto = False
  Resume Next
End Function

'Add By ChuHan,  20060330, ���賯¥�� ������11�ϱ��� ����
'��� PGM���� ����� Data ������ �����ڷ� FIX�Ǿ� �����Ұ����� ��¥ üũ
Public Function ChkUpdateDate(strDate As String) As Boolean
    Dim strFromDate As String
    Dim strToDate As String
    
    Call GetHostDateTime

    strFromDate = Mid(strDate, 1, 6) 'YYYYMM
    strToDate = Format(DateSerial(Mid(strDate, 1, 4), Mid(strDate, 5, 2) + 1, 1), "YYYYMM")
    
    If G_CurrentDate > strFromDate & "00" And G_CurrentDate <= strToDate & "10" Then
        ChkUpdateDate = True
    Else
        ChkUpdateDate = False
    End If
    
End Function


'on dock booking count
'sIO => IN : �� ����, OT : �� ����, IC : �� ���� ���, OC : �� ���� ���
Public Function SetBkCount(sCntr$, iDup%, sIO$) As Boolean
  Dim SQL$
  Dim gRs As New ADODB.Recordset
  Dim sOndock$, sBkNo$, sFm_cd$, sDpctBkNo$, sTmpSz$, sTmpTp$, sOper$, sSz$, sTp$
On Error GoTo ErrMsg
  'Booking No. ��ȸ
  
  If sIO = "OT" Or sIO = "IC" Or sIO = "OC" Then
    SQL = "select (select ondock from t_oper where oper_cd = a.oper_cd), bk_no, fm_cd, sz_cd, ty_cd "
    SQL = SQL & "  from t_cntr a "
    SQL = SQL & " where cntr_no = '" & sCntr & "' and dup_no = '" & iDup & "'"
  ElseIf sIO = "IN" Then
    SQL = "select (select ondock from t_oper where oper_cd = a.oper_cd), "
    SQL = SQL & "       bk_no, "
    SQL = SQL & "       fm_cd, "
    SQL = SQL & "       sz_cd, "
    SQL = SQL & "       ty_cd "
    SQL = SQL & "  from t_gate a "
    SQL = SQL & " where cntr_no = '" & sCntr & "' and "
    SQL = SQL & "       io_cd = 'I' and "
    SQL = SQL & "       upd_cd is null "
    SQL = SQL & "       and rownum = 1"
  End If

  Set gRs = G_Host_Con.Execute(SQL)
        
  If Not gRs.EOF Then
    gRs.MoveFirst
    sOndock = NullTrim(gRs(0))
    sBkNo = NullTrim(gRs(1))
    sFm_cd = NullTrim(gRs(2))
    sTmpSz = NullTrim(gRs(3))
    sTmpTp = NullTrim(gRs(4))
  End If
  gRs.Close
  
  '���ǿ� ���� �ʴ� ���
  If sOndock = "N" Then: SetBkCount = True: Exit Function
  
  If sBkNo = "" Then: SetBkCount = True: Exit Function
  
  Select Case sIO
    Case "IN", "IC"
      If sFm_cd = "M" Then SetBkCount = True: Exit Function
    Case "OT", "OC"
      If sFm_cd = "F" Then SetBkCount = True: Exit Function
  End Select

  'Booking ��ȸ
  SQL = "select oper_cd, dpctbk_no from t_bkmst where bk_no = '" & sBkNo & "' "
  Set gRs = G_Host_Con.Execute(SQL)

  If Not gRs.EOF Then
    gRs.MoveFirst
    sOper = NullTrim(gRs(0))
    sDpctBkNo = NullTrim(gRs(1))
  Else
    SetBkCount = True
    gRs.Close
    Exit Function
  End If
  gRs.Close

  Select Case Mid(sTmpSz, 1, 1)
    Case "2"
      sSz = "20"
    Case "4"
      If sTmpSz = "44" Or sTmpSz = "45" Then
        sSz = "HC"
      Else
        sSz = "40"
      End If
    Case Else
      sSz = "45"
  End Select
  
  Select Case Mid(sTmpTp, 1, 1)
    Case "0", "1", "2", "G", "V", "S"
      sTp = "DR"
    Case "3", "4", "R", "H"
      sTp = "RF"
    Case "5", "U"
      sTp = "OT"
    Case "6", "P"
      sTp = "FR"
    Case "7", "T"
      sTp = "TK"
  End Select

  'Booking List ó��   -- M'ty ������ҽô� ���α׷����� ó��
  If sIO = "OC" And sFm_cd = "M" Then
    SQL = "delete from t_bklst "
    SQL = SQL & " where dpctbk_no = '" & sDpctBkNo & "' and "
    SQL = SQL & "       cntr_no = '" & sCntr & "' and "
    SQL = SQL & "       dup_no = '" & iDup & "' and "
    SQL = SQL & "       bk_no = '" & sBkNo & "'"
  
    G_Host_Con.Execute (SQL)
  End If
  
  'Booking Count
  SQL = "update t_bkdtl "
  If sIO = "IN" And sFm_cd = "F" Then
    SQL = SQL & "   set banchul_amt   = nvl(banchul_amt, 0) , "
    SQL = SQL & "       mibanchul_amt = nvl(mibanchul_amt, bk_aamt) , "
    SQL = SQL & "       banip_amt     = nvl(banip_amt, 0) + 1, "
    SQL = SQL & "       mibanip_amt   = nvl(banchul_amt, 0) - nvl(banip_amt, 0) - 1 "
  ElseIf sIO = "OT" And sFm_cd = "M" Then
    SQL = SQL & "   set banchul_amt   = nvl(banchul_amt, 0) + 1, "
    SQL = SQL & "       mibanchul_amt = nvl(mibanchul_amt, bk_aamt) - 1, "
    SQL = SQL & "       banip_amt     = nvl(banip_amt, 0), "
    SQL = SQL & "       mibanip_amt   = nvl(banchul_amt, 0) - nvl(banip_amt, 0) + 1 "
  ElseIf sIO = "OC" And sFm_cd = "M" Then
    SQL = SQL & "   set banchul_amt   = nvl(banchul_amt, 0) - 1, "
    SQL = SQL & "       mibanchul_amt = nvl(mibanchul_amt, bk_aamt) - 1, "
    SQL = SQL & "       banip_amt     = nvl(banip_amt, 0) , "
    SQL = SQL & "       mibanip_amt   = nvl(banchul_amt, 0) - nvl(banip_amt, 0) - 1 "
  ElseIf sIO = "IC" And sFm_cd = "F" Then
    SQL = SQL & "   set banchul_amt   = nvl(banchul_amt, 0) , "
    SQL = SQL & "       mibanchul_amt = nvl(mibanchul_amt, bk_aamt) , "
    SQL = SQL & "       banip_amt     = nvl(banip_amt, 0) - 1, "
    SQL = SQL & "       mibanip_amt   = nvl(banchul_amt, 0) - nvl(banip_amt, 0) + 1 "
  End If
  SQL = SQL & " where oper_cd = '" & sOper & "' and "
  SQL = SQL & "       bk_no = '" & sBkNo & "' and "
  SQL = SQL & "       dpctbk_no = '" & sDpctBkNo & "' and "
  SQL = SQL & "       p_szg = '" & sSz & "' and "
  SQL = SQL & "       p_tpg = '" & sTp & "'"
  G_Host_Con.Execute (SQL)
  
  
  If sIO = "OT" And sFm_cd = "M" Then
    SQL = "INSERT INTO t_bklst"
    SQL = SQL & "  (oper_cd,"
    SQL = SQL & "   dpctbk_no,"
    SQL = SQL & "   cntr_no,"
    SQL = SQL & "   dup_no,"
    SQL = SQL & "   bk_no,"
    SQL = SQL & "   upd_dt,"
    SQL = SQL & "   sz_cd,"
    SQL = SQL & "   ty_grp_cd,"
    SQL = SQL & "   p_szg,"
    SQL = SQL & "   p_tpg) "
    SQL = SQL & "VALUES"
    SQL = SQL & "  ('" & sOper & "',"
    SQL = SQL & "   '" & sDpctBkNo & "',"
    SQL = SQL & "   '" & sCntr & "',"
    SQL = SQL & "   '" & iDup & "',"
    SQL = SQL & "   '" & sBkNo & "',"
    SQL = SQL & "   sysdate,"
    SQL = SQL & "   '" & sTmpSz & "',"
    SQL = SQL & "   '" & sTmpTp & "',"
    SQL = SQL & "   '" & sSz & "',"
    SQL = SQL & "   '" & sTp & "')"
    
    G_Host_Con.Execute (SQL)
  End If
  
  
  SetBkCount = True
  Exit Function
ErrMsg:
  SetBkCount = False
End Function


'Xray �˻��� �����Է� �ڷ� Update(2009.04.16) ������
Public Sub SetXray(sShip$, sCall$, sYear$)
  Dim SQL$
  On Error GoTo ErrCode
  
  SQL = "update t_cntr" & vbCrLf
  SQL = SQL & "   set xray_cd = 'S'" & vbCrLf
  SQL = SQL & " where (cntr_no, dup_no) in" & vbCrLf
  SQL = SQL & "       (select cntr_no, dup_no" & vbCrLf
  SQL = SQL & "          from t_inspect" & vbCrLf
  SQL = SQL & "         where ship_cd = '" & sShip & "' and" & vbCrLf
  SQL = SQL & "               call_no = '" & sCall & "' and" & vbCrLf
  SQL = SQL & "               call_yy = '" & sYear & "' and" & vbCrLf
  SQL = SQL & "               gubun = '4') and" & vbCrLf
  SQL = SQL & "       cur_stat like '%B'"
  
  Call G_Host_Con.Execute(SQL)
  Exit Sub
  
ErrCode:
  Resume Next
End Sub


'��� ���� Ȯ��
Public Sub Get_EqCNT(sYear As String, sMonth As String)
    Dim SQL As String
    Dim Rs As ADODB.Recordset
        
On Error GoTo ErrMsg
        
    SQL = "select sum(decode(substr(eq_no,1,1),1,1,0)) GC,"
    If Val(sYear & sMonth) <= 201103 Then
      SQL = SQL & "       '4' TC,"
      SQL = SQL & "       '12' TCE,"
      SQL = SQL & "       '36' YT,"
    ElseIf Val(sYear & sMonth) <= 201108 Then
      SQL = SQL & "       '7' TC,"
      SQL = SQL & "       '12' TCE,"
      SQL = SQL & "       '40' YT,"
    ElseIf Val(sYear & sMonth) >= 201111 Then
      SQL = SQL & "       sum(decode(substr(eq_no, 1, 1)||substr(eq_mod, 1, 1), '2R', 1, 0)) TC,"
      SQL = SQL & "       sum(decode(substr(eq_no, 1, 1)||substr(eq_mod, 1, 1), '2E', 1, 0)) TCE,"
      SQL = SQL & "       '39' YT,"
    Else
      SQL = SQL & "       sum(decode(substr(eq_no, 1, 1)||substr(eq_mod, 1, 1), '2R', 1, 0)) TC,"
      SQL = SQL & "       sum(decode(substr(eq_no, 1, 1)||substr(eq_mod, 1, 1), '2E', 1, 0)) TCE,"
      SQL = SQL & "       sum(decode(substr(eq_no,1,1),3,1,0)) YT,"
    End If
    
    SQL = SQL & "       sum(decode(substr(eq_no,1,2),'50',1,0)) RS,"
    
    SQL = SQL & "       sum(decode(substr(eq_no,1,1),7,1,0)) YC,"
    SQL = SQL & "       sum(decode(substr(eq_no,1,1),6,1,0)) SYTC,"
    SQL = SQL & "       sum(decode(substr(eq_no,1,2),'51',1,0)) RenTC"
    
    SQL = SQL & "    from t_equi"
    
    
    
    ' 160203 �Ѽ��� ���α׷� ����
    ' > ���� �κп� R/S 503ȣ�� �߰��Ͽ� �� ��� ������ ǥ���� 503ȣ����� ���� ( ��: 3 -> 2 ) ��հ��� ���������� ����
    ' > R/S 503ȣ���� �����ʹ� 20140418 ���� �����Ͱ� �����ϹǷ� 20140418 ���Ĵ� 503ȣ�� ���� �����ϰ� ��񰳼��� ����
    'Sql = Sql & "  where eq_no not in ('505')"
    If Val(sYear & sMonth) >= 201405 Then
      SQL = SQL & "  where eq_no not in ('505', '503')"
    Else
      SQL = SQL & "  where eq_no not in ('505', '506', '507', '508')"
    End If
    
    SQL = SQL & "        and end_dt is null"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    If Rs.EOF Then
        MsgBox "Data�� �������� �ʽ��ϴ�."
        Rs.Close:       Set Rs = Nothing
        Exit Sub
    End If
    
'    ' 160205 �Ѽ��� �߰�
'    Dim rsCnt As Integer
'
'    With Rs
'        If Not (.BOF And .EOF) Then
'            Do While Not .EOF
'                If Mid(Rs!EQ_NO, 1, 1) = "5" Then
'                     If Rs!EQ_NO = "503" And Rs!Rs = "1" Then
'                        rsCnt = rsCnt - 1
'                    ElseIf Rs!EQ_NO = "501" Or Rs!EQ_NO = "502" Then
'                        rsCnt = rsCnt + 1
'                    End If
'                End If
'            .MoveNext
'           Loop
'        End If
'    End With

'   G_RSCNT = CStr(rsCnt)

    G_GCCNT = Rs!GC
    G_TCCNT = Rs!TC
    G_TCECNT = Rs!TCE
    G_YTCNT = Rs!YT
    G_RSCNT = Rs!Rs
    G_YCCNT = Rs!YC   ' YC�� 76����.
    G_SYCNT = Rs!SYTC '�ſ�CY��񰳼�
    G_RENCNT = Rs!RENTC '�뿩��񰳼�
    
    Rs.Close:       Set Rs = Nothing
    
    Exit Sub

ErrMsg:
    MsgBox "�Լ�(Chk_AllLoc) Error(tb_block)" & vbCrLf & Err.Description
End Sub

Public Function GetBoSek(ByVal b_Color As Long) As Long
  Dim rc As Long
  Dim GC As Long
  Dim BC As Long
  rc = b_Color Mod &H100             'Long Type Color���� RGB Red����
  GC = (b_Color \ &H100) Mod &H100   'Long Type Color���� RGB Green Color ����
  BC = (b_Color \ &H10000) Mod &H100 'Long Type Color���� RGB Blue Color ����

  GetBoSek = RGB(255 - rc, 255 - GC, 255 - BC)  '������ ����
End Function


'��� Gross �۾� �ð�
Public Function Get_EqWorkTime(sEqno$, sJoUman$, sDaynight$, fromDt$, toDt$) As String
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim GrossWkTm As String
        
On Error GoTo ErrMsg
    
    SQL = "select nvl(sum(trunc((decode(sign(to_date('" & toDt & "', 'yyyymmddhh24miss') - it_end_dt),"
    SQL = SQL & "                          -1,"
    SQL = SQL & "                          to_date('" & toDt & "', 'yyyymmddhh24miss'),"
    SQL = SQL & "                          it_end_dt) -"
    SQL = SQL & "                  decode(sign(it_bgn_dt - to_date('" & fromDt & "', 'yyyymmddhh24miss')),"
    SQL = SQL & "                          -1,"
    SQL = SQL & "                          to_date('" & fromDt & "', 'yyyymmddhh24miss'),"
    SQL = SQL & "                          it_bgn_dt)) * 24,"
    SQL = SQL & "                  2)), 0) gross_wk_tm"
    SQL = SQL & "   from t_eqstop"
    SQL = SQL & "  where it_rsn_cd = '11' and"
    SQL = SQL & "        it_bgn_dt <= to_date('" & toDt & "', 'yyyymmddhh24miss') and"
    SQL = SQL & "        it_end_dt >= to_date('" & fromDt & "', 'yyyymmddhh24miss')"
    If sEqno <> "" Then
      SQL = SQL & "      and  eq_no = '" & sEqno & "'"
    End If
    If sJoUman <> "" Then
      SQL = SQL & "      and  jo_uman = '" & sJoUman & "'"
    End If
    If sDaynight <> "" Then
      SQL = SQL & "      and  daynight = '" & sDaynight & "'"
    End If
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con, adOpenForwardOnly
    
    If Rs.EOF Then
        GrossWkTm = 0
    Else
        Rs.MoveFirst
        GrossWkTm = Rs!gross_wk_tm
    End If

    Rs.Close
    Set Rs = Nothing
    
    
    SQL = "select nvl(sum(trunc((decode(sign(to_date('" & toDt & "', 'yyyymmddhh24miss') - sysdate),"
    SQL = SQL & "                          -1,"
    SQL = SQL & "                          to_date('" & toDt & "', 'yyyymmddhh24miss'),"
    SQL = SQL & "                          sysdate) - it_bgn_dt) * 24,"
    SQL = SQL & "                  2)), 0) gross_wk_tm"
    SQL = SQL & "   from t_eqwork"
    SQL = SQL & "  where it_bgn_dt <= to_date('" & toDt & "', 'yyyymmddhh24miss') and"
    SQL = SQL & "        it_bgn_dt >= to_date('" & fromDt & "', 'yyyymmddhh24miss') and"
    SQL = SQL & "        it_end_dt is null"
    If sEqno <> "" Then
      SQL = SQL & "      and  eq_no = '" & sEqno & "'"
    End If
    If sJoUman <> "" Then
      SQL = SQL & "      and  jo_uman = '" & sJoUman & "'"
    End If
    If sDaynight <> "" Then
      SQL = SQL & "      and  daynight = '" & sDaynight & "'"
    End If
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con, adOpenForwardOnly
    
    If Rs.EOF Then
    Else
        Rs.MoveFirst
        GrossWkTm = GrossWkTm + Rs!gross_wk_tm
    End If

    Rs.Close
    Set Rs = Nothing
    
    
    Get_EqWorkTime = GrossWkTm
    
    Exit Function

ErrMsg:
    MsgBox "�Լ�(Get_EqWorkTime) Error" & vbCrLf & Err.Description
End Function


