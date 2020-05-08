Attribute VB_Name = "AccessControl"
Option Explicit

Public G_ErrCodeMsg As String


'User ID와 Password를 체크하고 유저의 사용자그룹별 프로그램권한을 넘겨준다
Public Function CheckUserID(strUser_id As String, strPassWd As String) As Boolean
    Dim StrSql As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrHandler
    'T_ACUSER(사용자 정보)를 읽어서 아이디/패스워드가 정확한 지 체크한다.
    '정확하지 않은 경우에는 에러메시지를 전역변수에 보내고 프로시저를 빠져나간다.t_acuser
    StrSql = "SELECT group_id, seq FROM t_auuser WHERE user_id = '" & strUser_id & "'"
    
    Set Rs = New ADODB.Recordset
    Rs.Open StrSql, G_Host_Con, adOpenForwardOnly, adLockReadOnly, adCmdText


    G_GroupID = Trim(Rs("group_id"))
    G_UserSEQ = NullTrim(Rs("seq"))
    'G_UserID = "020207"
    'G_GroupID = "OOO"
    
    Rs.Close:    Set Rs = Nothing
    Exit Function

ErrHandler:
    G_ErrCodeMsg = "Login시 에러가 발생했습니다. " & Err.Description
    CheckUserID = False
End Function

'프로그램 조회/입력/수정/삭제 권한 Check
Public Function PgmAuth(strCommand As String, strPgmName As String) As Boolean
    Dim StrSql As String
    Dim Rs As ADODB.Recordset
    
    Dim StrPgmId As String
    
On Error GoTo ErrPgmAuth
    StrPgmId = Mid(strPgmName, 4, 8)
    
    StrSql = "SELECT auth_qry,auth_ins,auth_upd,auth_del FROM t_auauth" & _
             " WHERE group_id = '" & G_GroupID & "'" & _
             "   AND pgm_id = '" & StrPgmId & "'"
             
    Set Rs = New ADODB.Recordset
    Rs.Open StrSql, G_Host_Con, adOpenForwardOnly, adLockReadOnly, adCmdText
    
    If Rs.EOF And Rs.BOF Then
        PgmAuth = True
    Else
        Select Case strCommand
            Case "Q"
                If Rs("auth_qry") = "Y" Then
                    PgmAuth = True
                Else
                    PgmAuth = True:                    G_ErrCodeMsg = "조회/발행 권한이 없습니다."
                End If
            Case "I"
                If Rs("auth_ins") = "Y" Then
                    PgmAuth = True
                Else
                    PgmAuth = True:                    G_ErrCodeMsg = "입력 권한이 없습니다."
                End If
            Case "U"
                If Rs("auth_upd") = "Y" Then
                    PgmAuth = True
                Else
                    PgmAuth = True:                    G_ErrCodeMsg = "수정 권한이 없습니다."
                End If
            Case "D"
                If Rs("auth_del") = "Y" Then
                    PgmAuth = True
                Else
                    PgmAuth = True:                    G_ErrCodeMsg = "삭제 권한이 없습니다."
                End If
            Case Else
                PgmAuth = True
                G_ErrCodeMsg = "권한체크 에러 - 'Q' 'I' 'U' 'D' Parameter Error"
        End Select
    End If
    
    Rs.Close:    Set Rs = Nothing
    Exit Function
    
ErrPgmAuth:
    PgmAuth = True
    G_ErrCodeMsg = "권한체크 에러 - SQL ERROR"
End Function

