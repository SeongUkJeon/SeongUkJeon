VERSION 5.00
Begin VB.MDIForm MDIMain 
   BackColor       =   &H8000000C&
   Caption         =   "통계"
   ClientHeight    =   9060
   ClientLeft      =   13020
   ClientTop       =   585
   ClientWidth     =   15615
   LinkTopic       =   "MDIForm1"
   Begin VB.Menu mnu 
      Caption         =   "메뉴"
      Begin VB.Menu mnuDaily 
         Caption         =   "일일작업집계"
         Shortcut        =   ^D
      End
      Begin VB.Menu mnuTerm 
         Caption         =   "기간별 반출입 현황"
         Shortcut        =   ^F
      End
      Begin VB.Menu mnuExit 
         Caption         =   "종료"
         Shortcut        =   ^X
      End
   End
End
Attribute VB_Name = "MDIMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub MDIForm_Load()
    Dim X As String
    Dim HostName As String

    Screen.MousePointer = 11
    AppPath = App.Path
    X = DoEvents()
    
    Call ChekParaMeter(Me)
    
    HostName = "B"
    
    If Host_Temp_Connect(HostName) = False Then
        Screen.MousePointer = 0
        MsgBox "Host system connnet error!!"
        End
    Else
        Screen.MousePointer = 0
        Set G_Login_Form = Me
    End If
    
    Screen.MousePointer = 0
    
    Call Menu_Check(Me)
    
    frmMain.WindowState = 2
    frmMain.Show
End Sub

Private Sub mnuDaily_Click()
    Screen.MousePointer = 11
    frmTotal.WindowState = 2
    frmTotal.Show
    frmTotal.SetFocus
    Screen.MousePointer = 0
End Sub

Private Sub mnuExit_Click()
    G_Msg = "종료하시겠습니까?"
    G_Title = " Exit "
    G_Vboption = vbYesNo + vbCritical + vbDefaultButton1
    G_Result = MsgBox(G_Msg, G_Vboption, G_Title)

    If G_Result = vbYes Then
        If (G_Host_Con_FLAG = True) Then
            G_Host_Con.Close
        End If
        End
    Else
        Screen.MousePointer = 0
        Exit Sub
    End If
    Screen.MousePointer = 0
End Sub

Private Sub mnuTerm_Click()
    Screen.MousePointer = 11
    frmTerm.WindowState = 2
    frmTerm.Show
    frmTerm.SetFocus
    Screen.MousePointer = 0
End Sub
