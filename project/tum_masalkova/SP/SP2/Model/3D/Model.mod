'# MWS Version: Version 2020.1 - Oct 21 2019 - ACIS 29.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 10 fmax = 40
'# created = '[VERSION]2020.1|29.0.1|20191021[/VERSION]


'@ define units

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
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



'@ set wcs properties

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With WCS 
    .SetNormal "0", "0", "1" 
    .SetOrigin "0", "0", "0" 
    .SetUVector "1", "0", "0" 
End With 



'@ activate local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "local"



'@ transform local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
TransformCurrentWCS "MSLINE1", False 



'@ import external project: ..\..\Model\DS\Block\0\B23626292\MSLINE.mif

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Material 
     .Reset 
     .Name "Metal" 
     .Folder "MSLINE1" 
     .FrqType "all" 
     .Type "Pec" 
     .MaterialUnit "Geometry", "m" 
     .Epsilon "1.0" 
     .Mu "1.0" 
     .Sigma "0" 
     .LossyMetalSIRoughness "0" 
     .TanD "0.0" 
     .TanDFreq "0.0" 
     .TanDGiven "False" 
     .TanDModel "ConstTanD" 
     .SigmaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstSigma" 
     .DispModelEps "None" 
     .DispModelMu "None" 
     .DispersiveFittingSchemeEps "General 1st" 
     .DispersiveFittingSchemeMu "General 1st" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMu "False" 
     .Rho "0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
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
     .FileName "*MSLINE.mif.sat" 
     .SubProjectName3D "..\..\Model\DS\Block\0\B23626292\MSLINE.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "12.0" 
     .PortnameMap "1>1;2>3" 
     .AssemblyPartName "MSLINE1" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With
With Pick 

     .AddEdgeImported "-1.01949430586", "3.30886176469", "1", "-1.01949430586", "-3.30886176469", "1" 
     .AddEdgeImported "-1.01949430586", "3.30886176469", "0", "-1.01949430586", "-3.30886176469", "0" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Impedance "50" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "-1.01949430586", "0", "1" 
     .SetP2 "True", "-1.01949430586", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .ReferenceWCS "-1.01949430586", "0", "1", "-1", "0", "0", "0", "0", "1"
     .PortRegion "-0.5", "0", "-3.30886176469", "3.30886176469", "0", "0"
     .UseMultipinAutoSetup "True" 
     .SetImported 
     .Create 
End With

With Pick 

     .AddEdgeImported "1.01949430586", "-3.30886176469", "1", "1.01949430586", "3.30886176469", "1" 
     .AddEdgeImported "1.01949430586", "-3.30886176469", "0", "1.01949430586", "3.30886176469", "0" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "3" 
     .Type "SParameter" 
     .Impedance "50" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "1.01949430586", "0", "1" 
     .SetP2 "True", "1.01949430586", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .ReferenceWCS "1.01949430586", "0", "1", "1", "0", "0", "0", "0", "1"
     .PortRegion "-0.5", "0", "-3.30886176469", "3.30886176469", "0", "0"
     .UseMultipinAutoSetup "True" 
     .SetImported 
     .Create 
End With



'@ activate global coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "global"



'@ set wcs properties

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With WCS 
    .SetNormal "0", "0", "1" 
    .SetOrigin "0", "0", "0" 
    .SetUVector "1", "0", "0" 
End With 



'@ activate local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "local"



'@ transform local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
TransformCurrentWCS "MSLINE2", False 



'@ import external project: ..\..\Model\DS\Block\0\B157213224\MSLINE.mif

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Material 
     .Reset 
     .Name "Metal" 
     .Folder "MSLINE2" 
     .FrqType "all" 
     .Type "Pec" 
     .MaterialUnit "Geometry", "m" 
     .Epsilon "1.0" 
     .Mu "1.0" 
     .Sigma "0" 
     .LossyMetalSIRoughness "0" 
     .TanD "0.0" 
     .TanDFreq "0.0" 
     .TanDGiven "False" 
     .TanDModel "ConstTanD" 
     .SigmaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstSigma" 
     .DispModelEps "None" 
     .DispModelMu "None" 
     .DispersiveFittingSchemeEps "General 1st" 
     .DispersiveFittingSchemeMu "General 1st" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMu "False" 
     .Rho "0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
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
     .FileName "*MSLINE.mif_1.sat" 
     .SubProjectName3D "..\..\Model\DS\Block\0\B157213224\MSLINE.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "12.0" 
     .PortnameMap "1>4;2>2" 
     .AssemblyPartName "MSLINE2" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With
With Pick 

     .AddEdgeImported "1.01949430586", "-3.30886176469", "1", "1.01949430586", "3.30886176469", "1" 
     .AddEdgeImported "1.01949430586", "-3.30886176469", "0", "1.01949430586", "3.30886176469", "0" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "2" 
     .Type "SParameter" 
     .Impedance "50" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "1.01949430586", "0", "1" 
     .SetP2 "True", "1.01949430586", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .ReferenceWCS "1.01949430586", "0", "1", "1", "0", "0", "0", "0", "1"
     .PortRegion "-0.5", "0", "-3.30886176469", "3.30886176469", "0", "0"
     .UseMultipinAutoSetup "True" 
     .SetImported 
     .Create 
