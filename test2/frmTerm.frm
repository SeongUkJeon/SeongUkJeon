VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Begin VB.Form frmTerm 
   BorderStyle     =   1  '단일 고정
   Caption         =   "기간별 반출입현황"
   ClientHeight    =   8865
   ClientLeft      =   6975
   ClientTop       =   7680
   ClientWidth     =   15615
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8865
   ScaleWidth      =   15615
   Begin VB.ComboBox cbovan 
      BackColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   8280
      TabIndex        =   36
      TabStop         =   0   'False
      Top             =   960
      Width           =   735
   End
   Begin VB.CheckBox chkTS 
      Caption         =   "TS"
      Height          =   285
      Left            =   600
      TabIndex        =   31
      Top             =   960
      Width           =   675
   End
   Begin VB.ComboBox cboFM 
      Height          =   300
      Left            =   3600
      TabIndex        =   30
      TabStop         =   0   'False
      Top             =   960
      Width           =   840
   End
   Begin VB.ComboBox cboIX 
      Height          =   300
      Left            =   2040
      TabIndex        =   29
      TabStop         =   0   'False
      Top             =   960
      Width           =   840
   End
   Begin VB.ComboBox cboType 
      BackColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   6720
      TabIndex        =   28
      TabStop         =   0   'False
      Top             =   960
      Width           =   795
   End
   Begin VB.ComboBox cboSize 
      BackColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   5160
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   960
      Width           =   795
   End
   Begin VB.TextBox txtToHH 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8280
      TabIndex        =   18
      Top             =   480
      Width           =   495
   End
   Begin VB.TextBox txtToYear 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5040
      TabIndex        =   14
      Top             =   480
      Width           =   855
   End
   Begin VB.TextBox txtToMonth 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6360
      TabIndex        =   13
      Top             =   480
      Width           =   495
   End
   Begin VB.TextBox txtToDay 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7320
      TabIndex        =   12
      Top             =   480
      Width           =   495
   End
   Begin VB.TextBox txtFromHH 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3600
      TabIndex        =   10
      Top             =   480
      Width           =   495
   End
   Begin VB.TextBox txtFromYear 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Top             =   480
      Width           =   855
   End
   Begin VB.TextBox txtFromMonth 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1680
      TabIndex        =   5
      Top             =   480
      Width           =   495
   End
   Begin VB.TextBox txtFromDay 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2640
      TabIndex        =   4
      Top             =   480
      Width           =   495
   End
   Begin VB.CommandButton cmdQuery 
      Caption         =   "조회"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   13320
      TabIndex        =   1
      Top             =   360
      Width           =   855
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "닫기"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   14520
      TabIndex        =   0
      Top             =   360
      Width           =   855
   End
   Begin TabDlg.SSTab SSTab11 
      Height          =   6975
      Left            =   240
      TabIndex        =   3
      Top             =   1560
      Width           =   15135
      _ExtentX        =   26696
      _ExtentY        =   12303
      _Version        =   393216
      TabHeight       =   520
      TabCaption(0)   =   "시간대별"
      TabPicture(0)   =   "frmTerm.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "MSChart1(0)"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "spslist(0)"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "요일별"
      TabPicture(1)   =   "frmTerm.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "MSChart1(1)"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "spslist(1)"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).ControlCount=   2
      TabCaption(2)   =   "일별"
      TabPicture(2)   =   "frmTerm.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "MSChart1(2)"
      Tab(2).Control(1)=   "spslist(2)"
      Tab(2).ControlCount=   2
      Begin FPSpread.vaSpread spslist 
         Height          =   1395
         Index           =   0
         Left            =   2160
         TabIndex        =   21
         TabStop         =   0   'False
         Top             =   720
         Width           =   10785
         _Version        =   196608
         _ExtentX        =   19024
         _ExtentY        =   2461
         _StockProps     =   64
         BackColorStyle  =   1
         ColHeaderDisplay=   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림체"
            Size            =   6.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   25
         MaxRows         =   4
         ScrollBars      =   0
         SpreadDesigner  =   "frmTerm.frx":0054
         UserResize      =   0
      End
      Begin MSChart20Lib.MSChart MSChart1 
         Height          =   4185
         Index           =   0
         Left            =   2160
         OleObjectBlob   =   "frmTerm.frx":1747
         TabIndex        =   22
         TabStop         =   0   'False
         Top             =   2400
         Width           =   10785
      End
      Begin FPSpread.vaSpread spslist 
         Height          =   1395
         Index           =   1
         Left            =   -72840
         TabIndex        =   23
         TabStop         =   0   'False
         Top             =   720
         Width           =   10785
         _Version        =   196608
         _ExtentX        =   19024
         _ExtentY        =   2461
         _StockProps     =   64
         BackColorStyle  =   1
         ColHeaderDisplay=   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림체"
            Size            =   6.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   25
         MaxRows         =   4
         ScrollBars      =   0
         SpreadDesigner  =   "frmTerm.frx":3E84
         UserResize      =   0
      End
      Begin MSChart20Lib.MSChart MSChart1 
         Height          =   4185
         Index           =   1
         Left            =   -72840
         OleObjectBlob   =   "frmTerm.frx":5577
         TabIndex        =   24
         TabStop         =   0   'False
         Top             =   2400
         Width           =   10785
      End
      Begin FPSpread.vaSpread spslist 
         Height          =   1395
         Index           =   2
         Left            =   -72840
         TabIndex        =   25
         TabStop         =   0   'False
         Top             =   720
         Width           =   10785
         _Version        =   196608
         _ExtentX        =   19024
         _ExtentY        =   2461
         _StockProps     =   64
         BackColorStyle  =   1
         ColHeaderDisplay=   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림체"
            Size            =   6.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   45
         MaxRows         =   4
         ScrollBars      =   0
         SpreadDesigner  =   "frmTerm.frx":7CB2
         UserResize      =   0
      End
      Begin MSChart20Lib.MSChart MSChart1 
         Height          =   4185
         Index           =   2
         Left            =   -72840
         OleObjectBlob   =   "frmTerm.frx":A1C4
         TabIndex        =   26
         TabStop         =   0   'False
         Top             =   2400
         Width           =   10785
      End
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      Caption         =   "단위"
      Height          =   300
      Left            =   7800
      TabIndex        =   37
      Top             =   960
      Width           =   480
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      Caption         =   "F/M"
      Height          =   300
      Left            =   3120
      TabIndex        =   35
      Top             =   960
      Width           =   390
   End
   Begin VB.Label Label14 
      AutoSize        =   -1  'True
      Caption         =   "I/X"
      Height          =   300
      Left            =   1560
      TabIndex        =   34
      Top             =   960
      Width           =   390
   End
   Begin VB.Label Label15 
      AutoSize        =   -1  'True
      Caption         =   "T/P"
      Height          =   300
      Left            =   6240
      TabIndex        =   33
      Top             =   960
      Width           =   390
   End
   Begin VB.Label Label16 
      AutoSize        =   -1  'True
      Caption         =   "S/Z"
      Height          =   300
      Left            =   4680
      TabIndex        =   32
      Top             =   960
      Width           =   390
   End
   Begin VB.Label Label10 
      Alignment       =   2  '가운데 맞춤
      Caption         =   "~"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   20.25
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4440
      TabIndex        =   20
      Top             =   480
      Width           =   615
   End
   Begin VB.Label Label9 
      Caption         =   "시"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8880
      TabIndex        =   19
      Top             =   480
      Width           =   375
   End
   Begin VB.Label Label8 
      Caption         =   "년"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6000
      TabIndex        =   17
      Top             =   480
      Width           =   375
   End
   Begin VB.Label Label7 
      Caption         =   "월"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6960
      TabIndex        =   16
      Top             =   480
      Width           =   375
   End
   Begin VB.Label Label5 
      Caption         =   "일"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7920
      TabIndex        =   15
      Top             =   480
      Width           =   375
   End
   Begin VB.Label Label4 
      Caption         =   "시"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4200
      TabIndex        =   11
      Top             =   480
      Width           =   375
   End
   Begin VB.Label Label1 
      Caption         =   "년"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1320
      TabIndex        =   9
      Top             =   480
      Width           =   375
   End
   Begin VB.Label Label2 
      Caption         =   "월"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2280
      TabIndex        =   8
      Top             =   480
      Width           =   375
   End
   Begin VB.Label Label3 
      Caption         =   "일"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3240
      TabIndex        =   7
      Top             =   480
      Width           =   375
   End
   Begin VB.Line Line1 
      X1              =   240
      X2              =   9360
      Y1              =   1320
      Y2              =   1320
   End
   Begin VB.Line Line2 
      X1              =   240
      X2              =   240
      Y1              =   1320
      Y2              =   360
   End
   Begin VB.Line Line4 
      X1              =   9360
      X2              =   9360
      Y1              =   1320
      Y2              =   360
   End
   Begin VB.Line Line3 
      X1              =   9360
      X2              =   240
      Y1              =   360
      Y2              =   360
   End
   Begin VB.Label Label6 
      Alignment       =   2  '가운데 맞춤
      Caption         =   "D P C T"
      BeginProperty Font 
         Name            =   "@새굴림"
         Size            =   36
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   9960
      TabIndex        =   2
      Top             =   240
      Width           =   2775
   End
