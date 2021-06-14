'# MWS Version: Version 2020.1 - Oct 21 2019 - ACIS 29.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 18 fmax = 24
'# created = '[VERSION]2017.1|26.0.1|20170224[/VERSION]


'@ use template: Antenna - Phased Array_1.cfg

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With
'----------------------------------------------------------------------------
Plot.DrawBox True
With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mu "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
' define Floquet port boundaries
With FloquetPort
     .Reset
     .SetDialogTheta "0"
     .SetDialogPhi "0"
     .SetSortCode "+beta/pw"
     .SetCustomizedListFlag "False"
     .Port "Zmax"
     .SetNumberOfModesConsidered "2"
End With
' define boundaries, the open boundary at Zmax defines floquet port
' zmin = electric
MakeSureParameterExists "theta", "0"
SetParameterDescription "theta", "spherical angle of incident plane wave"
MakeSureParameterExists "phi", "0"
SetParameterDescription "phi", "spherical angle of incident plane wave"
With Boundary
     .Xmin "unit cell"
     .Xmax "unit cell"
     .Ymin "unit cell"
     .Ymax "unit cell"
     .Zmin "electric"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
     .XPeriodicShift "0.0"
     .YPeriodicShift "0.0"
     .ZPeriodicShift "0.0"
     .PeriodicUseConstantAngles "False"
     .SetPeriodicBoundaryAngles "theta", "phi"
     .SetPeriodicBoundaryAnglesDirection "outward"
     .UnitCellFitToBoundingBox "True"
     .UnitCellDs1 "0.0"
     .UnitCellDs2 "0.0"
     .UnitCellAngle "90.0"
End With
' set FD solver excitation to all non-Floquet ports
With FDSolver
     .Reset
     .Stimulation "All", "All"
     .LowFrequencyStabilization "False"
End With
With FarfieldPlot
	.ClearCuts ' lateral=phi, polar=theta
	.AddCut "lateral", "0", "1"
	.AddCut "lateral", "90", "1"
	.AddCut "polar", "90", "1"
End With
'----------------------------------------------------------------------------
'set the frequency range
Solver.FrequencyRange "11.4", "12.6"
Dim sDefineAt As String
sDefineAt = "11.4;12;12.6"
Dim sDefineAtName As String
sDefineAtName = "11.4;12;12.6"
Dim sDefineAtToken As String
sDefineAtToken = "f="
Dim aFreq() As String
aFreq = Split(sDefineAt, ";")
Dim aNames() As String
aNames = Split(sDefineAtName, ";")
Dim nIndex As Integer
For nIndex = LBound(aFreq) To UBound(aFreq)
Dim zz_val As String
zz_val = aFreq (nIndex)
Dim zz_name As String
zz_name = sDefineAtToken & aNames (nIndex)
' Define E-Field Monitors
With Monitor
    .Reset
    .Name "e-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency zz_val
    .Create
End With
' Define H-Field Monitors
With Monitor
    .Reset
    .Name "h-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency zz_val
    .Create
End With
' Define Farfield Monitors
With Monitor
    .Reset
    .Name "farfield ("& zz_name &")"
    .Domain "Frequency"
    .FieldType "Farfield"
    .Frequency zz_val
    .ExportFarfieldSource "False"
    .Create
End With
Next
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Tet"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "Tetrahedral"
End With
'set the solver type
ChangeSolverType("HF Frequency Domain")

'@ align wcs with global plane

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With WCS
     .SetNormal "1", "0", "0"
     .SetUVector "0", "1", "0"
     .ActivateWCS "local" 
End With

'@ new component: component1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Component.New "component1"

'@ define brick: component1:solid1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "D_Viva1", "D_Viva2" 
     .Yrange "0", "S_Viva" 
     .Zrange "0", "T_Viva" 
     .Create
End With

'@ delete shape: component1:solid1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Delete "component1:solid1"

