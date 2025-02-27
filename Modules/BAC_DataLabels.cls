VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "BAC_DataLabels"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'###########################################################################################
'# Copyright (c) 2020 - 2022 Thomas Moeller, supported by K.D.Gundermann                   #
'# MIT License  => https://github.com/team-moeller/better-access-charts/blob/main/LICENSE  #
'# Version 2.06.06  published: 17.01.2022                                                  #
'###########################################################################################

Option Compare Database
Option Explicit


Private m_Show As Boolean
Private m_Anchor As chDataLabelAnchor
Private m_Font As BAC_Font

Private m_SectionIsNeeded As Boolean

' ### Initialize

Private Sub Class_Initialize()
    Set m_Font = New BAC_Font
End Sub

' ### Properties

Public Property Let Show(ByVal This_Show As Boolean)
    m_Show = This_Show
End Property
Public Property Get Show() As Boolean
    Show = m_Show
End Property

Public Property Let Anchor(ByVal This_Anchor As chDataLabelAnchor)
    m_Anchor = This_Anchor
    If This_Anchor > 0 Then
        m_SectionIsNeeded = True
    End If
End Property
Public Property Get Anchor() As chDataLabelAnchor
    Anchor = m_Anchor
End Property

Public Property Get Font() As BAC_Font
    Set Font = m_Font
End Property


' ### Generator Function

Friend Function getDataLabel() As String

    If Not Me.Show Then Exit Function
    If Not m_SectionIsNeeded = True And Not Me.Font.Color <> vbNullString And Not Me.Font.SectionIsNeeded = True Then Exit Function
    
    With New BAC_StringBuilder
        .AddLine "                datalabels: {"
        If Me.Anchor > 0 Then
            .AddLine "                    anchor: '" & getAnchorString(Me.Anchor) & "',"
        End If
        If Me.Font.Color <> vbNullString Then
            .AddLine "                    color: '" & Me.Font.Color & "',"
        End If
        If Me.Font.SectionIsNeeded Then
            .AddLine "                    font: {"
            If Me.Font.Family <> vbNullString Then
                .AddLine "                        family: '" & Me.Font.Family & "',"
            End If
            If Me.Font.Size > 0 Then
                .AddLine "                        size: " & Me.Font.Size & ","
            End If
            If Me.Font.IsBold = True Then
                .AddLine "                        weight: 'bold',"
            End If
            If Me.Font.IsItalic = True Then
                .AddLine "                        style: 'italic',"
            End If
            .CutTrailingComma
            .AddLine "                        },"
        End If
        .CutTrailingComma
        .AddLine "                    },"
        
        getDataLabel = .ToString
    End With
    
End Function

Private Function getAnchorString(ByVal ThisAnchor As chDataLabelAnchor) As String

    Select Case ThisAnchor
        Case chDataLabelAnchor.anStart
            getAnchorString = "start"
        Case chDataLabelAnchor.anCenter
            getAnchorString = "center"
        Case chDataLabelAnchor.anEnd
            getAnchorString = "end"
        Case Else
            getAnchorString = "center"
    End Select
    
End Function

