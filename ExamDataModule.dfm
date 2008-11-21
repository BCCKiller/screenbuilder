object ExamData: TExamData
  OldCreateOrder = False
  Height = 140
  Width = 397
  object ExamTable: TAdsTable
    Active = True
    DatabaseName = 'CBSFiles'
    IndexDefs = <
      item
        Name = 'PATUNIQUE'
        Fields = 'PATUNIQUE;DATE'
      end
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end>
    StoreActive = True
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'PATUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'LAYOUTID'
        DataType = ftFloat
      end
      item
        Name = 'STICKYNOTE'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'SCREEN'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATE'
        DataType = ftDate
      end
      item
        Name = 'EXAM'
        DataType = ftBoolean
      end
      item
        Name = 'DIAG_1'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DIAG_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DIAG_3'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DIAG_4'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'R_SPHERE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_SPHERE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_CYL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_CYL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_AXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'L_AXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'R_ADD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_ADD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_PRISM1'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_PRISM1B'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'R_PRISM2'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_PRISM2B'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'L_PRISM1'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_PRISM1B'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'L_PRISM2'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_PRISM2B'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'R_VAF'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'L_VAF'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'R_VAN'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'L_VAN'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'R_KHOR'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_KHOR'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_KVER'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_KVER'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_KAXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'L_KAXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'R_VAF_O'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'L_VAF_O'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'B_VAF_O'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'R_VAN_O'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'L_VAN_O'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'B_VAN_O'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'R_VAF_U'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'L_VAF_U'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'B_VAF_U'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'R_VAN_U'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'L_VAN_U'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'B_VAN_U'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'R_SPH_O'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_SPH_O'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_CYL_O'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_CYL_O'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_AXIS_O'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'L_AXIS_O'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'RN_PRISM1'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'RN_PRISM1B'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RN_PRISM2'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'RN_PRISM2B'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LN_PRISM1'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'LN_PRISM1B'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LN_PRISM2'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'LN_PRISM2B'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'B_VAF'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'B_VAN'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'R_PD_F'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_PD_F'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'B_PD_F'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_PD_N'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_PD_N'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'B_PD_N'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CMTS'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZNEW_PAT'
        DataType = ftBoolean
      end
      item
        Name = 'ZZEXAMLAST'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZEXAMLDR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZPCP'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZETHNIC'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZCONSULT'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCON_TYP'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ZZGASTRON'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZGENITON'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZINTEGN'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZNEURON'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZPSYCHN'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZENDON'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZHEMATN'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZALLERGN'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZROSOTHN'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZROSPERT'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCARDION'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZGLAUCN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZDISEASEN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZOCHIOT2N'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZFAMRGLA'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRCAT'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRAMD'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMREYE'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRRET'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRDIS'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRBLN'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRSTR'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRDIA'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRHIS'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRTOXO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMRAMB'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMROT1'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZFAMROT2'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZTOBACCN'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZALCOHOLN'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZDRUGSN'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZSOCOTHN'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZHISMEMO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZBPSYS'
        DataType = ftSmallint
      end
      item
        Name = 'ZZBPDIAS'
        DataType = ftSmallint
      end
      item
        Name = 'ZZBPARM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZPULSE'
        DataType = ftSmallint
      end
      item
        Name = 'ZZDOMHAND'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZDOMEYE'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZDVASCOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZDVASCOS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZDVACCOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZDVACCOS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZNVASCOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZNVASCOS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZPUPILOD'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZPUPILOS'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZPUPSIZOD'
        DataType = ftFloat
      end
      item
        Name = 'ZZPUPSIZOS'
        DataType = ftFloat
      end
      item
        Name = 'ZZEOMOD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZEOMOS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZVFCONFOD'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ZZVFCONFOS'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ZZAMSLEROD'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ZZAMSLEROS'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ZZSTEREO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZDILATL'
        DataType = ftBoolean
      end
      item
        Name = 'ZZDILATTIM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZDILATDRP'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ZZCLHX'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZCLTYPE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZCLWTA'
        DataType = ftSmallint
      end
      item
        Name = 'ZZCLWTT'
        DataType = ftSmallint
      end
      item
        Name = 'ZZCLSOLTN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZCLINFOD'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLINFOS'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLGPCOD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLGPCOS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLMICROD'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLMICROS'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLSTANOD'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZCLSTANOS'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZCLINJOD'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLINJOS'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLNEOOD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLNEOOS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLEDEOD'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLEDEOS'
        DataType = ftBoolean
      end
      item
        Name = 'ZZL_MIRES'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZKTYPE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ZZSL_ADL_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADL_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADC_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADC_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CJB_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CJB_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CJP_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CJP_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CRE_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CRE_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CRD_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CRD_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CRS_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CRS_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CRT_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_CRT_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ANT_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ANT_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_LE1_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_LE1_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_LE2_R'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_LE2_L'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_ADD_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADD_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADO_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADO_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADG_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADG_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADP_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_ADP_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_AND_R'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_AND_L'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_ANC_R'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_ANC_L'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_ANF_R'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_ANF_L'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_LE4_R'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_LE4_L'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_LE5_R'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_LE5_L'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_COG_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_COG_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_DCS_R'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZSL_DCS_L'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZSL_DCR_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZSL_DCR_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZSL_DI2_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_DI2_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_DIA_R'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZSL_DIA_L'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZSL_DIF_R'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZSL_DIF_L'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZSL_RE1_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_RE1_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_RE2_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_RE2_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_MA1_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_MA1_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_MA2_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_MA2_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_VE1_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_VE1_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_VE2_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_VE2_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_PR1_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_PR1_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_PR2_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_PR2_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_PE1_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_PE1_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_PE2_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_PE2_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_VIT_R'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZSL_VIT_L'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZSL_LENS1'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZSL_LENS2'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZSL_LENS3'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZPSHAPEOD'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSHAPEOS'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZPDIROD'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZPDIROS'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZCRTLOG'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCRTHOURS'
        DataType = ftSmallint
      end
      item
        Name = 'ZZCOLOROS'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZCTDISTOD'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZCTDITOS'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZCTVDOD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZCTVDOS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZNPC'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZOBJNOTE'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZSL_CDV_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZSL_CDV_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZSL_TP_R'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZSL_TP_L'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ZZR_K_AX2'
        DataType = ftSmallint
      end
      item
        Name = 'ZZL_K_AX2'
        DataType = ftSmallint
      end
      item
        Name = 'ZZPTPN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZPMAN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZANTMEMO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZMEMOASP'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZCLINFROD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLINFROS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLGPCLOD'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLGPCLOS'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLMRROD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLMRROS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLSTLOD'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLSTLOS'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLSTROD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLSTROS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLINJROD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLINJROS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLEDEROD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLEDEROS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCLNEOLOD'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCLNEOLOS'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCTASCOD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZCATASCOS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZCATBATR'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ZZCATBATL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ZZCATBLOG'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCATCONL'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCATREOD'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ZZCATREOS'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ZZCATENDOD'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZCATENDOS'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZCATSURR'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZCATMEMO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZYID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZYCHDP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ZZYDELVRY'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ZZYEXAM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZYLENS'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZYFRAME'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZYATTACH'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ZZYMEDSTAT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ZZYMEDBEG'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ZZYMEDEND'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ZZYMEDEOMB'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ZZYMEDDED'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ZZYMEDCO'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZYMEDDIS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZYMEDPAID'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZYOCOV'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZYLIAB'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZYXCPT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ZZYRMKS'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZMUSCN'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZCONSTN'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZEARSN'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZRESPN'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZARMDN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZCATARACN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZEYEINJN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZRETINAN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZBLINDN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZSTRABN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZDIABN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZHISTON'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZTOXON'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZAMBLYN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZOCHIOT1N'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZROSSTAT'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZFORENLOG'
        DataType = ftBoolean
      end
      item
        Name = 'ZZSURGNOT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZSURGOCL'
        DataType = ftBoolean
      end
      item
        Name = 'ZZDVACCPOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZDVACCPOS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZNVACCOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZNVACCOS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZCOLOROD'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZSL_DI1_R'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZSL_DI1_L'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ZZR_MIRES'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZHOURS'
        DataType = ftFloat
      end
      item
        Name = 'ZZDVASCPOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZDVASCPOS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZRPROCED'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZRSURGEON'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZRSEYE'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZRPOOD'
        DataType = ftSmallint
      end
      item
        Name = 'ZZRPOOS'
        DataType = ftSmallint
      end
      item
        Name = 'ZZOCDICAT'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIGLA'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIAMB'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIBLI'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIRET'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIOTH1'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIOTH2'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIHIS'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDITOX'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDISTR'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIARM'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIDIA'
        DataType = ftDate
      end
      item
        Name = 'ZZOCDIEYE'
        DataType = ftDate
      end
      item
        Name = 'ZZRSLOC'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZPREGNANT'
        DataType = ftBoolean
      end
      item
        Name = 'ZZKELOID'
        DataType = ftBoolean
      end
      item
        Name = 'ZZCANCER'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODLID'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSLID'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODCON'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSCON'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODCOR'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSCOR'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODAC'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSAC'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODIRI'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSIRI'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODLEN'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSLEN'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODDIS'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSDIS'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODMAC'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSMAC'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODVES'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSVES'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREODPER'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREOSPER'
        DataType = ftBoolean
      end
      item
        Name = 'ZZPERRL'
        DataType = ftBoolean
      end
      item
        Name = 'ZZRPUODDIM'
        DataType = ftFloat
      end
      item
        Name = 'ZZRPUOSDIM'
        DataType = ftFloat
      end
      item
        Name = 'ZZRPUODBRI'
        DataType = ftFloat
      end
      item
        Name = 'ZZRPUOSBRI'
        DataType = ftFloat
      end
      item
        Name = 'ZZRPATMOT'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'ZZRASSES1'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZRASSES2'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZRPLAN1'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZRPLAN2'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZRMEMO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZRCHAZLR'
        DataType = ftBoolean
      end
      item
        Name = 'ZZRCHAZLL'
        DataType = ftBoolean
      end
      item
        Name = 'ZZRCHAZRR'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZRCHAZRL'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZRCFOLRR'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZRCFOLLR'
        DataType = ftBoolean
      end
      item
        Name = 'ZZRCFOLRL'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZZRCFOLLL'
        DataType = ftBoolean
      end
      item
        Name = 'ZZREFCOMT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZRPOSTDOC'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZOCDIDIS'
        DataType = ftDate
      end
      item
        Name = 'ZZOCHISTM'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZCLTECH'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZPOSTMEMO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZIOLMANOD'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZIOLMANOS'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZIOLDIOOD'
        DataType = ftFloat
      end
      item
        Name = 'ZZIOLDIOOS'
        DataType = ftFloat
      end
      item
        Name = 'ZZIOLMODOD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZIOLMODOS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZIOLSEROD'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZIOLSEROS'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZZIOLSIZOD'
        DataType = ftFloat
      end
      item
        Name = 'ZZIOLSIZOS'
        DataType = ftSmallint
      end
      item
        Name = 'ZZIOLDATOD'
        DataType = ftDate
      end
      item
        Name = 'ZZIOLDATOS'
        DataType = ftDate
      end
      item
        Name = 'ZZMEDDEC'
        DataType = ftString
        Size = 22
      end
      item
        Name = 'ZZREVEYE'
        DataType = ftBoolean
      end
      item
        Name = 'ZZPAMOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZPAMOS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZGLARL_R'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZGLARL_L'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZGLARM_R'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZGLARM_L'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZGLARH_R'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZGLARH_L'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ZZSCHIR_R'
        DataType = ftSmallint
      end
      item
        Name = 'ZZSCHIR_L'
        DataType = ftSmallint
      end
      item
        Name = 'ZZVISFTOD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZVISFTOS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZVISFFOD'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZZVISFFOS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZZBSCANOD'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZZBSCANOS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZZINFCONS'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZIRISOD'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ZZIRISOS'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ZZIRISCOD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZIRISCOS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZSL_ACAPR'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_PCAPR'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_ACAPL'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZSL_PCAPL'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ZZBILLOPHT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZZSGNPROV1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZSGNPROV2'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZSGNTECH1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZSGNTECH2'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZIMG_CO_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_CO_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_TP_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_TP_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_LE_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_LE_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_EX_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_EX_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_RE_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_RE_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_FU_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_FU_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_DI_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_DI_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_CF_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_CF_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_AM_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_AM_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZ92015'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92020'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92081'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92082'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92083'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92100'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92140'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92225'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92226'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92235'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92250'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92285'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ76519'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92286'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ65210'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ65222'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ65430'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ65435'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ67800'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ67801'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ67805'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ67820'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ67840'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ68200'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ68760'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ68761'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ68800'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ68820'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ92499'
        DataType = ftBoolean
      end
      item
        Name = 'ZZ99070'
        DataType = ftBoolean
      end
      item
        Name = 'ZZVERRLR'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERRIR'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERRSO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERRMR'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERRIO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERRSR'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERLIO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERLSR'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERLLR'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERLIR'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERLSO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZVERLMR'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ZZSHIRMIN'
        DataType = ftSmallint
      end
      item
        Name = 'ZZSHIRANES'
        DataType = ftBoolean
      end
      item
        Name = 'ZZFUNPHOFR'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZFUNPHOFL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZGDX'
        DataType = ftDate
      end
      item
        Name = 'ZZGDXFOD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZGDXFOS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZVISFIELD'
        DataType = ftDate
      end
      item
        Name = 'ZZFLUORFR'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZFLUORFL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZ76514'
        DataType = ftBoolean
      end
      item
        Name = 'ZZEXTOPHMR'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZEXTOPHML'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZIMG_GO_R'
        DataType = ftFloat
      end
      item
        Name = 'ZZIMG_GO_L'
        DataType = ftFloat
      end
      item
        Name = 'ZZGONIOMOD'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZGONIOMOS'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZZGONACOD1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONACOD2'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONACOD3'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONACOD4'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONACOS1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONACOS2'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONACOS3'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONACOS4'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONPIOD1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONPIOD2'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONPIOD3'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONPIOD4'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONPIOS1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONPIOS2'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONPIOS3'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZGONPIOS4'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZZOCUPATN'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZVERSNOD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZVERSNOS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ZZIMG_BOTX'
        DataType = ftFloat
      end
      item
        Name = 'ZZINFECTN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZOCDINFN'
        DataType = ftDate
      end
      item
        Name = 'ZZFAMRINFN'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZZGESTATN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZBRTHWEIK'
        DataType = ftFloat
      end
      item
        Name = 'ZZBRTHWEIO'
        DataType = ftSmallint
      end
      item
        Name = 'ZZBRTHWEIL'
        DataType = ftSmallint
      end
      item
        Name = 'ZZBRTHCOMP'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZDEVELOPM'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ZZPACHOD'
        DataType = ftSmallint
      end
      item
        Name = 'ZZPACHOS'
        DataType = ftSmallint
      end>
    StoreDefs = True
    TableName = 'EXAM.DBF'
    TableType = ttAdsCDX
  end
  object S_EXAMSURG: TDataSource
    DataSet = ExamSurgTable
    Left = 304
    Top = 64
  end
  object S_EXAM: TDataSource
    DataSet = ExamTable
    Top = 56
  end
  object S_EXAMALG: TDataSource
    DataSet = ExamALGTable
    Left = 32
    Top = 56
  end
  object ExamALGTable: TAdsTable
    Active = True
    DatabaseName = 'CBSFiles'
    IndexDefs = <
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end
      item
        Name = 'PATUNIQUE'
        Fields = 'PATUNIQUE'
      end>
    StoreActive = True
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'PATUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'ADDED'
        DataType = ftDate
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'TYPE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ONSET'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'EXPIRED'
        DataType = ftDate
      end
      item
        Name = 'REACTION'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SEVERITY'
        DataType = ftString
        Size = 15
      end>
    StoreDefs = True
    TableName = 'EXAMALGY.DBF'
    TableType = ttAdsCDX
    Left = 32
  end
  object ExamALRTTable: TAdsTable
    Active = True
    DatabaseName = 'CBSFiles'
    IndexDefs = <
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end
      item
        Name = 'PATUNIQUE'
        Fields = 'PATUNIQUE'
      end>
    StoreActive = True
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'PATUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'ADDED'
        DataType = ftDate
      end
      item
        Name = 'DESC'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'EXPIRED'
        DataType = ftDate
      end>
    StoreDefs = True
    TableName = 'EXAMALRT.DBF'
    TableType = ttAdsCDX
    Left = 64
  end
  object S_EXAMALRT: TDataSource
    DataSet = ExamALRTTable
    Left = 64
    Top = 56
  end
  object ExamCLTable: TAdsTable
    Active = True
    DatabaseName = 'CBSFiles'
    IndexDefs = <
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end
      item
        Name = 'PATUNIQUE'
        Fields = 'PATUNIQUE'
      end>
    StoreActive = True
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'PATUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'R_MFG'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'L_MFG'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'R_NAME'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'L_NAME'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'R_TYPE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'L_TYPE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'R_SERIES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'L_SERIES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'R_COLOR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'L_COLOR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'R_SPHERE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_SPHERE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_CYL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_CYL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_AXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'L_AXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'R_PRISM'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_PRISM'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_ADD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_ADD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_BC'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_BC'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_BC2'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_BC2'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_DIA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_DIA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_CTRTHK'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_CTRTHK'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_OZDIA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_OZDIA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_2NDCRV'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_2NDCRV'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_2NDWTH'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_2NDWTH'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_PERCRV'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_PERCRV'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_PERWTH'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_PERWTH'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_BLEND'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_BLEND'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_EDGE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_EDGE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_STOCK'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'L_STOCK'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'R_QTY'
        DataType = ftSmallint
      end
      item
        Name = 'L_QTY'
        DataType = ftSmallint
      end
      item
        Name = 'R_VA_D'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'L_VA_D'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'R_VA_N'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'L_VA_N'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'R_OR_SPH'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_OR_SPH'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_OR_CYL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_OR_CYL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_OR_AXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'L_OR_AXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'R_OR_ADD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_OR_ADD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_OR_VA_N'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'L_OR_VA_N'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'R_OR_VA_D'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'L_OR_VA_D'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'R_POSITION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'L_POSITION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'R_COND'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'L_COND'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'R_DOT'
        DataType = ftBoolean
      end
      item
        Name = 'L_DOT'
        DataType = ftBoolean
      end
      item
        Name = 'R_WARRANTY'
        DataType = ftBoolean
      end
      item
        Name = 'L_WARRANTY'
        DataType = ftBoolean
      end
      item
        Name = 'R_SEG'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_SEG'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_CORNEA'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'L_CORNEA'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'OU_VA_D'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'OU_VA_N'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SOLUTION'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'WEARPLAN'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'EXPIRE'
        DataType = ftDate
      end
      item
        Name = 'FINAL'
        DataType = ftBoolean
      end
      item
        Name = 'MONOVISION'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NOTES'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ADDED'
        DataType = ftDate
      end
      item
        Name = 'CLUNIQUE'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'EXAMCL.DBF'
    TableType = ttAdsCDX
    Left = 96
  end
  object S_EXAMCL: TDataSource
    DataSet = ExamCLTable
    Left = 96
    Top = 64
  end
  object ExamDiagTable: TAdsTable
    Active = True
    DatabaseName = 'CBSFiles'
    IndexDefs = <
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end
      item
        Name = 'PATUNIQUE'
        Fields = 'PATUNIQUE'
      end>
    StoreActive = True
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'PATUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'DESC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DIAGNOSED'
        DataType = ftDate
      end
      item
        Name = 'EYE'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ORDER'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ASSESSMENT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'PLAN'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ADDED'
        DataType = ftDate
      end
      item
        Name = 'RESOLVED'
        DataType = ftDate
      end
      item
        Name = 'RESOLVDESC'
        DataType = ftString
        Size = 60
      end>
    StoreDefs = True
    TableName = 'EXAMDIAG.DBF'
    TableType = ttAdsCDX
    Left = 128
  end
  object S_EXAMDIAG: TDataSource
    DataSet = ExamDiagTable
    Left = 128
    Top = 56
  end
  object ExamImagTable: TAdsTable
    DatabaseName = 'CBSTools'
    IndexDefs = <
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end>
    StoreActive = True
    FieldDefs = <
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'TYPE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AREA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CATEGORY'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESC'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ADD_DATE'
        DataType = ftDate
      end
      item
        Name = 'ADD_TIME'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ADD_ID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'IMAGEPTR'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'EXAMIMAG.DBF'
    Left = 160
  end
  object S_EXAMIMAG: TDataSource
    DataSet = ExamImagTable
    Left = 160
    Top = 64
  end
  object ExamIOPTable: TAdsTable
    Active = True
    DatabaseName = 'CBSFiles'
    IndexDefs = <
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end
      item
        Name = 'PATUNIQUE'
        Fields = 'PATUNIQUE'
      end>
    StoreActive = True
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'PATUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'OD'
        DataType = ftSmallint
      end
      item
        Name = 'OS'
        DataType = ftSmallint
      end
      item
        Name = 'METHOD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DATE'
        DataType = ftDate
      end
      item
        Name = 'TIME'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'MEDS'
        DataType = ftString
        Size = 24
      end
      item
        Name = 'LOGINID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OD_P'
        DataType = ftSmallint
      end
      item
        Name = 'OS_P'
        DataType = ftSmallint
      end>
    StoreDefs = True
    TableName = 'EXAMIOP.DBF'
    TableType = ttAdsCDX
    Left = 192
  end
  object S_EXAMIOP: TDataSource
    DataSet = ExamIOPTable
    Left = 192
    Top = 64
  end
  object ExamMedTable: TAdsTable
    Active = True
    DatabaseName = 'CBSFiles'
    IndexDefs = <
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end
      item
        Name = 'PATUNIQUE'
        Fields = 'PATUNIQUE'
      end>
    StoreActive = True
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'PATUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'MEDUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DOSE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FORM'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ROUTE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'START'
        DataType = ftDate
      end
      item
        Name = 'STOP'
        DataType = ftDate
      end
      item
        Name = 'EXPIRE'
        DataType = ftDate
      end
      item
        Name = 'QTY'
        DataType = ftFloat
      end
      item
        Name = 'DAYSOFUSE'
        DataType = ftFloat
      end
      item
        Name = 'SIG'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SIGDESC'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'DRINSTRUCT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'REFILLS'
        DataType = ftFloat
      end
      item
        Name = 'PRESCRIBER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GENERIC'
        DataType = ftBoolean
      end
      item
        Name = 'SUBSTITUTE'
        DataType = ftBoolean
      end
      item
        Name = 'DIAG'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'USE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DELIVERY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PHARMACY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PHARUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'RENEWAL'
        DataType = ftDate
      end
      item
        Name = 'NOTE'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ADDED'
        DataType = ftDate
      end
      item
        Name = 'SAMPLEQTY'
        DataType = ftFloat
      end
      item
        Name = 'DISC_RSN'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RENEW'
        DataType = ftBoolean
      end
      item
        Name = 'LOT'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'EXAMMED.DBF'
    TableType = ttAdsCDX
    Left = 224
  end
  object S_EXAMMED: TDataSource
    DataSet = ExamMedTable
    Left = 224
    Top = 64
  end
  object ExamRefrTable: TAdsTable
    Active = True
    DatabaseName = 'CBSFiles'
    IndexDefs = <
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end
      item
        Name = 'PATUNIQUE'
        Fields = 'PATUNIQUE'
      end>
    StoreActive = True
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'PATUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'R_SPHERE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_CYL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_AXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'R_PRISM1'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_PRISM1B'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'R_PRISM2'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'R_PRISM2B'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'R_VA_D'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'R_ADD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'R_VA_N'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'R_BC'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_MONO_D'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_MONO_N'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'R_VERTEX'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'L_SPHERE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_CYL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_AXIS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'L_PRISM1'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_PRISM1B'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'L_PRISM2'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'L_PRISM2B'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'L_VA_D'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'L_ADD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'L_VA_N'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'L_BC'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_MONO_D'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_MONO_N'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'L_VERTEX'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PD_D'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'PD_N'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'MULTIFOCAL'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TYPE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'USE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOTES'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'OPTICAL'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'PRESCRIBER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDED'
        DataType = ftDate
      end
      item
        Name = 'GLASS_AGE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'EXPIRATION'
        DataType = ftDate
      end
      item
        Name = 'FINAL'
        DataType = ftBoolean
      end
      item
        Name = 'REFRUNIQUE'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'examrefr.dbf'
    TableType = ttAdsCDX
    Left = 256
  end
  object S_EXAMREFR: TDataSource
    DataSet = ExamRefrTable
    Left = 264
    Top = 64
  end
  object ExamSurgTable: TAdsTable
    Active = True
    DatabaseName = 'CBSFiles'
    IndexDefs = <
      item
        Name = 'EXAMUNIQUE'
        Fields = 'EXAMUNIQUE'
      end
      item
        Name = 'PATUNIQUE'
        Fields = 'PATUNIQUE'
      end>
    StoreActive = True
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'EXAMUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'PATUNIQUE'
        DataType = ftFloat
      end
      item
        Name = 'WHEN'
        DataType = ftDate
      end
      item
        Name = 'PROCEDURE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SURGEON'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EYE'
        DataType = ftString
        Size = 2
      end>
    StoreDefs = True
    TableName = 'EXAMSURG.DBF'
    TableType = ttAdsCDX
    Left = 288
  end
end