'@ define material: material1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Material 
     .Reset 
     .Name "material1"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "2.2"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NonlinearMeasurementError "1e-1"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .HeatCapacity "0"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "0", "0.501961", "0" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define brick: component1:solid1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "material1" 
     .Xrange "D_Viva1", "D_Viva2" 
     .Yrange "0", "S_Viva" 
     .Zrange "0", "T_Viva" 
     .Create
End With

'@ define curve analytical: curve1:analytical1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With AnalyticalCurve
     .Reset 
     .Name "analytical1" 
     .Curve "curve1" 
     .LawX "0.15*exp(3.8*t)" 
     .LawY "t*30" 
     .LawZ "0" 
     .ParameterRange "0", "1" 
     .Create
End With

'@ pick end point

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Pick.PickCurveEndpointFromId "curve1:analytical1", "2"

'@ pick end point

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Pick.PickCurveEndpointFromId "curve1:analytical1", "1"

'@ define curve polygon: curve1:polygon1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Polygon 
     .Reset 
     .Name "polygon1" 
     .Curve "curve1" 
     .Point "6.705178", "30" 
     .LineTo "7", "30" 
     .LineTo "7", "0" 
     .LineTo "0.15", "0" 
     .Create 
End With

'@ define coverprofile: component1:solid2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With CoverCurve
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "PEC" 
     .Curve "curve1:analytical1" 
     .DeleteCurve "True" 
     .Create
End With

'@ pick face

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Pick.PickFaceFromId "component1:solid2", "1"

'@ define extrude: component1:Vibrator1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Extrude 
     .Reset 
     .Name "Vibrator1" 
     .Component "component1" 
     .Material "PEC" 
     .Mode "Picks" 
     .Height "T_Vibrator" 
     .Twist "0.0" 
     .Taper "0.0" 
     .UsePicksForHeight "False" 
     .DeleteBaseFaceSolid "False" 
     .ClearPickedFace "True" 
     .Create 
End With

'@ activate global coordinates

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
WCS.ActivateWCS "global"

'@ activate local coordinates

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
WCS.ActivateWCS "local"

'@ activate global coordinates

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
WCS.ActivateWCS "global"

'@ activate local coordinates

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
WCS.ActivateWCS "local"

'@ align wcs with global plane

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With WCS
     .SetNormal "1", "0", "0"
     .SetUVector "0", "1", "0"
     .ActivateWCS "local" 
End With

'@ align wcs with global coordinates

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
WCS.AlignWCSWithGlobalCoordinates

'@ align wcs with global plane

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With WCS
     .SetNormal "1", "0", "0"
     .SetUVector "0", "1", "0"
     .ActivateWCS "local" 
End With

'@ align wcs with local plane

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
WCS.RotateWCS "v", "90" 
WCS.RotateWCS "w", "90"

'@ align wcs with local plane

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
WCS.RotateWCS "u", "-90" 
WCS.RotateWCS "w", "-90"

'@ align wcs with global plane

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With WCS
     .SetNormal "1", "0", "0"
     .SetUVector "0", "1", "0"
     .ActivateWCS "local" 
End With

'@ align wcs with global plane

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With WCS
     .SetNormal "1", "0", "0"
     .SetUVector "0", "1", "0"
     .ActivateWCS "local" 
End With

'@ activate global coordinates

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
WCS.ActivateWCS "global"

'@ activate local coordinates

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
WCS.ActivateWCS "local"

'@ transform: mirror component1:Vibrator1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Vibrator1" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ pick end point

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Pick.PickEndpointFromId "component1:Vibrator1", "1"

'@ pick end point

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Pick.PickEndpointFromId "component1:Vibrator1_1", "1"

'@ define discrete port: 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With DiscretePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50.0" 
     .VoltagePortImpedance "0.0" 
     .Voltage "1.0" 
     .Current "1.0" 
     .SetP1 "True", "0.15", "0", "-0.2" 
     .SetP2 "True", "-0.15", "0", "-0.2" 
     .InvertDirection "False" 
     .LocalCoordinates "True" 
     .Monitor "True" 
     .Radius "0.0" 
     .Wire "" 
     .Position "end1" 
     .Create 