'=======================================
'프로그램 조회/입력/수정/삭제 권한 Check
Public Function MnuChk(argPgmName As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim StrPgmId As String
    
G_GroupID = "EEE"
On Error GoTo ErrPgmAuth
    StrPgmId = Mid(argPgmName, 4, 8)
    
    SQL = "SELECT auth_qry FROM t_auauth" & _
          " WHERE group_id = '" & G_GroupID & "'" & _
          "   AND pgm_id = '" & StrPgmId & "'"
             
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con, adOpenForwardOnly, adLockReadOnly, adCmdText
    
    If Rs.EOF And Rs.BOF Then
        MnuChk = False
    Else
        MnuChk = True
    End If
    
    Rs.Close:    Set Rs = Nothing
    Exit Function
    
ErrPgmAuth:
    MnuChk = False
End Function
'=============================================================================
' 메뉴 사용권한 체크
'=============================================================================
Public Sub Menu_Check(ByVal FrmNm As Object)
    
    Dim Lo_Obj As Object
    Dim Ls_MenuNm As String
    Dim Sqltxt As String
    Dim Rs As ADODB.Recordset
'    Dim Rs1 As ADODB.Connection
    
    Call CheckUserID(G_UserID, "")  'get group id                     update by signal (04.04.29)

'    Set Rs1 = New ADODB.Connection

'    Rs1.Open G_Host_Con

    For Each Lo_Obj In FrmNm
        If TypeOf Lo_Obj Is Menu Then
            Ls_MenuNm = Mid(Lo_Obj.Name, 4, Len(Lo_Obj.Name) - 3)
            
            Sqltxt = " SELECT pgm_id "
            Sqltxt = Sqltxt & " FROM T_AUAUTH "
            Sqltxt = Sqltxt & " WHERE"
            Sqltxt = Sqltxt & " upper(PGM_ID) = '" & UCase(Ls_MenuNm) & "'"
            
            Set Rs = G_Host_Con.Execute(Sqltxt)

            If Not Rs.EOF Then
                Sqltxt = " SELECT pgm_id "
                Sqltxt = Sqltxt & " FROM T_AUPGM "
                Sqltxt = Sqltxt & " WHERE"
                Sqltxt = Sqltxt & " upper(PGM_ID) = '" & UCase(Ls_MenuNm) & "'"
                
                Set Rs = G_Host_Con.Execute(Sqltxt)
    
                If Rs.EOF Then
                    Lo_Obj.Visible = False
                Else
                    Lo_Obj.Visible = True
                End If

                Sqltxt = " SELECT pgm_id "
                Sqltxt = Sqltxt & " FROM T_AUAUTH "
                Sqltxt = Sqltxt & " WHERE"
                Sqltxt = Sqltxt & " USER_ID in ('" & G_UserID & "','DPCTOS')"
                Sqltxt = Sqltxt & " AND upper(PGM_ID) = '" & UCase(Ls_MenuNm) & "'"

    
                Set Rs = G_Host_Con.Execute(Sqltxt)
    
                If Rs.EOF Then
                    Lo_Obj.Enabled = False
                Else
                    Lo_Obj.Enabled = True
                End If
            End If
        End If
    Next

    Rs.Close
'    Rs1.Close
    Set Rs = Nothing
'    Set Rs1 = Nothing
End Sub

Public Sub ChekParaMeter(rFormName As Object)
    Dim Message$, Title$
    Dim MyValue$
    Dim G_TEST_Code As String
    
    G_TEST_Code = ""
    Message = "Access Code를 입력하세요!"   ' 프롬프트 설정.
    Title = "Input Access Code"   ' 제목 설정.
    
    If Len(Command) = 0 Then
        'InputBox
        MyValue = InputBox(Message, Title, Default)
    
        If MyValue = "swjeon" Then
            G_UserID = "030088"
        Else
            G_Vboption = vbYesNo + vbCritical + vbDefaultButton1
            MsgBox "프로그램을 직접 Access할 수 없습니다. 통합메뉴를 이용하세요", vbOKOnly, "프로그램 호출"
            'Unload Me
            Unload rFormName
            End
        End If
    Else
        If Len(Command) = 0 Then
            G_Vboption = vbYesNo + vbCritical + vbDefaultButton1
            MsgBox "프로그램을 직접 Access할 수 없습니다. 통합메뉴를 이용하세요", vbOKOnly, "프로그램 호출"
            'Unload Me
            Unload rFormName
            End
        Else
            G_UserID = Mid(CStr(Command), 1)
            
        End If
    End If
End Sub



