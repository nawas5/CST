'# MWS Version: Version 2020.1 - Oct 21 2019 - ACIS 29.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 10 fmax = 40
'# created = '[VERSION]2017.1|26.0.1|20170224[/VERSION]


'@ define units

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Units 
    .Geometry "mm" 
    .Frequency "GHz"  
    .Time "ns"  
    .TemperatureUnit "Kelvin"  
    .Voltage "V"  
    .Current "A"  
    .Resistance "Ohm"  
    .Conductance "Siemens"  
    .Capacitance "PikoF" 
    .Inductance "NanoH"  
End With

'@ import external project: ..\..\Model\ASM\block\MSLINE1.mif

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Material 
     .Reset 
     .Name "Metal" 
     .Folder "MSLINE1" 
     .FrqType "all"
     .Type "Pec"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .Epsilon "1.0"
     .Mu "1.0"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
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
     .Colour "1", "1", "0" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With 
With SAT
     .Reset 
     .FileName "*MSLINE1.mif^3D.sab" 
     .SubProjectName3D "..\..\Model\ASM\block\MSLINE1.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "11.0" 
     .PortnameMap "1>1;2>3" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With
With DiscreteFacePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "-9.04371701063", "0", "1" 
     .SetP2 "True", "-9.04371701063", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "-9.04371701063", "0", "1", "-1", "0", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "0", "1", "2" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port1" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "3" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "-2.95628298937", "0", "1" 
     .SetP2 "True", "-2.95628298937", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "-2.95628298937", "0", "1", "1", "0", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "3", "4", "5" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port3" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "5" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "-9.04371701063", "0", "1" 
     .SetP2 "True", "-9.04371701063", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "-9.04371701063", "0", "1", "-1", "0", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "6", "7", "8" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port5" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "6" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "-2.95628298937", "0", "1" 
     .SetP2 "True", "-2.95628298937", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "-2.95628298937", "0", "1", "1", "0", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "9", "10", "11" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port6" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With

'@ import external project: ..\..\Model\ASM\block\MSLINE2.mif

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Material 
     .Reset 
     .Name "Metal" 
     .Folder "MSLINE2" 
     .FrqType "all"
     .Type "Pec"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .Epsilon "1.0"
     .Mu "1.0"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
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
     .Colour "1", "1", "0" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With 
With SAT
     .Reset 
     .FileName "*MSLINE2.mif^3D.sab" 
     .SubProjectName3D "..\..\Model\ASM\block\MSLINE2.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "11.0" 
     .PortnameMap "1>4;2>2" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With
With DiscreteFacePort 
     .Reset 
     .PortNumber "2" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "9.04371701063", "0", "1" 
     .SetP2 "True", "9.04371701063", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "9.04371701063", "0", "1", "1", "0", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "3", "4", "5" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port2" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "4" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "2.95628298937", "0", "1" 
     .SetP2 "True", "2.95628298937", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "2.95628298937", "0", "1", "-1", "0", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "0", "1", "2" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port4" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With

'@ import external project: ..\..\Model\ASM\block\MSLINE3.mif

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Material 
     .Reset 
     .Name "Metal" 
     .Folder "MSLINE3" 
     .FrqType "all"
     .Type "Pec"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .Epsilon "1.0"
     .Mu "1.0"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
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
     .Colour "1", "1", "0" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With 
With SAT
     .Reset 
     .FileName "*MSLINE3.mif^3D.sab" 
     .SubProjectName3D "..\..\Model\ASM\block\MSLINE3.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "11.0" 
     .PortnameMap "1>5;2>6" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With
With DiscreteFacePort 
     .Reset 
     .PortNumber "7" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "0", "9.04371701063", "1" 
     .SetP2 "True", "0", "9.04371701063", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "5.59121744186e-16", "9.04371701063", "1", "1.83697019872e-16", "1", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "0", "1", "2" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port7" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "8" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "0", "2.95628298937", "1" 
     .SetP2 "True", "0", "2.95628298937", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "-5.59121744186e-16", "2.95628298937", "1", "-1.83697019872e-16", "-1", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "3", "4", "5" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port8" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With