End
Attribute VB_Name = "frmTerm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub cmdExit_Click()
    Call Exit_Form(frmTerm)
End Sub

Private Sub cmdQuery_Click()
    Dim FromDate As String
    Dim ToDate As String
    Dim blnSelect As Boolean
    Dim limitDate As String
    
    If txtFromYear.Text = "" Then MsgBox "조회 할 연도의 범위를 입력하세요":        txtFromYear.SetFocus:        Exit Sub
    If txtFromMonth.Text = "" Then MsgBox "조회 할 달의 범위를 입력하세요":         txtFromMonth.SetFocus:       Exit Sub
    If txtFromDay.Text = "" Then MsgBox "조회 할 일자의 범위를 입력하세요":         txtFromDay.SetFocus:         Exit Sub
    If txtToYear.Text = "" Then MsgBox "조회 할 연도의 범위를 입력하세요":          txtToYear.SetFocus:          Exit Sub
    If txtToMonth.Text = "" Then MsgBox "조회 할 달의 범위를 입력하세요":           txtToMonth.SetFocus:         Exit Sub
    If txtToDay.Text = "" Then MsgBox "조회 할 일자의 범위를 입력하세요":           txtToDay.SetFocus:           Exit Sub
    
    FromDate = txtFromYear.Text & txtFromMonth.Text & txtFromDay.Text
    ToDate = txtToYear.Text & txtToMonth.Text & txtToDay.Text
    
    If DateCheck(FromDate) = False Then txtFromYear.SetFocus:                         Exit Sub
    If DateCheck(ToDate) = False Then txtToDay.SetFocus:                              Exit Sub
    If DurationCheck(FromDate, ToDate) = False Then txtFromDay.SetFocus:              Exit Sub
    
    Call GetHostDateTime
    
    Call Control_Enable(False)
    
    If SSTab11.Tab = 0 Then
        Sps_Option spslist(0), 2
        
        ToDate = ToDate & " " & txtToHH & "-00-00"
        limitDate = limitCmd1(ToDate, 1)
        If Mid(limitDate, 1, 6) = Mid(FromDate, 1, 6) Then
            If Val(Mid(limitDate, 7, 2)) > Val(Mid(FromDate, 7, 2)) Or Val(Mid(limitDate, 7, 2)) <> Val(Mid(FromDate, 7, 2)) Then
                MsgBox ("조회 범위를 초과하였습니다, 다시 입력하세요 !!")
                Call Control_Enable(True)
                Exit Sub
            Else
                If Val(Mid(ToDate, 7, 2)) = Val(Mid(FromDate, 7, 2)) And Val(txtFromHH) > Val(txtToHH) Then
                    MsgBox ("날짜형식이 잘못되었습니다, 다시 입력하세요 !!")
                    Call Control_Enable(True)
                    Exit Sub
                End If
            End If
        Else
            MsgBox ("조회 범위를 초과하였습니다, 다시 입력하세요 !!")
            Call Control_Enable(True)
            Exit Sub
        End If
        
        blnSelect = Select_Data
        If blnSelect = True Then
            totcmt
            totPercent
            Display_Chart1
            Call Control_Enable(True)
        Else
            Call Control_Enable(True)
            txtFromYear.SetFocus
        End If
    ElseIf SSTab11.Tab = 1 Then
        Sps_Option spslist(1), 2
        
        ToDate = ToDate & " " & txtToHH & "-00-00"
        limitDate = limitCmd1(ToDate, 7)
        If Mid(limitDate, 1, 6) = Mid(FromDate, 1, 6) Then
            If Val(Mid(limitDate, 7, 2)) > Val(Mid(FromDate, 7, 2)) Then
                MsgBox ("조회 범위를 초과하였습니다, 다시 입력하세요 !!")
                Call Control_Enable(True)
                Exit Sub
            End If
        Else
            MsgBox ("조회 범위를 초과하였습니다, 다시 입력하세요 !!")
            Call Control_Enable(True)
            Exit Sub
        End If

        blnSelect = SELECT_day
        If blnSelect = True Then
            totcmt
            totPercent
            Display_Chart2
            Call Control_Enable(True)
        Else
            Call Control_Enable(True)
            txtFromYear.SetFocus
        End If
    ElseIf SSTab11.Tab = 2 Then
        Sps_Option spslist(2), 2
        
        ToDate = ToDate & " " & txtToHH & "-00-00"
        limitDate = limitCmd1(ToDate, 30)
        If Mid(limitDate, 1, 6) = Mid(FromDate, 1, 6) Then
            If Val(Mid(limitDate, 7, 2)) > Val(Mid(FromDate, 7, 2)) Then
                MsgBox ("조회 범위를 초과하였습니다, 다시 입력하세요 !!")
                Call Control_Enable(True)
                Exit Sub
            End If
        Else
            MsgBox ("조회 범위를 초과하였습니다, 다시 입력하세요 !!")
            Call Control_Enable(True)
            Exit Sub
        End If

        blnSelect = SELECT_date
        If blnSelect = True Then
            totcmt
            totPercent
            Display_Chart3
            Call Control_Enable(True)
        Else
            Call Control_Enable(True)
            txtFromYear.SetFocus
        End If
    End If
End Sub

Private Sub Control_Enable(flag As Boolean)
    txtFromYear.Enabled = flag
    txtFromMonth.Enabled = flag
    txtFromDay.Enabled = flag
    txtToDay.Enabled = flag
    cmdQuery.Enabled = flag
    cmdExit.Enabled = flag
End Sub

Private Sub Form_Load()
    Me.Top = 0
    Me.Left = 0
    
    cbovan.AddItem "VAN"
    cbovan.AddItem "TEU"
    cbovan.ListIndex = 0
    
    cboFM.Clear
    cboFM.AddItem "*"
    cboFM.AddItem "F"
    cboFM.AddItem "M"
    cboFM.ListIndex = 0
    
    cboIX.Clear
    cboIX.AddItem "*"
    cboIX.AddItem "I"
    cboIX.AddItem "X"
    cboIX.ListIndex = 0
    
    cboType.Clear
    cboType.AddItem "*"
    cboType.AddItem "DC"
    cboType.AddItem "RF"
    cboType.AddItem "OT"
    cboType.AddItem "PL"
    cboType.AddItem "TK"
    cboType.AddItem "BK"
    cboType.AddItem "AS"
    cboType.ListIndex = 0
    
    cboSize.Clear
    cboSize.AddItem "*"
    cboSize.AddItem "20"
    cboSize.AddItem "40"
    cboSize.AddItem "HC"
    cboSize.AddItem "45"
    cboSize.ListIndex = 0
    
    Call TextYear(txtFromYear)
    Call TextMonth(txtFromMonth)
    Call TextDay(txtFromDay, G_CurrentDate)

    Call TextYear(txtToYear)
    Call TextMonth(txtToMonth)
    Call TextDay(txtToDay, "")
    
    txtFromHH.Text = "00"
    txtToHH.Text = "00"
    
    SSTab11.Tab = 0
    Display_Chart1
End Sub

Public Sub TextYear(txtYear As TextBox)
    Dim ThisYear As String

    Call GetHostDateTime
    ThisYear = Mid(Trim(G_CurrentDate), 1, 4)

    txtYear.Text = ThisYear
End Sub

Public Sub TextMonth(txtMonth As TextBox)
    Dim ThisMonth As String

    Call GetHostDateTime
    ThisMonth = Mid(Trim(G_CurrentDate), 5, 2)

    txtMonth.Text = ThisMonth
End Sub

Public Sub TextDay(txtDay As TextBox, AcceptDate As String)
    Dim ThisYearMonth As Long
    Dim ThisDay As String
    Dim LastDay As Integer
    Dim i As Integer
    Dim Item As String * 2
    Dim flag As Integer

    If Trim(AcceptDate) = "" Or Trim(AcceptDate) = "tab1" Or Trim(AcceptDate) = "tab2" Then
        Call GetHostDateTime
        ThisYearMonth = Val(Mid(Trim(G_CurrentDate), 1, 6))
        ThisDay = Mid(Trim(G_CurrentDate), 7, 2)
    Else
        ThisYearMonth = Val(Mid(Trim(AcceptDate), 1, 6))
        ThisDay = Mid(Trim(AcceptDate), 7, 2)
    End If
    
    LastDay = LastDaysOfMonths(ThisYearMonth)
       
    If LastDay = -1 Then
        MsgBox "해당월의 마지막 일자를 구할 수 없습니다!"
        Exit Sub
    End If

    If AcceptDate = "" Then
        txtDay.Text = ThisDay
    Else
        If AcceptDate = "tab1" Then
            flag = ThisDay - 7
            txtDay.Text = flag
        ElseIf AcceptDate = "tab2" Then
            flag = 1
            txtDay.Text = ThisDay
        Else
            flag = ThisDay - 1
            txtDay.Text = flag
        End If
        
        If flag < 1 Then
            txtDay.Text = LastDaysOfMonths(Val(Mid(Trim(AcceptDate), 1, 5) & Str(Val(Mid(Trim(AcceptDate), 6, 1)) - 1)))
        End If
    End If
End Sub