End With

'@ define background

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "8" 
     .XmaxSpace "8" 
     .YminSpace "2" 
     .YmaxSpace "2" 
     .ZminSpace "2" 
     .ZmaxSpace "2" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.0"
     .Mu "1.0"
     .Sigma "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstSigma"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstSigma"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NonlinearMeasurementError "1e-1"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .HeatCapacity "0"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "0.6", "0.6", "0.6" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With

'@ define frequency range

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solver.FrequencyRange "5", "15"

'@ define frequency domain solver parameters

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .SetMethod "Tetrahedral", "General purpose" 
     .OrderTet "Second" 
     .OrderSrf "First" 
     .Stimulation "All", "All" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .ConsiderPortLossesTet "True" 
     .SetShieldAllPorts "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .SetCalculateExcitationsInParallel "True", "False", "" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "False" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .FreqDistAdaptMode "Distributed" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "False" 
     .SetOpenBCTypeHex "Default" 
     .SetOpenBCTypeTet "Default" 
     .AddMonitorSamples "True" 
     .CalcStatBField "False" 
     .CalcPowerLoss "True" 
     .CalcPowerLossPerComponent "False" 
     .StoreSolutionCoefficients "True" 
     .UseDoublePrecision "False" 
     .UseDoublePrecision_ML "True" 
     .MixedOrderSrf "False" 
     .MixedOrderTet "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "false" 
     .UseSensitivityAnalysis "False" 
     .SetStopSweepIfCriterionMet "True" 
     .SetSweepThreshold "S-Parameters", "0.01" 
     .UseSweepThreshold "S-Parameters", "True" 
     .SetSweepThreshold "Probes", "0.05" 
     .UseSweepThreshold "Probes", "True" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .SetNumberOfResultDataSamples "1001" 
     .SetResultDataSamplingMode "Automatic" 
     .SweepWeightEvanescent "1.0" 
     .AccuracyROM "1e-4" 
     .AddSampleInterval "", "", "1", "Single", "False" 
     .AddSampleInterval "", "", "", "Automatic", "False" 
     .MPIParallelization "False"
     .UseDistributedComputing "False"
     .NetworkComputingStrategy "RunRemote"
     .NetworkComputingJobCount "3"
     .UseParallelization "True"
     .MaxCPUs "96"
     .MaximumNumberOfCPUDevices "2"
End With
With IESolver
     .Reset 
     .UseFastFrequencySweep "True" 
     .UseIEGroundPlane "False" 
     .SetRealGroundMaterialName "" 
     .CalcFarFieldInRealGround "False" 
     .RealGroundModelType "Auto" 
     .PreconditionerType "Auto" 
     .ExtendThinWireModelByWireNubs "False" 
End With
With IESolver
     .SetFMMFFCalcStopLevel "0" 
     .SetFMMFFCalcNumInterpPoints "6" 
     .UseFMMFarfieldCalc "True" 
     .SetCFIEAlpha "0.500000" 
     .LowFrequencyStabilization "False" 
     .LowFrequencyStabilizationML "True" 
     .Multilayer "False" 
     .SetiMoMACC_I "0.0001" 
     .SetiMoMACC_M "0.0001" 
     .DeembedExternalPorts "True" 
     .SetOpenBC_XY "True" 
     .OldRCSSweepDefintion "False" 
     .SetAccuracySetting "Custom" 
     .CalculateSParaforFieldsources "True" 
     .NumberOfModesCMA "3" 
     .StartFrequencyCMA "-1.0" 
     .SetAccuracySettingCMA "Default" 
     .FrequencySamplesCMA "0" 
     .SetMemSettingCMA "Auto" 
End With

'@ define frequency range

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solver.FrequencyRange "10", "13"