'@ import external project: ..\..\Model\ASM\block\MSLINE4.mif

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Material 
     .Reset 
     .Name "Metal" 
     .Folder "MSLINE4" 
     .FrqType "all"
     .Type "Pec"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .Epsilon "1.0"
     .Mu "1.0"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
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
     .Colour "1", "1", "0" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With 
With SAT
     .Reset 
     .FileName "*MSLINE4.mif^3D.sab" 
     .SubProjectName3D "..\..\Model\ASM\block\MSLINE4.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "11.0" 
     .PortnameMap "1>7;2>8" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With
With DiscreteFacePort 
     .Reset 
     .PortNumber "9" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "0", "-2.95628298937", "1" 
     .SetP2 "True", "0", "-2.95628298937", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "1.86373914729e-16", "-2.95628298937", "1", "6.12323399574e-17", "1", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "0", "1", "2" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port9" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "10" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "0", "-9.04371701063", "1" 
     .SetP2 "True", "0", "-9.04371701063", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .ReferenceWCS "-1.86373914729e-16", "-9.04371701063", "1", "-6.12323399574e-17", "-1", "0", "0", "0", "1" 
     .PortRegion "-0.5", "0", "-1.25", "1.25", "0", "0"  
     .UseMultipinAutoSetup "True" 
     .Indices "3", "4", "5" 
     .CreateImported 
End With
With Transform 
     .Reset 
     .Name "port10" 
     .Vector "0", "0", "0" 
     .AdjustVectorToSubProjectScaleFactor 
     .Matrix "1", "0", "0", "0", "1", "0", "0", "0", "1" 
     .Transform "port", "matrix" 
End With

'@ import external project: ..\..\Model\ASM\block\MSREF1.mif

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Material 
     .Reset 
     .Name "GND" 
     .Folder "MSREF1" 
     .FrqType "all"
     .Type "Pec"
     .MaterialUnit "Time", "s"
     .Epsilon "1.0"
     .Mu "1.0"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
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
     .Colour "1", "1", "0" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With 
With Material 
     .Reset 
     .Name "Substrate" 
     .Folder "MSREF1" 
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Time", "s"
     .Epsilon "4.3"
     .Mu "1.0"
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
     .TanDMModel "ConstSigma"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "1st Order"
     .DispersiveFittingSchemeMu "1st Order"
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
     .Colour "0", "0.55", "0.1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "50" 
     .Create
End With 
With SAT
     .Reset 
     .FileName "*MSREF1.mif^3D.sab" 
     .SubProjectName3D "..\..\Model\ASM\block\MSREF1.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "11.0" 
     .PortnameMap "" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With

'@ define frequency range

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solver.FrequencyRange "10", "40"

'@ define background

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "6" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .FrqType "all" 
     .Type "Normal" 
     .SetMaterialUnit "Hz", "m" 
     .Epsilon "1.0" 
     .Mu "1.0" 
     .Sigma "0.0" 
     .TanD "0.0" 
     .TanDFreq "0.0" 
     .TanDGiven "False" 
     .TanDModel "ConstSigma" 
     .ConstTanDModelOrderEps "1" 
     .ReferenceCoordSystem "Global" 
     .CoordSystemType "Cartesian" 
     .SigmaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstSigma" 
     .ConstTanDModelOrderMu "1" 
     .DispModelEps  "None" 
     .DispModelMu "None" 
     .DispersiveFittingSchemeEps "1st Order" 
     .DispersiveFittingSchemeMu "1st Order" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMu "False" 
     .NLAnisotropy "False" 
     .NLAStackingFactor "1" 
     .NLADirectionX "1" 
     .NLADirectionY "0" 
     .NLADirectionZ "0" 
     .Rho "0.0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0.0" 
     .HeatCapacity "0.0" 
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

'@ define boundaries

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Boundary 
     .Xmin "open" 
     .Xmax "open" 
     .Ymin "open" 
     .Ymax "open" 
     .Zmin "electric" 
     .Zmax "open" 
     .Xsymmetry "none" 
     .Ysymmetry "none" 
     .Zsymmetry "none" 
End With

'@ define units

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Units 
    .Geometry "mm" 
    .Frequency "GHz"  
    .Time "ns"  
    .TemperatureUnit "Kelvin"  
    .Voltage "V"  
    .Current "A"  
    .Resistance "Ohm"  
    .Conductance "Siemens"  
    .Capacitance "PikoF" 
    .Inductance "NanoH"  