Public Function GetHostDateTime() As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo GetCurrentDate_Err
    
    SQL = "SELECT sysdate FROM dual"
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        MsgBox "시스템 시간을 알 수 없습니다!!"
        GetHostDateTime = -1
        Exit Function
    End If
    
    Rs.MoveFirst
    G_CurrentDateTime = Format(Rs(0), "YYYYMMDDHHMMSS")
    G_CurrentDate = Mid(G_CurrentDateTime, 1, 8)
    G_CurrentTime = Mid(G_CurrentDateTime, 9, 11)
    G_BeforeFiveDateTime = Format(Rs(0) - 5, "YYYYMMDDHHMMSS")   '현재 날짜의  5일전 날짜
    G_BeforeTwoDate = Format(Rs(0) - 2, "YYYYMMDD")   '현재 날짜의  2일전 날짜
    G_PjobDate = Format(Rs(0) - 1, "YYYYMMDD")        '현재 날짜의  1일전 날짜
    
    G_PrintDate = "발행일자 : " & Trim(Format(Rs(0), "YYYY.MM.DD HH:MM"))

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

Private Function Select_Data() As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim V_NUM As Integer
    Dim V_cnt As Integer
    
    Dim i As Integer
    
    Dim overilsu As Integer
    
    Dim chr_date As String
    
    Dim work_cd As String
    Dim j As Integer
    Dim var As Variant
    Dim rtn As Boolean
    
