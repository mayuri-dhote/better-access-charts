VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "BAC_Scripts"
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


Private m_ChartJS       As BAC_ChartJS
Private m_ColorSchemes  As BAC_ChartJS_Plugin_ColorSchemes
Private m_DataLabels    As BAC_ChartJS_Plugin_Datalabels

Public Property Get ChartJS() As BAC_ChartJS
  Set ChartJS = m_ChartJS
End Property

Public Property Get Plugin_ColorSchemes() As BAC_ChartJS_Plugin_ColorSchemes
  Set Plugin_ColorSchemes = m_ColorSchemes
End Property

Public Property Get Plugin_DataLabels() As BAC_ChartJS_Plugin_Datalabels
  Set Plugin_DataLabels = m_DataLabels
End Property

Private Sub Class_Initialize()
    Set m_ChartJS = New BAC_ChartJS
    Set m_ColorSchemes = New BAC_ChartJS_Plugin_ColorSchemes
    Set m_DataLabels = New BAC_ChartJS_Plugin_Datalabels
End Sub