End With

'@ change problem type

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
ChangeProblemType "High Frequency"

'@ set solver type

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
SetSolverType "HF_TRANSIENT" 
ChangeSolverType "HF Time Domain"

'@ delete port: port5

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Port.Delete "5"

'@ delete port: port6

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Port.Delete "6"

'@ pick edge

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Pick.PickEdgeFromId "MSLINE2:MSLINE2", "2", "2"

'@ pick edge

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Pick.PickEdgeFromId "MSREF1:GND_Bottom", "1", "1"

'@ define discrete face port: 5

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "5" 
     .Type "SParameter" 
     .Label "" 
     .Folder "" 
     .Impedance "50.0" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "9.0437170106275", "0", "1" 
     .SetP2 "True", "10.043717010627", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .FaceType "Linear" 
     .Create 
End With

'@ delete port: port5

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Delete "5"

'@ pick edge

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Pick.PickEdgeFromId "MSLINE2:MSLINE2", "2", "2"

'@ pick face

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Pick.PickFaceFromId "MSREF1:Substrate", "6"

'@ define discrete face port: 5

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "5" 
     .Type "SParameter" 
     .Label "" 
     .Folder "" 
     .Impedance "50.0" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "9.0437170106275", "0", "1" 
     .SetP2 "True", "10.043717010627", "0", "1" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "True" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .FaceType "Linear" 
     .Create 
End With

'@ delete port: port5

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Delete "5"

'@ pick edge

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Pick.PickEdgeFromId "MSLINE2:MSLINE2", "2", "2"

'@ pick edge

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Pick.PickEdgeFromId "MSREF1:GND_Bottom", "1", "1"

'@ define discrete face port: 5

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "5" 
     .Type "SParameter" 
     .Label "" 
     .Folder "" 
     .Impedance "50.0" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .CurrentAmplitude "1.0" 
     .SetP1 "True", "9.0437170106275", "0", "1" 
     .SetP2 "True", "10.043717010627", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "True" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .FaceType "Linear" 
     .Create 
End With

'@ delete port: port5

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Delete "5"

'@ define discrete port: 5

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With DiscretePort 
     .Reset 
     .PortNumber "5" 
     .Type "SParameter" 
     .Label "" 
     .Folder "" 
     .Impedance "50.0" 
     .VoltagePortImpedance "0.0" 
     .Voltage "1.0" 
     .Current "1.0" 
     .SetP1 "False", "9.047", "0.0", "0.0" 
     .SetP2 "False", "9.047", "0.0", "1" 
     .InvertDirection "True" 
     .LocalCoordinates "False" 
     .Monitor "True" 
     .Radius "0.0" 
     .Wire "" 
     .Position "end1" 
     .Create 
End With

'@ delete port: port4

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Delete "4"

'@ rename port: 2 to: 6

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Rename "2", "6"

'@ rename port: 5 to: 2

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Rename "5", "2"

'@ rename port: 6 to: 4

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Rename "6", "4"

'@ rename port: 7 to: 5

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Rename "7", "5"

'@ rename port: 8 to: 6

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Rename "8", "6"

'@ rename port: 9 to: 7

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Rename "9", "7"

'@ rename port: 10 to: 8

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Port.Rename "10", "8"

'@ define monitor: e-field (f=19)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=19)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "19" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-10.043717010627", "10.043717010627", "-10.043717010627", "10.043717010627", "-0", "1" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With 

'@ set pba mesh type

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Mesh.MeshType "PBA" 


'@ define farfield monitor: farfield (f=16)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=16)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "16" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-10.043717010627", "10.043717010627", "-10.043717010627", "10.043717010627", "-0", "1" 
     .SetSubvolumeOffset "10", "10", "10", "10", "10", "10" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "FractionOfWavelength" 
     .EnableNearfieldCalculation "True" 
     .Create 
End With 


'@ delete monitor: e-field (f=19)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Monitor 
     .Delete "e-field (f=19)" 
End With 


'@ define monitor: e-field (f=16)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=16)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "16" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-10.0437170106275", "10.0437170106275", "-10.0437170106275", "10.0437170106275", "-0", "1" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With 


'@ define time domain solver parameters

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With