On Error GoTo ErrMsg
    
    Screen.MousePointer = 11
    If Trim(cbovan) = "VAN" Then
            SQL = "select min('반입') 구분," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,1,1,0)) time1," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,2,1,0)) time2," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,3,1,0)) time3," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,4,1,0)) time4," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,5,1,0)) time5," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,6,1,0)) time6," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,7,1,0)) time7," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,8,1,0)) time8," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,9,1,0)) time9," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,10,1,0)) time10," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,11,1,0)) time11," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,12,1,0)) time12,"
        
            SQL = SQL + "  sum(decode(to_char(gin_dt,'hh24')+1,13,1,0)) time13," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,14,1,0)) time14," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,15,1,0)) time15," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,16,1,0)) time16," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,17,1,0)) time17," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,18,1,0)) time18," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,19,1,0)) time19," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,20,1,0)) time20," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,21,1,0)) time21," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,22,1,0)) time22," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,23,1,0)) time23," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,24,1,0)) time24," & _
                  "        count(*) tot" & _
                  "  from t_cntr"
        Else
            SQL = "select min('반입') 구분," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,1,decode(substr(sz_cd,1,1),'2',1,2),0)) time1," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,2,decode(substr(sz_cd,1,1),'2',1,2),0)) time2," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,3,decode(substr(sz_cd,1,1),'2',1,2),0)) time3," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,4,decode(substr(sz_cd,1,1),'2',1,2),0)) time4," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,5,decode(substr(sz_cd,1,1),'2',1,2),0)) time5," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,6,decode(substr(sz_cd,1,1),'2',1,2),0)) time6," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,7,decode(substr(sz_cd,1,1),'2',1,2),0)) time7," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,8,decode(substr(sz_cd,1,1),'2',1,2),0)) time8," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,9,decode(substr(sz_cd,1,1),'2',1,2),0)) time9," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,10,decode(substr(sz_cd,1,1),'2',1,2),0)) time10," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,11,decode(substr(sz_cd,1,1),'2',1,2),0)) time11," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,12,decode(substr(sz_cd,1,1),'2',1,2),0)) time12,"
        
            SQL = SQL + "  sum(decode(to_char(gin_dt,'hh24')+1,13,decode(substr(sz_cd,1,1),'2',1,2),0)) time13," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,14,decode(substr(sz_cd,1,1),'2',1,2),0)) time14," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,15,decode(substr(sz_cd,1,1),'2',1,2),0)) time15," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,16,decode(substr(sz_cd,1,1),'2',1,2),0)) time16," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,17,decode(substr(sz_cd,1,1),'2',1,2),0)) time17," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,18,decode(substr(sz_cd,1,1),'2',1,2),0)) time18," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,19,decode(substr(sz_cd,1,1),'2',1,2),0)) time19," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,20,decode(substr(sz_cd,1,1),'2',1,2),0)) time20," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,21,decode(substr(sz_cd,1,1),'2',1,2),0)) time21," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,22,decode(substr(sz_cd,1,1),'2',1,2),0)) time22," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,23,decode(substr(sz_cd,1,1),'2',1,2),0)) time23," & _
                  "        sum(decode(to_char(gin_dt,'hh24')+1,24,decode(substr(sz_cd,1,1),'2',1,2),0)) time24," & _
                  "        sum(decode(substr(sz_cd,1,1),'2',1,2)) tot" & _
                  "  from t_cntr"
        End If
        
        SQL = SQL + "  where gin_dt between to_date('"
        SQL = SQL + txtFromYear + txtFromMonth + txtFromDay + txtFromHH + "', 'yyyymmddhh24') and to_date('"
        SQL = SQL + txtToYear + txtToMonth + txtToDay + txtToHH + "', 'yyyymmddhh24')"
        SQL = SQL + " and trn_in = 'D' "
    

        SQL = SQL + " union all "


   
        If Trim(cbovan) = "VAN" Then
                SQL = SQL + "select min('반출') 구분,"

            SQL = SQL + "  sum(decode(to_char(gout_dt,'hh24')+1,1,1,0)) time1," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,2,1,0)) time2," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,3,1,0)) time3," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,4,1,0)) time4," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,5,1,0)) time5," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,6,1,0)) time6," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,7,1,0)) time7," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,8,1,0)) time8," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,9,1,0)) time9," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,10,1,0)) time10," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,11,1,0)) time11," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,12,1,0)) time12,"
        
            SQL = SQL + "  sum(decode(to_char(gout_dt,'hh24')+1,13,1,0)) time13," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,14,1,0)) time14," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,15,1,0)) time15," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,16,1,0)) time16," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,17,1,0)) time17," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,18,1,0)) time18," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,19,1,0)) time19," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,20,1,0)) time20," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,21,1,0)) time21," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,22,1,0)) time22," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,23,1,0)) time23," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,24,1,0)) time24," & _
                  "        count(*) tot" & _
                  "  from t_cntr"
        Else
                SQL = SQL + "select min('반출') 구분,"
            SQL = SQL + "  sum(decode(to_char(gout_dt,'hh24')+1,1,decode(substr(sz_cd,1,1),'2',1,2),0)) time1," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,2,decode(substr(sz_cd,1,1),'2',1,2),0)) time2," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,3,decode(substr(sz_cd,1,1),'2',1,2),0)) time3," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,4,decode(substr(sz_cd,1,1),'2',1,2),0)) time4," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,5,decode(substr(sz_cd,1,1),'2',1,2),0)) time5," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,6,decode(substr(sz_cd,1,1),'2',1,2),0)) time6," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,7,decode(substr(sz_cd,1,1),'2',1,2),0)) time7," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,8,decode(substr(sz_cd,1,1),'2',1,2),0)) time8," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,9,decode(substr(sz_cd,1,1),'2',1,2),0)) time9," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,10,decode(substr(sz_cd,1,1),'2',1,2),0)) time10," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,11,decode(substr(sz_cd,1,1),'2',1,2),0)) time11," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,12,decode(substr(sz_cd,1,1),'2',1,2),0)) time12,"
        
            SQL = SQL + "  sum(decode(to_char(gout_dt,'hh24')+1,13,decode(substr(sz_cd,1,1),'2',1,2),0)) time13," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,14,decode(substr(sz_cd,1,1),'2',1,2),0)) time14," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,15,decode(substr(sz_cd,1,1),'2',1,2),0)) time15," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,16,decode(substr(sz_cd,1,1),'2',1,2),0)) time16," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,17,decode(substr(sz_cd,1,1),'2',1,2),0)) time17," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,18,decode(substr(sz_cd,1,1),'2',1,2),0)) time18," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,19,decode(substr(sz_cd,1,1),'2',1,2),0)) time19," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,20,decode(substr(sz_cd,1,1),'2',1,2),0)) time20," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,21,decode(substr(sz_cd,1,1),'2',1,2),0)) time21," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,22,decode(substr(sz_cd,1,1),'2',1,2),0)) time22," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,23,decode(substr(sz_cd,1,1),'2',1,2),0)) time23," & _
                  "        sum(decode(to_char(gout_dt,'hh24')+1,24,decode(substr(sz_cd,1,1),'2',1,2),0)) time24," & _
                  "        sum(decode(substr(sz_cd,1,1),'2',1,2)) tot" & _
                  "  from t_cntr"
        End If
        
        SQL = SQL + "  where gout_dt between to_date('"
        SQL = SQL + txtFromYear + txtFromMonth + txtFromDay + txtFromHH + "', 'yyyymmddhh24') and to_date('"
        SQL = SQL + txtToYear + txtToMonth + txtToDay + txtToHH + "', 'yyyymmddhh24')"
        SQL = SQL + " and trn_out = 'D' "
        
     
        If chkTS.value = vbChecked Then
          SQL = SQL + " and TS_ID = '2' "
        End If
          
        If Trim(cboFM) = "F" Then
            SQL = SQL + " and fm_cd = 'F'"
        ElseIf Trim(cboFM) = "M" Then
            SQL = SQL + " and fm_cd = 'M'"
        End If
        
        If Trim(cboIX) = "I" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'I' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPI'))"
        ElseIf Trim(cboIX) = "X" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'X' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPX'))"
        End If
        
        If Trim(cboType.Text) <> "*" Then
            SQL = SQL + " and F_TYPE_MAP(ty_cd) = '" & Trim(cboType.Text) & "'"
        End If
        
        If Trim(cboSize.Text) <> "*" Then
            SQL = SQL + " and F_SIZE_MAP(sz_cd, 1) = '" & Trim(cboSize.Text) & "'"
        End If
                        

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con, adOpenForwardOnly
    
    If Rs.EOF Then
        Select_Data = False
        MsgBox "해당하는 자료가 없습니다", vbExclamation, Me.Caption
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        Exit Function
    Else
        Rs.MoveFirst
        V_NUM = 1
        V_cnt = 1
        Do While Not Rs.EOF
        
            If IIf(IsNull(Rs!구분), " ", Trim(Rs!구분)) = "반입" Then
                V_cnt = 1
                
                spslist(0).SetText 1, V_cnt, IIf(IsNull(Rs!time1), " ", IIf(Trim(Rs!time1) = 0, "", Trim(Rs!time1)))
                spslist(0).SetText 2, V_cnt, IIf(IsNull(Rs!time2), " ", IIf(Trim(Rs!time2) = 0, "", Trim(Rs!time2)))
                spslist(0).SetText 3, V_cnt, IIf(IsNull(Rs!time3), " ", IIf(Trim(Rs!time3) = 0, "", Trim(Rs!time3)))
                spslist(0).SetText 4, V_cnt, IIf(IsNull(Rs!time4), " ", IIf(Trim(Rs!time4) = 0, "", Trim(Rs!time4)))
                spslist(0).SetText 5, V_cnt, IIf(IsNull(Rs!time5), " ", IIf(Trim(Rs!time5) = 0, "", Trim(Rs!time5)))
                spslist(0).SetText 6, V_cnt, IIf(IsNull(Rs!time6), " ", IIf(Trim(Rs!time6) = 0, "", Trim(Rs!time6)))
                spslist(0).SetText 7, V_cnt, IIf(IsNull(Rs!time7), " ", IIf(Trim(Rs!time7) = 0, "", Trim(Rs!time7)))
                spslist(0).SetText 8, V_cnt, IIf(IsNull(Rs!time8), " ", IIf(Trim(Rs!time8) = 0, "", Trim(Rs!time8)))
                spslist(0).SetText 9, V_cnt, IIf(IsNull(Rs!time9), " ", IIf(Trim(Rs!time9) = 0, "", Trim(Rs!time9)))
                spslist(0).SetText 10, V_cnt, IIf(IsNull(Rs!time10), " ", IIf(Trim(Rs!time10) = 0, "", Trim(Rs!time10)))
                spslist(0).SetText 11, V_cnt, IIf(IsNull(Rs!time11), " ", IIf(Trim(Rs!time11) = 0, "", Trim(Rs!time11)))
                spslist(0).SetText 12, V_cnt, IIf(IsNull(Rs!time12), " ", IIf(Trim(Rs!time12) = 0, "", Trim(Rs!time12)))
                spslist(0).SetText 13, V_cnt, IIf(IsNull(Rs!time13), " ", IIf(Trim(Rs!time13) = 0, "", Trim(Rs!time13)))
                spslist(0).SetText 14, V_cnt, IIf(IsNull(Rs!time14), " ", IIf(Trim(Rs!time14) = 0, "", Trim(Rs!time14)))
                spslist(0).SetText 15, V_cnt, IIf(IsNull(Rs!TIME15), " ", IIf(Trim(Rs!TIME15) = 0, "", Trim(Rs!TIME15)))
                spslist(0).SetText 16, V_cnt, IIf(IsNull(Rs!time16), " ", IIf(Trim(Rs!time16) = 0, "", Trim(Rs!time16)))
                spslist(0).SetText 17, V_cnt, IIf(IsNull(Rs!time17), " ", IIf(Trim(Rs!time17) = 0, "", Trim(Rs!time17)))
                spslist(0).SetText 18, V_cnt, IIf(IsNull(Rs!time18), " ", IIf(Trim(Rs!time18) = 0, "", Trim(Rs!time18)))
                spslist(0).SetText 19, V_cnt, IIf(IsNull(Rs!time19), " ", IIf(Trim(Rs!time19) = 0, "", Trim(Rs!time19)))
                spslist(0).SetText 20, V_cnt, IIf(IsNull(Rs!time20), " ", IIf(Trim(Rs!time20) = 0, "", Trim(Rs!time20)))
                spslist(0).SetText 21, V_cnt, IIf(IsNull(Rs!time21), " ", IIf(Trim(Rs!time21) = 0, "", Trim(Rs!time21)))
                spslist(0).SetText 22, V_cnt, IIf(IsNull(Rs!time22), " ", IIf(Trim(Rs!time22) = 0, "", Trim(Rs!time22)))
                spslist(0).SetText 23, V_cnt, IIf(IsNull(Rs!time23), " ", IIf(Trim(Rs!time23) = 0, "", Trim(Rs!time23)))
                spslist(0).SetText 24, V_cnt, IIf(IsNull(Rs!time24), " ", IIf(Trim(Rs!time24) = 0, "", Trim(Rs!time24)))
                spslist(0).SetText 25, V_cnt, IIf(IsNull(Rs!Tot), " ", IIf(Trim(Rs!Tot) = 0, "", Trim(Rs!Tot)))
            
            ElseIf IIf(IsNull(Rs!구분), " ", Trim(Rs!구분)) = "반출" Then
                V_cnt = 2
            
                spslist(0).SetText 1, V_cnt, IIf(IsNull(Rs!time1), " ", IIf(Trim(Rs!time1) = 0, "", Trim(Rs!time1)))
                spslist(0).SetText 2, V_cnt, IIf(IsNull(Rs!time2), " ", IIf(Trim(Rs!time2) = 0, "", Trim(Rs!time2)))
                spslist(0).SetText 3, V_cnt, IIf(IsNull(Rs!time3), " ", IIf(Trim(Rs!time3) = 0, "", Trim(Rs!time3)))
                spslist(0).SetText 4, V_cnt, IIf(IsNull(Rs!time4), " ", IIf(Trim(Rs!time4) = 0, "", Trim(Rs!time4)))
                spslist(0).SetText 5, V_cnt, IIf(IsNull(Rs!time5), " ", IIf(Trim(Rs!time5) = 0, "", Trim(Rs!time5)))
                spslist(0).SetText 6, V_cnt, IIf(IsNull(Rs!time6), " ", IIf(Trim(Rs!time6) = 0, "", Trim(Rs!time6)))
                spslist(0).SetText 7, V_cnt, IIf(IsNull(Rs!time7), " ", IIf(Trim(Rs!time7) = 0, "", Trim(Rs!time7)))
                spslist(0).SetText 8, V_cnt, IIf(IsNull(Rs!time8), " ", IIf(Trim(Rs!time8) = 0, "", Trim(Rs!time8)))
                spslist(0).SetText 9, V_cnt, IIf(IsNull(Rs!time9), " ", IIf(Trim(Rs!time9) = 0, "", Trim(Rs!time9)))
                spslist(0).SetText 10, V_cnt, IIf(IsNull(Rs!time10), " ", IIf(Trim(Rs!time10) = 0, "", Trim(Rs!time10)))
                spslist(0).SetText 11, V_cnt, IIf(IsNull(Rs!time11), " ", IIf(Trim(Rs!time11) = 0, "", Trim(Rs!time11)))
                spslist(0).SetText 12, V_cnt, IIf(IsNull(Rs!time12), " ", IIf(Trim(Rs!time12) = 0, "", Trim(Rs!time12)))
                spslist(0).SetText 13, V_cnt, IIf(IsNull(Rs!time13), " ", IIf(Trim(Rs!time13) = 0, "", Trim(Rs!time13)))
                spslist(0).SetText 14, V_cnt, IIf(IsNull(Rs!time14), " ", IIf(Trim(Rs!time14) = 0, "", Trim(Rs!time14)))
                spslist(0).SetText 15, V_cnt, IIf(IsNull(Rs!TIME15), " ", IIf(Trim(Rs!TIME15) = 0, "", Trim(Rs!TIME15)))
                spslist(0).SetText 16, V_cnt, IIf(IsNull(Rs!time16), " ", IIf(Trim(Rs!time16) = 0, "", Trim(Rs!time16)))
                spslist(0).SetText 17, V_cnt, IIf(IsNull(Rs!time17), " ", IIf(Trim(Rs!time17) = 0, "", Trim(Rs!time17)))
                spslist(0).SetText 18, V_cnt, IIf(IsNull(Rs!time18), " ", IIf(Trim(Rs!time18) = 0, "", Trim(Rs!time18)))
                spslist(0).SetText 19, V_cnt, IIf(IsNull(Rs!time19), " ", IIf(Trim(Rs!time19) = 0, "", Trim(Rs!time19)))
                spslist(0).SetText 20, V_cnt, IIf(IsNull(Rs!time20), " ", IIf(Trim(Rs!time20) = 0, "", Trim(Rs!time20)))
                spslist(0).SetText 21, V_cnt, IIf(IsNull(Rs!time21), " ", IIf(Trim(Rs!time21) = 0, "", Trim(Rs!time21)))
                spslist(0).SetText 22, V_cnt, IIf(IsNull(Rs!time22), " ", IIf(Trim(Rs!time22) = 0, "", Trim(Rs!time22)))
                spslist(0).SetText 23, V_cnt, IIf(IsNull(Rs!time23), " ", IIf(Trim(Rs!time23) = 0, "", Trim(Rs!time23)))
                spslist(0).SetText 24, V_cnt, IIf(IsNull(Rs!time24), " ", IIf(Trim(Rs!time24) = 0, "", Trim(Rs!time24)))
                spslist(0).SetText 25, V_cnt, IIf(IsNull(Rs!Tot), " ", IIf(Trim(Rs!Tot) = 0, "", Trim(Rs!Tot)))

            End If
                
            Rs.MoveNext
        Loop
        Select_Data = True
        
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    
    Exit Function