End With

With Pick 

     .AddEdgeImported "-1.01949430586", "3.30886176469", "1", "-1.01949430586", "-3.30886176469", "1" 
     .AddEdgeImported "-1.01949430586", "3.30886176469", "0", "-1.01949430586", "-3.30886176469", "0" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "4" 
     .Type "SParameter" 
     .Impedance "50" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "-1.01949430586", "0", "1" 
     .SetP2 "True", "-1.01949430586", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .ReferenceWCS "-1.01949430586", "0", "1", "-1", "0", "0", "0", "0", "1"
     .PortRegion "-0.5", "0", "-3.30886176469", "3.30886176469", "0", "0"
     .UseMultipinAutoSetup "True" 
     .SetImported 
     .Create 
End With



'@ activate global coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "global"



'@ set wcs properties

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With WCS 
    .SetNormal "0", "0", "1" 
    .SetOrigin "0", "0", "0" 
    .SetUVector "1", "0", "0" 
End With 



'@ activate local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "local"



'@ transform local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
TransformCurrentWCS "MSLINE3", False 



'@ import external project: ..\..\Model\DS\Block\0\B260826472\MSLINE.mif

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Material 
     .Reset 
     .Name "Metal" 
     .Folder "MSLINE3" 
     .FrqType "all" 
     .Type "Pec" 
     .MaterialUnit "Geometry", "m" 
     .Epsilon "1.0" 
     .Mu "1.0" 
     .Sigma "0" 
     .LossyMetalSIRoughness "0" 
     .TanD "0.0" 
     .TanDFreq "0.0" 
     .TanDGiven "False" 
     .TanDModel "ConstTanD" 
     .SigmaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstSigma" 
     .DispModelEps "None" 
     .DispModelMu "None" 
     .DispersiveFittingSchemeEps "General 1st" 
     .DispersiveFittingSchemeMu "General 1st" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMu "False" 
     .Rho "0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
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
     .FileName "*MSLINE.mif_2.sat" 
     .SubProjectName3D "..\..\Model\DS\Block\0\B260826472\MSLINE.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "12.0" 
     .PortnameMap "1>5;2>6" 
     .AssemblyPartName "MSLINE3" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With
With Pick 

     .AddEdgeImported "-1.01949430586", "3.30886176469", "1", "-1.01949430586", "-3.30886176469", "1" 
     .AddEdgeImported "-1.01949430586", "3.30886176469", "0", "-1.01949430586", "-3.30886176469", "0" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "5" 
     .Type "SParameter" 
     .Impedance "50" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "-1.01949430586", "0", "1" 
     .SetP2 "True", "-1.01949430586", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .ReferenceWCS "-1.01949430586", "0", "1", "-1", "0", "0", "0", "0", "1"
     .PortRegion "-0.5", "0", "-3.30886176469", "3.30886176469", "0", "0"
     .UseMultipinAutoSetup "True" 
     .SetImported 
     .Create 
End With

With Pick 

     .AddEdgeImported "1.01949430586", "-3.30886176469", "1", "1.01949430586", "3.30886176469", "1" 
     .AddEdgeImported "1.01949430586", "-3.30886176469", "0", "1.01949430586", "3.30886176469", "0" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "6" 
     .Type "SParameter" 
     .Impedance "50" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "1.01949430586", "0", "1" 
     .SetP2 "True", "1.01949430586", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .ReferenceWCS "1.01949430586", "0", "1", "1", "0", "0", "0", "0", "1"
     .PortRegion "-0.5", "0", "-3.30886176469", "3.30886176469", "0", "0"
     .UseMultipinAutoSetup "True" 
     .SetImported 
     .Create 
End With



'@ activate global coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "global"



'@ set wcs properties

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With WCS 
    .SetNormal "0", "0", "1" 
    .SetOrigin "0", "0", "0" 
    .SetUVector "1", "0", "0" 
End With 



'@ activate local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "local"



'@ transform local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
TransformCurrentWCS "MSLINE4", False 



'@ import external project: ..\..\Model\DS\Block\0\B133968142\MSLINE.mif

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Material 
     .Reset 
     .Name "Metal" 
     .Folder "MSLINE4" 
     .FrqType "all" 
     .Type "Pec" 
     .MaterialUnit "Geometry", "m" 
     .Epsilon "1.0" 
     .Mu "1.0" 
     .Sigma "0" 
     .LossyMetalSIRoughness "0" 
     .TanD "0.0" 
     .TanDFreq "0.0" 
     .TanDGiven "False" 
     .TanDModel "ConstTanD" 
     .SigmaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstSigma" 
     .DispModelEps "None" 
     .DispModelMu "None" 
     .DispersiveFittingSchemeEps "General 1st" 
     .DispersiveFittingSchemeMu "General 1st" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMu "False" 
     .Rho "0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
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
     .FileName "*MSLINE.mif_3.sat" 
     .SubProjectName3D "..\..\Model\DS\Block\0\B133968142\MSLINE.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "12.0" 
     .PortnameMap "1>7;2>8" 
     .AssemblyPartName "MSLINE4" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With