'@ farfield plot options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "12" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ farfield array properties

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldArray
     .Reset 
     .UseArray "TRUE" 
     .Arraytype "Rectangular" 
     .XSet "10", "16.7", "-0" 
     .YSet "1", "24.5", "-0" 
     .ZSet "1", "0", "0" 
     .SetList
End With

'@ farfield plot options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "12" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ farfield array properties

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldArray
     .Reset 
     .UseArray "FALSE" 
     .Arraytype "Rectangular" 
     .XSet "1", "16.7", "-0" 
     .YSet "10", "24.5", "-0" 
     .ZSet "1", "0", "0" 
     .SetList
End With

'@ farfield plot options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "12" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ farfield array properties

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldArray
     .Reset 
     .UseArray "TRUE" 
     .Arraytype "Rectangular" 
     .XSet "1", "16.7", "-0" 
     .YSet "10", "24.5", "-0" 
     .ZSet "1", "0", "0" 
     .SetList
End With

'@ farfield plot options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "12" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ farfield array properties

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldArray
     .Reset 
     .UseArray "TRUE" 
     .Arraytype "Rectangular" 
     .XSet "1", "16.7", "-0" 
     .YSet "10", "24.5", "-0" 
     .ZSet "1", "0", "0" 
     .SetList
End With

'@ farfield plot options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "12" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ farfield array properties

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldArray
     .Reset 
     .UseArray "TRUE" 
     .Arraytype "Rectangular" 
     .XSet "1", "16.7", "-0" 
     .YSet "100", "24.5", "-0" 
     .ZSet "1", "0", "0" 
     .SetList
End With

'@ farfield plot options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "12" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ farfield array properties

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldArray
     .Reset 
     .UseArray "TRUE" 
     .Arraytype "Rectangular" 
     .XSet "1", "16.7", "-0" 
     .YSet "10", "24.5", "-0" 
     .ZSet "1", "0", "0" 
     .SetList
End With

'@ farfield plot options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "12" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ define boundaries

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Boundary
     .Xmin "unit cell"
     .Xmax "unit cell"
     .Ymin "unit cell"
     .Ymax "unit cell"
     .Zmin "electric"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
     .ApplyInAllDirections "False"
     .XPeriodicShift "0.0"
     .YPeriodicShift "0.0"
     .ZPeriodicShift "0.0"
     .PeriodicUseConstantAngles "False"
     .SetPeriodicBoundaryAngles "theta", "phi"
     .SetPeriodicBoundaryAnglesDirection "outward"
     .UnitCellFitToBoundingBox "True"
     .UnitCellDs1 "0.0"
     .UnitCellDs2 "0.0"
     .UnitCellAngle "90.0"
End With

'@ set parametersweep options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
    .SetSimulationType "Frequency" 
End With

'@ add parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1" 
End With

'@ add parsweep parameter: Sequence 1:theta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "theta", "0", "80", "9" 
End With

'@ delete parsweep parameter: Sequence 1:theta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "theta" 
End With

'@ delete parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 1" 
End With

'@ define boundaries

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Boundary
     .Xmin "unit cell"
     .Xmax "unit cell"
     .Ymin "unit cell"
     .Ymax "unit cell"
     .Zmin "electric"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
     .ApplyInAllDirections "False"
     .XPeriodicShift "0.0"
     .YPeriodicShift "0.0"
     .ZPeriodicShift "0.0"
     .PeriodicUseConstantAngles "False"
     .SetPeriodicBoundaryAngles "teta", "phi"
     .SetPeriodicBoundaryAnglesDirection "outward"
     .UnitCellFitToBoundingBox "True"
     .UnitCellDs1 "0.0"
     .UnitCellDs2 "0.0"
     .UnitCellAngle "90.0"
End With

'@ add parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1" 
End With

'@ add parsweep parameter: Sequence 1:teta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "teta", "0", "80", "9" 
End With