ErrMsg:
    Select_Data = False
    Screen.MousePointer = 0
    MsgBox "TABLE SELECT_data function Error(T_cntr)" & vbCrLf & Err.Description, vbCritical, Me.Caption

End Function

Private Function totcmt() As Boolean
    
    Dim V_NUM As Integer
    Dim i As Integer
    Dim overilsu As Integer
    Dim chr_date As String
    Dim work_cd As String
    Dim j As Integer
    Dim var As Variant
    Dim var2 As Variant
    Dim rtn As Boolean
    
On Error GoTo ErrMsg
    
    Screen.MousePointer = 11
        
    If SSTab11.Tab = 0 Then
        For i = 1 To spslist(0).MaxCols
            rtn = spslist(0).GetText(i, 1, var)
            rtn = spslist(0).GetText(i, 2, var2)
            If CDbl(IIf(var = "", 0, var)) + CDbl(IIf(var2 = "", 0, var2)) > 0 Then
                spslist(0).SetText i, 3, CDbl(IIf(var = "", 0, var)) + CDbl(IIf(var2 = "", 0, var2))
            End If
        Next i
    ElseIf SSTab11.Tab = 1 Then
        For i = 1 To spslist(1).MaxCols
            rtn = spslist(1).GetText(i, 1, var)
            rtn = spslist(1).GetText(i, 2, var2)
            If CDbl(IIf(var = "", 0, var)) + CDbl(IIf(var2 = "", 0, var2)) > 0 Then
                spslist(1).SetText i, 3, CDbl(IIf(var = "", 0, var)) + CDbl(IIf(var2 = "", 0, var2))
            End If
        Next i
    ElseIf SSTab11.Tab = 2 Then
        For i = 1 To spslist(2).MaxCols
            rtn = spslist(2).GetText(i, 1, var)
            rtn = spslist(2).GetText(i, 2, var2)
            If CDbl(IIf(var = "", 0, var)) + CDbl(IIf(var2 = "", 0, var2)) > 0 Then
                spslist(2).SetText i, 3, CDbl(IIf(var = "", 0, var)) + CDbl(IIf(var2 = "", 0, var2))
            End If
        Next i
    End If

    Screen.MousePointer = 0
    totcmt = True
    
    Exit Function
ErrMsg:
    totcmt = False
    Screen.MousePointer = 0
    MsgBox "totcmt function Error" & vbCrLf & Err.Description, vbCritical, Me.Caption

End Function

Private Function totPercent() As Boolean
    
    Dim V_NUM As Integer
    Dim i As Integer
    Dim overilsu As Integer
    Dim chr_date As String
    Dim work_cd As String
    Dim j As Integer
    Dim var As Variant
    Dim var2 As Variant
    Dim rtn As Boolean
    
On Error GoTo ErrMsg
    
    Screen.MousePointer = 11
    
    If SSTab11.Tab = 0 Then
        For i = 1 To spslist(0).MaxCols
            rtn = spslist(0).GetText(i, 3, var)
            rtn = spslist(0).GetText(spslist(0).MaxCols, 3, var2)
            If CDbl(IIf(var = "", 0, var)) > 0 Then
                spslist(0).SetText i, 4, Round(CDbl(var) / CDbl(var2) * 100, 1)
'                spslist.SetText i, 4, FormatPercent(CInt(var) / CInt(var2))
            End If
        Next i
    ElseIf SSTab11.Tab = 1 Then
        For i = 1 To spslist(1).MaxCols
            rtn = spslist(1).GetText(i, 3, var)
            rtn = spslist(1).GetText(spslist(1).MaxCols, 3, var2)
            If CDbl(IIf(var = "", 0, var)) > 0 Then
                spslist(1).SetText i, 4, Round(CDbl(var) / CDbl(var2) * 100, 1)
            End If
        Next i
    ElseIf SSTab11.Tab = 2 Then
        For i = 1 To spslist(2).MaxCols
            rtn = spslist(2).GetText(i, 3, var)
            rtn = spslist(2).GetText(spslist(2).MaxCols, 3, var2)
            If CDbl(IIf(var = "", 0, var)) > 0 Then
                spslist(2).SetText i, 4, Round(CDbl(var) / CDbl(var2) * 100, 1)
            End If
        Next i
    End If

    Screen.MousePointer = 0
    totPercent = True
    
    Exit Function
ErrMsg:
    totPercent = False
    Screen.MousePointer = 0
    MsgBox "totPercent function Error" & vbCrLf & Err.Description, vbCritical, Me.Caption

End Function

Private Function Display_Chart1()
    Dim row As Integer
    Dim col As Integer
    
    Dim rtn As Boolean
    Dim var As Variant
    
    With MSChart1(0)
      .ColumnCount = 3
      .RowCount = 24
    For row = 1 To 24
       For col = 1 To 3
           rtn = spslist(0).GetText(row, col, var)
           .Column = col
           .row = row
           .Data = var
       Next col
    Next row
    End With
End Function

Private Function Display_Chart2()
    Dim row As Integer
    Dim col As Integer
    
    Dim rtn As Boolean
    Dim var As Variant
    
    With MSChart1(1)
      .ColumnCount = 3
      .RowCount = 7
    For row = 1 To 7
       For col = 1 To 3
           rtn = spslist(1).GetText(row, col, var)
           .Column = col
           .row = row
           .Data = var
           Select Case row
                Case 1
                    .RowLabel = "일"
                Case 2
                    .RowLabel = "월"
                Case 3
                    .RowLabel = "화"
                Case 4
                    .RowLabel = "수"
                Case 5
                    .RowLabel = "목"
                Case 6
                    .RowLabel = "금"
                Case 7
                    .RowLabel = "토"
            End Select
       Next col
    Next row
    End With
End Function

Private Function Display_Chart3()
    Dim row As Integer
    Dim col As Integer
    
    Dim rtn As Boolean
    Dim var As Variant
    
    Dim year, month As String
    Dim totalDay As Integer
                
    Call GetHostDateTime
    year = Mid(Trim(G_CurrentDate), 1, 4)
    month = Mid(Trim(G_CurrentDate), 5, 2)
    
    totalDay = LastDaysOfMonths(Trim(year + month))
    
    With MSChart1(2)
      .ColumnCount = 3
      .RowCount = totalDay
    For row = 1 To totalDay
       For col = 1 To 3
           rtn = spslist(2).GetText(row, col, var)
           .Column = col
           .row = row
           .Data = var
           .RowLabel = row
       Next col
    Next row
    End With
End Function

Private Function SELECT_date() As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim V_NUM As Integer
    Dim V_cnt As Integer
    Dim i As Integer
    Dim overilsu As Integer
    Dim chr_date As String
    Dim work_cd As String
    Dim j As Integer
    Dim var As Variant
    Dim rtn As Boolean
    