With Pick 

     .AddEdgeImported "-1.01949430586", "3.30886176469", "1", "-1.01949430586", "-3.30886176469", "1" 
     .AddEdgeImported "-1.01949430586", "3.30886176469", "0", "-1.01949430586", "-3.30886176469", "0" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "7" 
     .Type "SParameter" 
     .Impedance "50" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "-1.01949430586", "0", "1" 
     .SetP2 "True", "-1.01949430586", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .ReferenceWCS "-1.01949430586", "0", "1", "-1", "0", "0", "0", "0", "1"
     .PortRegion "-0.5", "0", "-3.30886176469", "3.30886176469", "0", "0"
     .UseMultipinAutoSetup "True" 
     .SetImported 
     .Create 
End With

With Pick 

     .AddEdgeImported "1.01949430586", "-3.30886176469", "1", "1.01949430586", "3.30886176469", "1" 
     .AddEdgeImported "1.01949430586", "-3.30886176469", "0", "1.01949430586", "3.30886176469", "0" 
End With 
With DiscreteFacePort 
     .Reset 
     .PortNumber "8" 
     .Type "SParameter" 
     .Impedance "50" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "1.01949430586", "0", "1" 
     .SetP2 "True", "1.01949430586", "0", "0" 
     .LocalCoordinates "False" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "False" 
     .ReferenceWCS "1.01949430586", "0", "1", "1", "0", "0", "0", "0", "1"
     .PortRegion "-0.5", "0", "-3.30886176469", "3.30886176469", "0", "0"
     .UseMultipinAutoSetup "True" 
     .SetImported 
     .Create 
End With



'@ activate global coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "global"



'@ set wcs properties

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With WCS 
    .SetNormal "0", "0", "1" 
    .SetOrigin "0", "0", "0" 
    .SetUVector "1", "0", "0" 
End With 



'@ activate local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "local"



'@ transform local coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
TransformCurrentWCS "MSREF1", False 



'@ import external project: ..\..\Model\DS\Block\0\B467002206\MSREF.mif

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With Material 
     .Reset 
     .Name "GND" 
     .Folder "MSREF1" 
     .FrqType "all" 
     .Type "Pec" 
     .Epsilon "1.0" 
     .Mu "1.0" 
     .Rho "0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
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
     .Epsilon "4.3" 
     .Mu "1.0" 
     .Sigma "0" 
     .TanD "0" 
     .TanDFreq "0.0" 
     .TanDGiven "False" 
     .TanDModel "ConstTanD" 
     .SigmaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstSigma" 
     .DispModelEps "None" 
     .DispModelMu "None" 
     .DispersiveFittingSchemeEps "General 1st" 
     .DispersiveFittingSchemeMu "General 1st" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMu "False" 
     .Rho "0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
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
     .FileName "*MSREF.mif.sat" 
     .SubProjectName3D "..\..\Model\DS\Block\0\B467002206\MSREF.mif" 
     .SubProjectScaleFactor "0.001" 
     .Version "12.0" 
     .PortnameMap "" 
     .AssemblyPartName "MSREF1" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Wires "True" 
     .SolidWiresAsSolids "False" 
     .ImportSources "True" 
     .Set "ImportSensitivityInformation", "False" 
     .Read 
End With


'@ activate global coordinates

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
WCS.ActivateWCS "global"



'@ define frequency range

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Solver.FrequencyRange "10", "40"


'@ define background

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
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
     .SpecificHeat "0.0", "J/K/kg" 
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

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
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

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
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

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
ChangeProblemType "High Frequency" 



'@ set solver type

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
SetSolverType "HF_TRANSIENT" 
ChangeSolverType "HF Time Domain" 
With Solver
     .Method "Hexahedral"
End With



'@ set PBA version

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
Discretizer.PBAVersion "2019102120"

'@ farfield plot options

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
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
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Efield" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 

     .StoreSettings
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
     .SetSubvolume "-8.0194943058586", "8.0194943058586", "-8.0194943058589", "8.0194943058596", "-4.4408920985006e-16", "1" 
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
     .StimulationPort "Selected"
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
     .SetSubvolume "-8.0194943058586", "8.0194943058586", "-8.0194943058589", "8.0194943058596", "-4.4408920985006e-16", "1" 
     .SetSubvolumeOffset "10", "10", "10", "10", "10", "10" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "FractionOfWavelength" 
     .EnableNearfieldCalculation "True" 
     .Create 
End With 