'@ add parsweep sequence: Sequence 2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 2" 
End With

'@ define boundaries

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Boundary
     .Xmin "unit cell"
     .Xmax "unit cell"
     .Ymin "unit cell"
     .Ymax "unit cell"
     .Zmin "electric"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
     .ApplyInAllDirections "False"
     .XPeriodicShift "0.0"
     .YPeriodicShift "0.0"
     .ZPeriodicShift "0.0"
     .PeriodicUseConstantAngles "False"
     .SetPeriodicBoundaryAngles "theta", "phi"
     .SetPeriodicBoundaryAnglesDirection "outward"
     .UnitCellFitToBoundingBox "True"
     .UnitCellDs1 "0.0"
     .UnitCellDs2 "0.0"
     .UnitCellAngle "90.0"
End With

'@ delete parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 1" 
End With

'@ delete parsweep sequence: Sequence 2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 2" 
End With

'@ add parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1" 
End With

'@ add parsweep parameter: Sequence 1:theta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "theta", "0", "80", "9" 
End With

'@ add parsweep sequence: Sequence 2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 2" 
End With

'@ add parsweep parameter: Sequence 2:theta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_ArbitraryPoints "Sequence 2", "theta", "89" 
End With

'@ delete parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 1" 
End With

'@ delete parsweep sequence: Sequence 2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 2" 
End With

'@ farfield plot options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "12" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ add parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1" 
End With

'@ add parsweep parameter: Sequence 1:theta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "theta", "0", "80", "9" 
End With

'@ add parsweep sequence: Sequence 2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 2" 
End With

'@ add parsweep parameter: Sequence 2:theta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_ArbitraryPoints "Sequence 2", "theta", "89" 
End With

'@ delete parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 1" 
End With

'@ delete parsweep sequence: Sequence 2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 2" 
End With

'@ add parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1" 
End With

'@ add parsweep parameter: Sequence 1:theta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "theta", "0", "40", "5" 
End With

'@ edit parsweep parameter: Sequence 1:theta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "theta" 
     .AddParameter_Linear "Sequence 1", "theta", "0", "80", "9" 
End With

'@ add parsweep sequence: Sequence 2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 2" 
End With

'@ add parsweep parameter: Sequence 2:D_Viva1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_ArbitraryPoints "Sequence 2", "D_Viva1", "89" 
End With

'@ delete parsweep parameter: Sequence 2:D_Viva1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 2", "D_Viva1" 
End With

'@ add parsweep parameter: Sequence 2:theta

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_ArbitraryPoints "Sequence 2", "theta", "89" 
End With

'@ define frequency range

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Solver.FrequencyRange "18", "24" 


'@ define monitor: e-field (f=21)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=21)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "21" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-0.2", "0.5", "-10.25", "10.25", "0", "37" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With 


'@ delete monitor: h-field (f=12.6)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "h-field (f=12.6)" 


'@ delete monitor: e-field (f=12.6)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "e-field (f=12.6)" 


'@ delete monitor: h-field (f=12)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "h-field (f=12)" 


'@ delete monitor: e-field (f=12)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "e-field (f=12)" 


'@ delete monitor: h-field (f=11.4)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "h-field (f=11.4)" 


'@ delete monitor: e-field (f=11.4)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "e-field (f=11.4)" 


'@ delete monitor: farfield (f=11.4)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "farfield (f=11.4)" 


'@ delete monitor: farfield (f=12)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "farfield (f=12)" 


'@ delete monitor: farfield (f=12.6)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "farfield (f=12.6)" 


'@ delete monitor: e-field (f=21)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Monitor.Delete "e-field (f=21)" 


'@ define monitor: e-field (f=21)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=21)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "21" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-0.2", "0.5", "-10.25", "10.25", "0", "37" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With 


'@ define monitor: h-field (f=21)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=21)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "21" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-0.2", "0.5", "-10.25", "10.25", "0", "37" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With 