On Error GoTo ErrMsg
    
    Screen.MousePointer = 11
    
        If Trim(cbovan) = "VAN" Then
            SQL = "select min('반입')   구분,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '01', 1, 0))   day_01,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '02', 1, 0))   day_02,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '03', 1, 0))   day_03,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '04', 1, 0))   day_04,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '05', 1, 0))   day_05,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '06', 1, 0))   day_06,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '07', 1, 0))   day_07,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '08', 1, 0))   day_08,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '09', 1, 0))   day_09,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '10', 1, 0))   day_10,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '11', 1, 0))   day_11,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '12', 1, 0))   day_12,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '13', 1, 0))   day_13,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '14', 1, 0))   day_14,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '15', 1, 0))   day_15,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '16', 1, 0))   day_16,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '17', 1, 0))   day_17,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '18', 1, 0))   day_18,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '19', 1, 0))   day_19,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '20', 1, 0))   day_20,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '21', 1, 0))   day_21,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '22', 1, 0))   day_22,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '23', 1, 0))   day_23,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '24', 1, 0))   day_24,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '25', 1, 0))   day_25,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '26', 1, 0))   day_26,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '27', 1, 0))   day_27,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '28', 1, 0))   day_28,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '29', 1, 0))   day_29,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '30', 1, 0))   day_30,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '31', 1, 0))   day_31,"
            SQL = SQL & "        count(*) tot"
            SQL = SQL & "   from t_cntr"
        Else
            SQL = "select min('반입')   구분,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '01', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_01,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '02', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_02,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '03', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_03,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '04', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_04,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '05', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_05,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '06', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_06,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '07', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_07,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '08', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_08,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '09', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_09,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '10', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_10,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '11', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_11,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '12', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_12,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '13', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_13,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '14', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_14,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '15', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_15,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '16', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_16,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '17', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_17,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '18', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_18,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '19', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_19,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '20', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_20,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '21', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_21,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '22', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_22,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '23', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_23,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '24', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_24,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '25', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_25,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '26', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_26,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '27', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_27,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '28', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_28,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '29', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_29,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '30', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_30,"
            SQL = SQL & "        sum(decode(to_char(gin_dt, 'dd'), '31', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_31,"
            SQL = SQL & "        sum(decode(substr(sz_cd,1,1),'2',1,2)) tot"
            SQL = SQL & "   from t_cntr"
        End If
        
        SQL = SQL + "  where gin_dt between to_date('"
        SQL = SQL + txtFromYear + txtFromMonth + txtFromDay + txtFromHH + "', 'yyyymmddhh24') and to_date('"
        SQL = SQL + txtToYear + txtToMonth + txtToDay + txtToHH + "', 'yyyymmddhh24')"
        SQL = SQL + " and trn_in = 'D'"

            SQL = SQL + " and SUBSTR(y_tblock, 1, 1) not IN ('S', 'R', 'D', 'V')"
        
        If chkTS.value = vbChecked Then
          SQL = SQL + " and TS_ID = '2' "
        End If
        
        If Trim(cboFM) = "F" Then
            SQL = SQL + " and fm_cd = 'F'"
        ElseIf Trim(cboFM) = "M" Then
            SQL = SQL + " and fm_cd = 'M'"
        End If
        
        If Trim(cboIX) = "I" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'I' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPI'))"
        ElseIf Trim(cboIX) = "X" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'X' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPX'))"
        End If
        
        If Trim(cboType.Text) <> "*" Then
            SQL = SQL + " and F_TYPE_MAP(ty_cd) = '" & Trim(cboType.Text) & "'"
        End If
        
        If Trim(cboSize.Text) <> "*" Then
            SQL = SQL + " and F_SIZE_MAP(sz_cd, 1) = '" & Trim(cboSize.Text) & "'"
        End If

         SQL = SQL + " union all "

            SQL = SQL + "select min('반출') 구분,"

        If Trim(cbovan) = "VAN" Then
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '01', 1, 0))   day_01,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '02', 1, 0))   day_02,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '03', 1, 0))   day_03,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '04', 1, 0))   day_04,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '05', 1, 0))   day_05,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '06', 1, 0))   day_06,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '07', 1, 0))   day_07,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '08', 1, 0))   day_08,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '09', 1, 0))   day_09,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '10', 1, 0))   day_10,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '11', 1, 0))   day_11,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '12', 1, 0))   day_12,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '13', 1, 0))   day_13,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '14', 1, 0))   day_14,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '15', 1, 0))   day_15,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '16', 1, 0))   day_16,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '17', 1, 0))   day_17,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '18', 1, 0))   day_18,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '19', 1, 0))   day_19,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '20', 1, 0))   day_20,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '21', 1, 0))   day_21,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '22', 1, 0))   day_22,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '23', 1, 0))   day_23,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '24', 1, 0))   day_24,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '25', 1, 0))   day_25,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '26', 1, 0))   day_26,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '27', 1, 0))   day_27,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '28', 1, 0))   day_28,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '29', 1, 0))   day_29,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '30', 1, 0))   day_30,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '31', 1, 0))   day_31,"
            SQL = SQL & "        count(*) tot"
            SQL = SQL & "   from t_cntr"

        Else
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '01', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_01,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '02', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_02,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '03', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_03,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '04', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_04,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '05', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_05,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '06', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_06,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '07', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_07,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '08', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_08,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '09', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_09,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '10', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_10,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '11', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_11,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '12', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_12,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '13', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_13,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '14', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_14,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '15', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_15,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '16', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_16,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '17', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_17,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '18', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_18,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '19', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_19,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '20', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_20,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '21', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_21,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '22', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_22,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '23', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_23,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '24', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_24,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '25', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_25,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '26', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_26,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '27', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_27,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '28', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_28,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '29', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_29,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '30', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_30,"
            SQL = SQL & "        sum(decode(to_char(gout_dt, 'dd'), '31', decode(substr(sz_cd,1,1),'2',1,2), 0))   day_31,"
            SQL = SQL & "        sum(decode(substr(sz_cd,1,1),'2',1,2)) tot"
            SQL = SQL & "   from t_cntr"
        End If
        
        SQL = SQL + "  where gout_dt between to_date('"
        SQL = SQL + txtFromYear + txtFromMonth + txtFromDay + txtFromHH + "', 'yyyymmddhh24') and to_date('"
        SQL = SQL + txtToYear + txtToMonth + txtToDay + txtToHH + "', 'yyyymmddhh24')"
        SQL = SQL + " and trn_out = 'D'"
        
            SQL = SQL + " and SUBSTR(y_tblock, 1, 1) not IN ('S', 'R', 'D', 'V')"
        
        If chkTS.value = vbChecked Then
          SQL = SQL + " and TS_ID = '2' "
        End If
        
        If Trim(cboFM) = "F" Then
            SQL = SQL + " and fm_cd = 'F'"
        ElseIf Trim(cboFM) = "M" Then
            SQL = SQL + " and fm_cd = 'M'"
        End If
        
        If Trim(cboIX) = "I" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'I' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPI'))"
        ElseIf Trim(cboIX) = "X" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'X' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPX'))"
        End If
        
        If Trim(cboType.Text) <> "*" Then
            SQL = SQL + " and F_TYPE_MAP(ty_cd) = '" & Trim(cboType.Text) & "'"
        End If
        
        If Trim(cboSize.Text) <> "*" Then
            SQL = SQL + " and F_SIZE_MAP(sz_cd, 1) = '" & Trim(cboSize.Text) & "'"
        End If

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con, adOpenForwardOnly
    
    If Rs.EOF Then
        SELECT_date = False
        MsgBox "해당하는 자료가 없습니다", vbExclamation, Me.Caption
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        Exit Function
    Else
        Rs.MoveFirst
        V_NUM = 1
        V_cnt = 1
        Do While Not Rs.EOF
        
            If IIf(IsNull(Rs!구분), " ", Trim(Rs!구분)) = "반입" Then
                V_cnt = 1
            ElseIf IIf(IsNull(Rs!구분), " ", Trim(Rs!구분)) = "반출" Then
                V_cnt = 2
            End If
            
            spslist(2).SetText 1, V_cnt, IIf(IsNull(Rs!day_01), " ", IIf(Trim(Rs!day_01) = 0, "", Trim(Rs!day_01)))
            spslist(2).SetText 2, V_cnt, IIf(IsNull(Rs!day_02), " ", IIf(Trim(Rs!day_02) = 0, "", Trim(Rs!day_02)))
            spslist(2).SetText 3, V_cnt, IIf(IsNull(Rs!day_03), " ", IIf(Trim(Rs!day_03) = 0, "", Trim(Rs!day_03)))
            spslist(2).SetText 4, V_cnt, IIf(IsNull(Rs!day_04), " ", IIf(Trim(Rs!day_04) = 0, "", Trim(Rs!day_04)))
            spslist(2).SetText 5, V_cnt, IIf(IsNull(Rs!day_05), " ", IIf(Trim(Rs!day_05) = 0, "", Trim(Rs!day_05)))
            spslist(2).SetText 6, V_cnt, IIf(IsNull(Rs!day_06), " ", IIf(Trim(Rs!day_06) = 0, "", Trim(Rs!day_06)))
            spslist(2).SetText 7, V_cnt, IIf(IsNull(Rs!day_07), " ", IIf(Trim(Rs!day_07) = 0, "", Trim(Rs!day_07)))
            spslist(2).SetText 8, V_cnt, IIf(IsNull(Rs!day_08), " ", IIf(Trim(Rs!day_08) = 0, "", Trim(Rs!day_08)))
            spslist(2).SetText 9, V_cnt, IIf(IsNull(Rs!day_09), " ", IIf(Trim(Rs!day_09) = 0, "", Trim(Rs!day_09)))
            spslist(2).SetText 10, V_cnt, IIf(IsNull(Rs!day_10), " ", IIf(Trim(Rs!day_10) = 0, "", Trim(Rs!day_10)))
            spslist(2).SetText 11, V_cnt, IIf(IsNull(Rs!day_11), " ", IIf(Trim(Rs!day_11) = 0, "", Trim(Rs!day_11)))
            spslist(2).SetText 12, V_cnt, IIf(IsNull(Rs!day_12), " ", IIf(Trim(Rs!day_12) = 0, "", Trim(Rs!day_12)))
            spslist(2).SetText 13, V_cnt, IIf(IsNull(Rs!day_13), " ", IIf(Trim(Rs!day_13) = 0, "", Trim(Rs!day_13)))
            spslist(2).SetText 14, V_cnt, IIf(IsNull(Rs!day_14), " ", IIf(Trim(Rs!day_14) = 0, "", Trim(Rs!day_14)))
            spslist(2).SetText 15, V_cnt, IIf(IsNull(Rs!day_15), " ", IIf(Trim(Rs!day_15) = 0, "", Trim(Rs!day_15)))
            spslist(2).SetText 16, V_cnt, IIf(IsNull(Rs!day_16), " ", IIf(Trim(Rs!day_16) = 0, "", Trim(Rs!day_16)))
            spslist(2).SetText 17, V_cnt, IIf(IsNull(Rs!day_17), " ", IIf(Trim(Rs!day_17) = 0, "", Trim(Rs!day_17)))
            spslist(2).SetText 18, V_cnt, IIf(IsNull(Rs!day_18), " ", IIf(Trim(Rs!day_18) = 0, "", Trim(Rs!day_18)))
            spslist(2).SetText 19, V_cnt, IIf(IsNull(Rs!day_19), " ", IIf(Trim(Rs!day_19) = 0, "", Trim(Rs!day_19)))
            spslist(2).SetText 20, V_cnt, IIf(IsNull(Rs!day_20), " ", IIf(Trim(Rs!day_20) = 0, "", Trim(Rs!day_20)))
            spslist(2).SetText 21, V_cnt, IIf(IsNull(Rs!day_21), " ", IIf(Trim(Rs!day_21) = 0, "", Trim(Rs!day_21)))
            spslist(2).SetText 22, V_cnt, IIf(IsNull(Rs!day_22), " ", IIf(Trim(Rs!day_22) = 0, "", Trim(Rs!day_22)))
            spslist(2).SetText 23, V_cnt, IIf(IsNull(Rs!day_23), " ", IIf(Trim(Rs!day_23) = 0, "", Trim(Rs!day_23)))
            spslist(2).SetText 24, V_cnt, IIf(IsNull(Rs!day_24), " ", IIf(Trim(Rs!day_24) = 0, "", Trim(Rs!day_24)))
            spslist(2).SetText 25, V_cnt, IIf(IsNull(Rs!day_25), " ", IIf(Trim(Rs!day_25) = 0, "", Trim(Rs!day_25)))
            spslist(2).SetText 26, V_cnt, IIf(IsNull(Rs!day_26), " ", IIf(Trim(Rs!day_26) = 0, "", Trim(Rs!day_26)))
            spslist(2).SetText 27, V_cnt, IIf(IsNull(Rs!day_27), " ", IIf(Trim(Rs!day_27) = 0, "", Trim(Rs!day_27)))
            spslist(2).SetText 28, V_cnt, IIf(IsNull(Rs!day_28), " ", IIf(Trim(Rs!day_28) = 0, "", Trim(Rs!day_28)))
            spslist(2).SetText 29, V_cnt, IIf(IsNull(Rs!day_29), " ", IIf(Trim(Rs!day_29) = 0, "", Trim(Rs!day_29)))
            spslist(2).SetText 30, V_cnt, IIf(IsNull(Rs!day_30), " ", IIf(Trim(Rs!day_30) = 0, "", Trim(Rs!day_30)))
            spslist(2).SetText 31, V_cnt, IIf(IsNull(Rs!day_31), " ", IIf(Trim(Rs!day_31) = 0, "", Trim(Rs!day_31)))
            spslist(2).SetText 32, V_cnt, IIf(IsNull(Rs!Tot), " ", IIf(Trim(Rs!Tot) = 0, "", Trim(Rs!Tot)))
                
            Rs.MoveNext
        Loop
        SELECT_date = True
        
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    
    Exit Function
ErrMsg:
    SELECT_date = False
    Screen.MousePointer = 0
    MsgBox "TABLE SELECT_day function Error(T_cntr)" & vbCrLf & Err.Description, vbCritical, Me.Caption

End Function

Private Function SELECT_day() As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim V_NUM As Integer
    Dim V_cnt As Integer
    Dim i As Integer
    Dim overilsu As Integer
    Dim chr_date As String
    Dim work_cd As String
    Dim j As Integer
    Dim var As Variant
    Dim rtn As Boolean
    
On Error GoTo ErrMsg
    
    Screen.MousePointer = 11
    
        If Trim(cbovan) = "VAN" Then
            SQL = "select min('반입') 구분," & _
                  "       sum(decode(to_char(gin_dt,'d'),1,1,0)) 일요일," & _
                  "       sum(decode(to_char(gin_dt,'d'),2,1,0)) 월요일," & _
                  "       sum(decode(to_char(gin_dt,'d'),3,1,0)) 화요일," & _
                  "       sum(decode(to_char(gin_dt,'d'),4,1,0)) 수요일," & _
                  "       sum(decode(to_char(gin_dt,'d'),5,1,0)) 목요일," & _
                  "       sum(decode(to_char(gin_dt,'d'),6,1,0)) 금요일," & _
                  "       sum(decode(to_char(gin_dt,'d'),7,1,0)) 토요일," & _
                  "       count(*) tot" & _
                  "  from t_cntr"
        Else
            SQL = "select min('반입') 구분," & _
                  "        sum(decode(to_char(gin_dt,'d'),1,decode(substr(sz_cd,1,1),'2',1,2),0)) 일요일," & _
                  "        sum(decode(to_char(gin_dt,'d'),2,decode(substr(sz_cd,1,1),'2',1,2),0)) 월요일," & _
                  "        sum(decode(to_char(gin_dt,'d'),3,decode(substr(sz_cd,1,1),'2',1,2),0)) 화요일," & _
                  "        sum(decode(to_char(gin_dt,'d'),4,decode(substr(sz_cd,1,1),'2',1,2),0)) 수요일," & _
                  "        sum(decode(to_char(gin_dt,'d'),5,decode(substr(sz_cd,1,1),'2',1,2),0)) 목요일," & _
                  "        sum(decode(to_char(gin_dt,'d'),6,decode(substr(sz_cd,1,1),'2',1,2),0)) 금요일," & _
                  "        sum(decode(to_char(gin_dt,'d'),7,decode(substr(sz_cd,1,1),'2',1,2),0)) 토요일," & _
                  "        sum(decode(substr(sz_cd,1,1),'2',1,2)) tot" & _
                  "  from t_cntr"
        End If
        
        SQL = SQL + "  where gin_dt between to_date('"
        SQL = SQL + txtFromYear + txtFromMonth + txtFromDay + txtFromHH + "', 'yyyymmddhh24') and to_date('"
        SQL = SQL + txtToYear + txtToMonth + txtToDay + txtToHH + "', 'yyyymmddhh24')"
        SQL = SQL + " and trn_in = 'D'"
    
        
        
            SQL = SQL + " and SUBSTR(y_tblock, 1, 1) not IN ('S', 'R', 'D', 'V')"
    
        
        If chkTS.value = vbChecked Then
          SQL = SQL + " and TS_ID = '2' "
        End If
    
    
        
        If Trim(cboFM) = "F" Then
            SQL = SQL + " and fm_cd = 'F'"
        ElseIf Trim(cboFM) = "M" Then
            SQL = SQL + " and fm_cd = 'M'"
        End If
        
        If Trim(cboIX) = "I" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'I' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPI'))"
        ElseIf Trim(cboIX) = "X" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'X' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPX'))"
        End If
        
        If Trim(cboType.Text) <> "*" Then
            SQL = SQL + " and F_TYPE_MAP(ty_cd) = '" & Trim(cboType.Text) & "'"
        End If
        
        If Trim(cboSize.Text) <> "*" Then
            SQL = SQL + " and F_SIZE_MAP(sz_cd, 1) = '" & Trim(cboSize.Text) & "'"
        End If

        SQL = SQL + " union all "

        If Trim(cbovan) = "VAN" Then

                SQL = SQL + "select min('반출') 구분,"

            SQL = SQL + " sum(decode(to_char(gout_dt,'d'),1,1,0)) 일요일," & _
                  "       sum(decode(to_char(gout_dt,'d'),2,1,0)) 월요일," & _
                  "       sum(decode(to_char(gout_dt,'d'),3,1,0)) 화요일," & _
                  "       sum(decode(to_char(gout_dt,'d'),4,1,0)) 수요일," & _
                  "       sum(decode(to_char(gout_dt,'d'),5,1,0)) 목요일," & _
                  "       sum(decode(to_char(gout_dt,'d'),6,1,0)) 금요일," & _
                  "       sum(decode(to_char(gout_dt,'d'),7,1,0)) 토요일," & _
                  "       count(*) tot" & _
                  "  from t_cntr"
        Else

                SQL = SQL + "select min('반출') 구분,"

            SQL = SQL + "  sum(decode(to_char(gout_dt,'d'),1,decode(substr(sz_cd,1,1),'2',1,2),0)) 일요일," & _
                  "        sum(decode(to_char(gout_dt,'d'),2,decode(substr(sz_cd,1,1),'2',1,2),0)) 월요일," & _
                  "        sum(decode(to_char(gout_dt,'d'),3,decode(substr(sz_cd,1,1),'2',1,2),0)) 화요일," & _
                  "        sum(decode(to_char(gout_dt,'d'),4,decode(substr(sz_cd,1,1),'2',1,2),0)) 수요일," & _
                  "        sum(decode(to_char(gout_dt,'d'),5,decode(substr(sz_cd,1,1),'2',1,2),0)) 목요일," & _
                  "        sum(decode(to_char(gout_dt,'d'),6,decode(substr(sz_cd,1,1),'2',1,2),0)) 금요일," & _
                  "        sum(decode(to_char(gout_dt,'d'),7,decode(substr(sz_cd,1,1),'2',1,2),0)) 토요일," & _
                  "        sum(decode(substr(sz_cd,1,1),'2',1,2)) tot" & _
                  "  from t_cntr"
        End If
        
        SQL = SQL + "  where gout_dt between to_date('"
        SQL = SQL + txtFromYear + txtFromMonth + txtFromDay + txtFromHH + "', 'yyyymmddhh24') and to_date('"
        SQL = SQL + txtToYear + txtToMonth + txtToDay + txtToHH + "', 'yyyymmddhh24')"
        SQL = SQL + " and trn_out = 'D'"
        

            SQL = SQL + " and SUBSTR(y_tblock, 1, 1) not IN ('S', 'R', 'D', 'V')"
  
        
        If chkTS.value = vbChecked Then
          SQL = SQL + " and TS_ID = '2' "
        End If
    

        
        If Trim(cboFM) = "F" Then
            SQL = SQL + " and fm_cd = 'F'"
        ElseIf Trim(cboFM) = "M" Then
            SQL = SQL + " and fm_cd = 'M'"
        End If
        
        If Trim(cboIX) = "I" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'I' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPI'))"
        ElseIf Trim(cboIX) = "X" Then
            SQL = SQL + " and (substr(cur_stat, 1, 1) = 'X' or (substr(cur_stat, 1, 1) = 'M' and pod = 'ZZOPX'))"
        End If
        
        If Trim(cboType.Text) <> "*" Then
            SQL = SQL + " and F_TYPE_MAP(ty_cd) = '" & Trim(cboType.Text) & "'"
        End If
        
        If Trim(cboSize.Text) <> "*" Then
            SQL = SQL + " and F_SIZE_MAP(sz_cd, 1) = '" & Trim(cboSize.Text) & "'"
        End If

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con, adOpenForwardOnly
    
    If Rs.EOF Then
        SELECT_day = False
        MsgBox "해당하는 자료가 없습니다", vbExclamation, Me.Caption
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        Exit Function
    Else
        Rs.MoveFirst
        V_NUM = 1
        V_cnt = 1
        Do While Not Rs.EOF
            If IIf(IsNull(Rs!구분), " ", Trim(Rs!구분)) = "반입" Then
                V_cnt = 1
                spslist(1).SetText 1, V_cnt, IIf(IsNull(Rs!일요일), " ", IIf(Trim(Rs!일요일) = 0, "", Trim(Rs!일요일)))
                spslist(1).SetText 2, V_cnt, IIf(IsNull(Rs!월요일), " ", IIf(Trim(Rs!월요일) = 0, "", Trim(Rs!월요일)))
                spslist(1).SetText 3, V_cnt, IIf(IsNull(Rs!화요일), " ", IIf(Trim(Rs!화요일) = 0, "", Trim(Rs!화요일)))
                spslist(1).SetText 4, V_cnt, IIf(IsNull(Rs!수요일), " ", IIf(Trim(Rs!수요일) = 0, "", Trim(Rs!수요일)))
                spslist(1).SetText 5, V_cnt, IIf(IsNull(Rs!목요일), " ", IIf(Trim(Rs!목요일) = 0, "", Trim(Rs!목요일)))
                spslist(1).SetText 6, V_cnt, IIf(IsNull(Rs!금요일), " ", IIf(Trim(Rs!금요일) = 0, "", Trim(Rs!금요일)))
                spslist(1).SetText 7, V_cnt, IIf(IsNull(Rs!토요일), " ", IIf(Trim(Rs!토요일) = 0, "", Trim(Rs!토요일)))
                spslist(1).SetText 8, V_cnt, IIf(IsNull(Rs!Tot), " ", IIf(Trim(Rs!Tot) = 0, "", Trim(Rs!Tot)))
            ElseIf IIf(IsNull(Rs!구분), " ", Trim(Rs!구분)) = "반출" Then
                V_cnt = 2
                spslist(1).SetText 1, V_cnt, IIf(IsNull(Rs!일요일), " ", IIf(Trim(Rs!일요일) = 0, "", Trim(Rs!일요일)))
                spslist(1).SetText 2, V_cnt, IIf(IsNull(Rs!월요일), " ", IIf(Trim(Rs!월요일) = 0, "", Trim(Rs!월요일)))
                spslist(1).SetText 3, V_cnt, IIf(IsNull(Rs!화요일), " ", IIf(Trim(Rs!화요일) = 0, "", Trim(Rs!화요일)))
                spslist(1).SetText 4, V_cnt, IIf(IsNull(Rs!수요일), " ", IIf(Trim(Rs!수요일) = 0, "", Trim(Rs!수요일)))
                spslist(1).SetText 5, V_cnt, IIf(IsNull(Rs!목요일), " ", IIf(Trim(Rs!목요일) = 0, "", Trim(Rs!목요일)))
                spslist(1).SetText 6, V_cnt, IIf(IsNull(Rs!금요일), " ", IIf(Trim(Rs!금요일) = 0, "", Trim(Rs!금요일)))
                spslist(1).SetText 7, V_cnt, IIf(IsNull(Rs!토요일), " ", IIf(Trim(Rs!토요일) = 0, "", Trim(Rs!토요일)))
                spslist(1).SetText 8, V_cnt, IIf(IsNull(Rs!Tot), " ", IIf(Trim(Rs!Tot) = 0, "", Trim(Rs!Tot)))
            End If
                
            Rs.MoveNext
        Loop
        SELECT_day = True
        
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    
    Exit Function