'@ define farfield monitor: farfield (f=21)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=21)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "21" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-0.2", "0.5", "-10.25", "10.25", "0", "37" 
     .SetSubvolumeOffset "10", "10", "10", "10", "10", "10" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "FractionOfWavelength" 
     .EnableNearfieldCalculation "True" 
     .Create 
End With 


'@ define frequency domain solver parameters

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Mesh.SetCreator "High Frequency" 

With FDSolver
     .Reset 
     .SetMethod "Tetrahedral", "General purpose" 
     .OrderTet "Second" 
     .OrderSrf "First" 
     .Stimulation "All", "All" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .ConsiderPortLossesTet "True" 
     .SetShieldAllPorts "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .SetCalcBlockExcitationsInParallel "True", "True", "" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "False" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .FreqDistAdaptMode "Distributed" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "False" 
     .SetOpenBCTypeHex "Default" 
     .SetOpenBCTypeTet "Default" 
     .AddMonitorSamples "True" 
     .CalcPowerLoss "True" 
     .CalcPowerLossPerComponent "False" 
     .StoreSolutionCoefficients "True" 
     .UseDoublePrecision "False" 
     .UseDoublePrecision_ML "True" 
     .MixedOrderSrf "False" 
     .MixedOrderTet "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "True" 
     .UseFastRCSSweepIntEq "false" 
     .UseSensitivityAnalysis "False" 
     .RemoveAllStopCriteria "Hex"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Hex", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Hex", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Hex", "False"
     .RemoveAllStopCriteria "Tet"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Tet", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Tet", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Tet", "False"
     .AddStopCriterion "All Probes", "0.05", "2", "Tet", "True"
     .RemoveAllStopCriteria "Srf"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Srf", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Srf", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Srf", "False"
     .SweepMinimumSamples "3" 
     .SetNumberOfResultDataSamples "1001" 
     .SetResultDataSamplingMode "Automatic" 
     .SweepWeightEvanescent "1.0" 
     .AccuracyROM "1e-4" 
     .AddSampleInterval "", "", "1", "Single", "False" 
     .AddSampleInterval "", "", "", "Automatic", "False" 
     .MPIParallelization "False"
     .UseDistributedComputing "False"
     .NetworkComputingStrategy "RunRemote"
     .NetworkComputingJobCount "3"
     .UseParallelization "True"
     .MaxCPUs "96"
     .MaximumNumberOfCPUDevices "2"
End With

With IESolver
     .Reset 
     .UseFastFrequencySweep "True" 
     .UseIEGroundPlane "False" 
     .SetRealGroundMaterialName "" 
     .CalcFarFieldInRealGround "False" 
     .RealGroundModelType "Auto" 
     .PreconditionerType "Auto" 
     .ExtendThinWireModelByWireNubs "False" 
End With

With IESolver
     .SetFMMFFCalcStopLevel "0" 
     .SetFMMFFCalcNumInterpPoints "6" 
     .UseFMMFarfieldCalc "True" 
     .SetCFIEAlpha "0.500000" 
     .LowFrequencyStabilization "False" 
     .LowFrequencyStabilizationML "True" 
     .Multilayer "False" 
     .SetiMoMACC_I "0.0001" 
     .SetiMoMACC_M "0.0001" 
     .DeembedExternalPorts "True" 
     .SetOpenBC_XY "True" 
     .OldRCSSweepDefintion "False" 
     .SetRCSOptimizationProperties "True", "100", "0.00001" 
     .SetAccuracySetting "Custom" 
     .CalculateSParaforFieldsources "True" 
     .ModeTrackingCMA "True" 
     .NumberOfModesCMA "3" 
     .StartFrequencyCMA "-1.0" 
     .SetAccuracySettingCMA "Default" 
     .FrequencySamplesCMA "0" 
     .SetMemSettingCMA "Auto" 
     .CalculateModalWeightingCoefficientsCMA "True" 
End With