ErrMsg:
    SELECT_day = False
    Screen.MousePointer = 0
    MsgBox "TABLE SELECT_day function Error(T_cntr)" & vbCrLf & Err.Description, vbCritical, Me.Caption

End Function

Private Sub SSTab11_Click(PreviousTab As Integer)
    Dim i As Integer

    If SSTab11.Tab = 0 Then
        Display_Chart1
        txtFromHH.Enabled = True
        txtToHH.Enabled = True
        
        Call TextYear(txtFromYear)
        Call TextMonth(txtFromMonth)
        Call TextDay(txtFromDay, G_CurrentDate)
        
        Call TextYear(txtToYear)
        Call TextMonth(txtToMonth)
        Call TextDay(txtToDay, "")
        
        txtFromHH.Text = "00"
        txtToHH.Text = "00"
    ElseIf SSTab11.Tab = 1 Then
        Display_Chart2
        spslist(1).MaxCols = 8
        spslist(1).row = 0
        
        txtFromHH.Text = "00"
        txtToHH.Text = "00"
        txtFromHH.Enabled = False
        txtToHH.Enabled = False
        
        Call TextYear(txtFromYear)
        Call TextMonth(txtFromMonth)
        Call TextDay(txtFromDay, "tab1")
        
        Call TextYear(txtToYear)
        Call TextMonth(txtToMonth)
        Call TextDay(txtToDay, "")
        
        For i = 0 To spslist(1).MaxCols - 1
            spslist(1).ColWidth(i + 1) = 9.9
            spslist(1).col = i + 1
            Select Case i + 1
                Case 1
                    spslist(1).Text = "일"
                Case 2
                    spslist(1).Text = "월"
                Case 3
                    spslist(1).Text = "화"
                Case 4
                    spslist(1).Text = "수"
                Case 5
                    spslist(1).Text = "목"
                Case 6
                    spslist(1).Text = "금"
                Case 7
                    spslist(1).Text = "토"
                Case Else
                    spslist(1).Text = "합계"
            End Select
        Next i
    Else
        Dim year, month As String
        Dim totalDay As Integer
                
        Display_Chart3
        
        Call GetHostDateTime
        year = Mid(Trim(G_CurrentDate), 1, 4)
        month = Mid(Trim(G_CurrentDate), 5, 2)

        txtFromHH.Text = "00"
        txtToHH.Text = "00"
        txtFromHH.Enabled = False
        txtToHH.Enabled = False
        
        totalDay = LastDaysOfMonths(Trim(year + month))
        txtFromMonth.Text = "0" & txtFromMonth.Text - 1
        Call TextDay(txtFromDay, "tab2")
        
        Call TextYear(txtToYear)
        Call TextMonth(txtToMonth)
        Call TextDay(txtToDay, "")
        
        spslist(2).MaxCols = totalDay + 1
        spslist(2).row = 0
        
        For i = 0 To spslist(2).MaxCols - 1
            spslist(2).ColWidth(i + 1) = 2.43
            spslist(2).col = i + 1
            If i = spslist(2).MaxCols - 1 Then
                spslist(2).Text = "합계"
                spslist(2).ColWidth(i + 1) = 5
            Else
                spslist(2).Text = i + 1
            End If
        Next i
    End If
End Sub

Private Function limitCmd1(limitDate As String, cnt As String) As String
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    SQL = "select to_char(to_date('" + limitDate + "', 'YYYYMMDD HH24-MI-SS') - " + cnt + ", 'YYYYMMDDHH24') as 차이 from dual"
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con, adOpenForwardOnly
    limitCmd1 = Trim(Rs!차이)
    Rs.Close
    Set Rs = Nothing
End Function
