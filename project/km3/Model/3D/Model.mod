'# MWS Version: Version 2020.1 - Oct 21 2019 - ACIS 29.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0.8*frequency_minimum fmax = frequency_maximum


'@ use template: Antenna - Planar_15

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
'set the units
With Units
     .Geometry "mm"
     .Frequency "ghz"
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
     .Mue "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With
' optimize mesh settings for planar structures
With Mesh
     .MergeThinPECLayerFixpoints "True"
     .RatioLimit "20"
     .AutomeshRefineAtPecLines "True", "6"
     .FPBAAvoidNonRegUnite "True"
     .ConsiderSpaceForLowerMeshLimit "False"
     .MinimumStepNumber "5"
     .AnisotropicCurvatureRefinement "True"
     .AnisotropicCurvatureRefinementFSM "True"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementRatio", "6"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "Tet"
     .Set "VolMeshGradation", "1.5"
     .Set "SrfMeshGradation", "1.5"
End With
' change mesh adaption scheme to energy
' 		(planar structures tend to store high energy
'     	 locally at edges rather than globally in volume)
MeshAdaption3D.SetAdaptionStrategy "Energy"
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "PBA"
End With
'set the solver type
ChangeSolverType("HF Time Domain")
'----------------------------------------------------------------------------
'preserve project units
With Units 
     .Geometry "mm"
     .Frequency "ghz"
     .Time "ns" 
     .TemperatureUnit "Kelvin" 
     .Voltage "V" 
     .Current "A" 
     .Resistance "Ohm" 
     .Conductance "Siemens" 
     .Capacitance "PikoF" 
     .Inductance "NanoH" 
End With

'@ define material: substrate

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Material 
     .Reset 
     .Name "substrate"
     .FrqType "all" 
     .Type "Normal" 
     .Epsilon "relative_permittivity" 
     .Mue "1" 
     .Kappa "0" 
     .TanD "tan_delta" 
     .TanDFreq "frequency_centre" 
     .TanDGiven "True" 
     .TanDModel "ConstTanD" 
     .KappaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstTanD" 
     .DispModelEps "None" 
     .DispModelMue "None" 
     .DispersiveFittingSchemeEps "General 1st" 
     .DispersiveFittingSchemeMue "General 1st" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMue "False" 
     .Rho "0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
     .HeatCapacity "0" 
     .MetabolicRate "0" 
     .BloodFlow "0" 
     .Colour "0", "1", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define frequency range

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Solver.FrequencyRange "0.8*frequency_minimum", "frequency_maximum"

'@ activate local coordinates

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
WCS.ActivateWCS "local"

'@ move wcs

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
WCS.MoveWCS "local", "0.0", "0.0", "-substrate_height"

'@ new curve: microstrip_taper

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Curve.NewCurve "microstrip_taper"

'@ define curve polygon: microstrip_taper:microstrip_taper

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Polygon 
     .Reset 
     .Name "microstrip_taper" 
     .Curve "microstrip_taper" 
     .Point "-slotline_length+microstrip_coupler_inset+0.5*microstrip_coupler_width", "-microstrip_coupler_length+0.5*microstrip_coupler_width" 
     .LineTo "-slotline_length+microstrip_coupler_inset+0.5*microstrip_coupler_width", "-microstrip_coupler_length-0.5*microstrip_coupler_width" 
     .LineTo "-slotline_length+microstrip_coupler_inset-microstrip_taper_length", "-microstrip_coupler_length-0.5*microstrip_taper_width" 
     .LineTo "-slotline_length+microstrip_coupler_inset-microstrip_taper_length", "-microstrip_coupler_length+0.5*microstrip_taper_width" 
     .LineTo "-slotline_length+microstrip_coupler_inset-0.5*microstrip_coupler_width", "-microstrip_coupler_length+0.5*microstrip_coupler_width" 
     .LineTo "-slotline_length+microstrip_coupler_inset+0.5*microstrip_coupler_width", "-microstrip_coupler_length+0.5*microstrip_coupler_width" 
     .Create 
End With

'@ new curve: stub

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Curve.NewCurve "stub"

'@ define curve arc: stub:stub_arc

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Arc
     .Reset 
     .Name "stub_arc" 
     .Curve "stub" 
     .Orientation "Clockwise" 
     .XCenter "-slotline_length+microstrip_coupler_inset-0.5*microstrip_coupler_width" 
     .YCenter "0.5*slotline_width" 
     .X1 "-slotline_length+microstrip_coupler_inset-0.5*microstrip_coupler_width-stub_radius*cosd(stub_start_angle)" 
     .Y1 "0.5*slotline_width+stub_radius*sind(stub_start_angle)" 
     .X2 "0.0" 
     .Y2 "0.0" 
     .Angle "stub_angle" 
     .UseAngle "True" 
     .Segments "0" 
     .Create
End With

'@ define curve polygon: stub:stub_base

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Polygon 
     .Reset 
     .Name "stub_base" 
     .Curve "stub" 
     .Point "-slotline_length+microstrip_coupler_inset-0.5*microstrip_coupler_width-stub_radius*cosd(stub_start_angle)", "0.5*slotline_width+stub_radius*sind(stub_start_angle)" 
     .LineTo "-slotline_length+microstrip_coupler_inset-0.5*microstrip_coupler_width", "0.5*slotline_width" 
.LineTo "-slotline_length+microstrip_coupler_inset+0.5*microstrip_coupler_width", "0.5*slotline_width" 
.LineTo "-slotline_length+microstrip_coupler_inset-0.5*microstrip_coupler_width-stub_radius*cosd(stub_start_angle+stub_angle)", "0.5*slotline_width+stub_radius*sind(stub_start_angle+stub_angle)" 
     .Create 
End With

'@ activate global coordinates

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
WCS.ActivateWCS "global"

'@ execute macro: Vivaldi taper

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
	Dim xxx As Double, yyy As Double
	Dim cc1 As Double, cc2 As Double, den As Double, ddx As Double, pts As Double
	Dim nnn As Integer
	MakeSureParameterExists("taper_factor", "0")           
	MakeSureParameterExists("flare_length", "0")
	MakeSureParameterExists("flare_height", "0")
	MakeSureParameterExists("slotline_width", "0")
                MakeSureParameterExists("conversion_factor", "Units.GetGeometrySIToUnit")
                MakeSureParameterExists("taper_factor_corrected", "taper_factor/conversion_factor")
'	Dim xxb As Double, yyb As Double
'	Dim cb1 As Double, cb2 As Double
	'  execute macro: Construct\Curves\Create 2D-Curve analytical (xy-uv)
	On Error GoTo Curve_Exists
		Curve.NewCurve "Taper"
	Curve_Exists:
	On Error GoTo 0
	Dim ttCurveName As String
	ttCurveName = "taper_top"
	With Spline
	  .Reset
	  .Name ttCurveName
	  .Curve "Taper"
	' ======================================
	' !!! Do not change ABOVE this line !!!
	' ======================================
	' -----------------------------------------------------------
	' adjust x-range as for-loop parameters (xmin,max,stepsize)
	' enter y-Function-statement within for-loop
	' fixed parameters a,b,c have to be declared via Dim-Statement
	' -----------------------------------------------------------
	' NOTE: available MWS-Parameters can be used without
	'       declaration at any place (loop-dimensions, ...)
	'       (for parametric curves during parameter-sweeps and optimisation !)
	' -------------------------------------------
	Dim con_factor As Double
	Dim a As Double                
	'con_factor = Units.GetGeometrySIToUnit
	'a = taper_factor/con_factor
                a = taper_factor_corrected
	'StoreDoubleParameter("taper_factor_corrected",a)
	SetParameterDescription("taper_factor_corrected","Factor determining the opening rate of the flare (converted according to the current model units)")
                den =Exp(a*flare_length) - 1
	cc1 = (0.5*flare_height-0.5*slotline_width)/(den)
	  cc2 = (0.5*slotline_width*Exp(a*flare_length)-0.5*flare_height)/den
	  pts = 50
	  ddx = flare_length/(pts-1)
  	  For nnn = 0  To  pts-1  STEP  1
        xxx = nnn*ddx
		yyy = cc1*Exp(a*xxx)+cc2
		.LineTo xxx , yyy
	  Next nnn
	' ======================================
	' !!! Do not change BELOW this line !!!
	' ======================================
	  .Create
	End With
	SelectTreeItem("Curves\Taper\"+ttCurveName)
	'  execute macro: Construct\Curves\Create 2D-Curve analytical (xy-uv)
	Dim tbCurveName As String
	tbCurveName = "taper_bottom"
	With Spline
	  .Reset
	  .Name tbCurveName
	  .Curve "Taper"
	' ======================================
	' !!! Do not change ABOVE this line !!!
	' ======================================
	' -----------------------------------------------------------
	' adjust x-range as for-loop parameters (xmin,max,stepsize)
	' enter y-Function-statement within for-loop
	' fixed parameters a,b,c have to be declared via Dim-Statement
	' -----------------------------------------------------------
	' NOTE: available MWS-Parameters can be used without
	'       declaration at any place (loop-dimensions, ...)
	'       (for parametric curves during parameter-sweeps and optimisation !)
	' -------------------------------------------
	 ' den =Exp(a*flare_length) - 1
	  'cb1 = (0.5*flare_height-0.5*slotline_width)/(den)
	  'cb2 = (0.5*slotline_width*Exp(a*flare_length)-0.5*flare_height)/den
	  For nnn = 0  To  pts-1  STEP  1
        xxx = nnn*ddx
		yyy = -cc1*Exp(a*xxx)-cc2
		.LineTo xxx , yyy
	  Next nnn
	' ======================================
	' !!! Do not change BELOW this line !!!
	' ======================================
	  .Create
	End With
	SelectTreeItem("Curves\Taper\"+tbCurveName)
	'  define curve polygon: Taper:slotline
	With Polygon
	     .Reset
	     .Name "slotline"
	     .Curve "Taper"
	     .Point "0", "0.5*slotline_width"
	     .LineTo "-slotline_length", "0.5*slotline_width"
	     .LineTo "-slotline_length", "-0.5*slotline_width"
	     .LineTo "0", "-0.5*slotline_width"
	     .Create
	End With
	'  define curve line: Taper:front
	With Line
	     .Reset
	     .Name "front"
	     .Curve "Taper"
	     .X1 "flare_length"
	     .Y1 "-0.5*flare_height"
	     .X2 "flare_length"
	     .Y2 "0.5*flare_height"
	     .Create
	End With
	'  new component: Antenna
	Component.New "Antenna"
	'  define extrudeprofile: Antenna:taper
	With ExtrudeCurve
	     .Reset
	     .Name "Vivaldi_taper"
	     .Component "Antenna"
	     .Material "PEC"
	     .Thickness "-metal_thickness"
	     .Twistangle "0.0"
	     .Taperangle "0.0"
	     .Curve "Taper:taper_top"
	     .Create
	End With

'@ define extrudeprofile: Antenna:stub

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With ExtrudeCurve
     .Reset 
     .Name "stub" 
     .Component "Antenna" 
     .Material "PEC" 
     .Thickness "-metal_thickness" 
     .Twistangle "0.0" 
     .Taperangle "0.0" 
     .Curve "stub:stub_base" 
     .Create
End With

'@ define extrudeprofile: Antenna:microstrip_taper

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With ExtrudeCurve
     .Reset 
     .Name "microstrip_taper" 
     .Component "Antenna" 
     .Material "PEC" 
     .Thickness "metal_thickness" 
     .Twistangle "0.0" 
     .Taperangle "0.0" 
     .Curve "microstrip_taper:microstrip_taper" 
     .Create
End With

'@ define cylinder: Antenna:Cavity

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "Cavity" 
     .Component "Antenna" 
     .Material "PEC" 
     .OuterRadius "cavity_diameter/2" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "0", "metal_thickness" 
     .Xcenter "-slotline_length-0.5*cavity_diameter+cavity_adjust" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define brick: Antenna:Conductor

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Brick
     .Reset 
     .Name "Conductor" 
     .Component "Antenna" 
     .Material "PEC" 
     .Xrange "-slotline_length+microstrip_coupler_inset-microstrip_taper_length", "flare_length" 
     .Yrange "-0.5*conductor_height", "0.5*conductor_height" 
     .Zrange "0", "metal_thickness" 
     .Create
End With

'@ define brick: Antenna:substrate

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Brick
     .Reset 
     .Name "substrate" 
     .Component "Antenna" 
     .Material "substrate" 
     .Xrange "-slotline_length+microstrip_coupler_inset-microstrip_taper_length", "flare_length" 
     .Yrange "-0.5*conductor_height", "0.5*conductor_height" 
     .Zrange "-substrate_height", "0" 
     .Create
End With

'@ define brick: Antenna:microstrip_coupler

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Brick
     .Reset 
     .Name "microstrip_coupler" 
     .Component "Antenna" 
     .Material "PEC" 
     .Xrange "-slotline_length+microstrip_coupler_inset-0.5*microstrip_coupler_width", "-slotline_length+microstrip_coupler_inset+0.5*microstrip_coupler_width" 
     .Yrange "-microstrip_coupler_length+0.5*microstrip_coupler_width", "0.5*slotline_width" 
     .Zrange "-substrate_height-metal_thickness", "-substrate_height" 
     .Create
End With

'@ boolean add shapes: Antenna:Cavity, Antenna:Vivaldi_taper

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Solid.Add "Antenna:Cavity", "Antenna:Vivaldi_taper"

'@ boolean subtract shapes: Antenna:Conductor, Antenna:Cavity

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Solid 
     .Version 9
     .Subtract "Antenna:Conductor", "Antenna:Cavity" 
End With

'@ define material: vacuum_clear

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Material 
     .Reset 
     .Name "vacuum_clear"
     .FrqType "all" 
     .Type "Normal" 
     .Epsilon "1" 
     .Mue "1" 
     .Kappa "0" 
     .TanD "0.0" 
     .TanDFreq "0.0" 
     .TanDGiven "False" 
     .TanDModel "ConstTanD" 
     .KappaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstTanD" 
     .DispModelEps "None" 
     .DispModelMue "None" 
     .DispersiveFittingSchemeEps "General 1st" 
     .DispersiveFittingSchemeMue "General 1st" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMue "False" 
     .Rho "0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
     .HeatCapacity "0" 
     .MetabolicRate "0" 
     .BloodFlow "0" 
     .Colour "0", "1", "1" 
     .Wireframe "True" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define brick: Antenna:feed_assist

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Brick
     .Reset 
     .Name "feed_assist" 
     .Component "Antenna" 
     .Material "vacuum_clear" 
     .Xrange "-slotline_length", "0" 
     .Yrange "-0.5*slotline_width", "+0.5*slotline_width" 
     .Zrange "metal_thickness", "metal_thickness" 
     .Create
End With

'@ pick face

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Pick.PickFaceFromId "Antenna:microstrip_taper", "3"

'@ define port: 1

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .NumberOfModes "1" 
     .AdjustPolarization False 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Free" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "-slotline_length+microstrip_coupler_inset-microstrip_taper_length", "-slotline_length+microstrip_coupler_inset-microstrip_taper_length" 
     .Yrange "-microstrip_coupler_length-0.5*microstrip_taper_width-(substrate_height+3*microstrip_taper_width)", "-microstrip_coupler_length+0.5*microstrip_taper_width+(substrate_height+3*microstrip_taper_width)" 
     .Zrange "-substrate_height-metal_thickness-(5*substrate_height+microstrip_taper_width)", "metal_thickness" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "substrate_height+3*microstrip_taper_width", "substrate_height+3*microstrip_taper_width" 
     .ZrangeAdd "5*substrate_height+microstrip_taper_width", "substrate_height" 
     .SingleEnded "False" 
     .Create 
End With

'@ define automesh for: Antenna:feed_assist

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Solid.SetSolidMeshProperties "Antenna:feed_assist", "PBA", "True", "0", "True", "True", "slotline_length/3", "slotline_width/2", "0", "2*slotline_length", "slotline_width/2", "0", "False", "1.0", "False", "1.0", "False", "True", "True"

'@ define automesh for: Antenna:substrate

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Solid.SetSolidMeshProperties "Antenna:substrate", "PBA", "True", "0", "True", "True", "0", "0", "substrate_height/4", "0", "0", "0", "False", "1.0", "False", "1.0", "False", "True", "True"

'@ define automesh for: Antenna:microstrip_coupler

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Solid.SetSolidMeshProperties "Antenna:microstrip_coupler", "PBA", "True", "0", "True", "True", "microstrip_coupler_width/3", "0", "0", "microstrip_coupler_width", "0", "0", "False", "1.0", "False", "1.0", "False", "True", "True"

'@ define automesh for: Antenna:microstrip_taper

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Solid.SetSolidMeshProperties "Antenna:microstrip_taper", "PBA", "True", "0", "True", "True", "0", "microstrip_coupler_width/3", "0", "0", "microstrip_taper_width/2", "0", "False", "1.0", "False", "1.0", "False", "True", "True"

'@ define monitors (using linear samples)

'[VERSION]2017.2|26.0.1|20170317[/VERSION]
With Monitor
    .Reset
    .Domain "Frequency"
    .FieldType "Farfield"
    .ExportFarfieldSource "False"
    .UseSubvolume "False"
    .CreateUsingLinearSamples "frequency_minimum", "frequency_maximum", "num_ff_monitors"
End With

'@ set mesh properties

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Mesh 
     .UseRatioLimit "True" 
     .RatioLimit "50" 
     .LinesPerWavelength "12" 
     .MinimumStepNumber "10" 
     .Automesh "True" 
     .MeshType "PBA" 
     .SetCreator "High Frequency" 
End With

'@ define automesh parameters

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Mesh 
     .AutomeshStraightLines "True" 
     .AutomeshEllipticalLines "True" 
     .AutomeshRefineAtPecLines "True", "6" 
     .AutomeshRefinePecAlongAxesOnly "False" 
     .AutomeshAtEllipseBounds "True", "10" 
     .AutomeshAtWireEndPoints "True" 
     .AutomeshAtProbePoints "True" 
     .SetAutomeshRefineDielectricsType "Generalized" 
     .MergeThinPECLayerFixpoints "True" 
     .EquilibrateMesh "True" 
     .EquilibrateMeshRatio "1.19" 
     .UseCellAspectRatio "False" 
     .CellAspectRatio "50.0" 
     .UsePecEdgeModel "True" 
     .MeshType "PBA" 
     .AutoMeshLimitShapeFaces "True" 
     .AutoMeshNumberOfShapeFaces "1000" 
     .PointAccEnhancement "0" 
     .SurfaceOptimization "True" 
     .SurfaceSmoothing "3" 
     .MinimumCurvatureRefinement "100" 
     .CurvatureRefinementFactor "0.05" 
     .AnisotropicCurvatureRefinement "False" 
     .SmallFeatureSize "0.0" 
     .SurfaceTolerance "0.0" 
     .SurfaceToleranceType "Relative" 
     .NormalTolerance "22.5" 
     .AnisotropicCurvatureRefinementFSM "False" 
     .SurfaceMeshEnrichment "0" 
     .DensityTransitionsFSM "0.5" 
     .VolumeOptimization "True" 
     .VolumeSmoothing "True" 
     .VolumeMeshMethod "Delaunay" 
     .SurfaceMeshMethod "General" 
     .SurfaceMeshGeometryAccuracy "1.0e-6" 
     .DelaunayOptimizationLevel "2" 
     .DelaunayPropagationFactor "1.050000" 
     .DensityTransitions "0.5" 
     .MeshAllRegions "False" 
     .ConvertGeometryDataAfterMeshing "True" 
     .AutomeshFixpointsForBackground "True" 
     .PBAType "Fast PBA" 
     .AutomaticPBAType "True" 
     .FPBAAvoidNonRegUnite "True" 
     .DetectSmallSolidPEC "False" 
     .ConsiderSpaceForLowerMeshLimit "False" 
     .RatioLimitGovernsLocalRefinement "False" 
     .GapDetection "False" 
     .FPBAGapTolerance "1e-3" 
     .MaxParallelThreads "8"
     .SetParallelMode "Maximum"
End With 
With Solver 
     .UseSplitComponents "True" 
     .PBAFillLimit "99" 
     .EnableSubgridding "False" 
     .AlwaysExcludePec "False" 
End With

'@ define special solver parameters

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With Solver 
     .TimeBetweenUpdates "1200" 
     .NumberOfPulseWidths "20" 
     .EnergyBalanceLimit "0.03" 
     .UseArfilter "False" 
     .ArMaxEnergyDeviation "0.1" 
     .ArPulseSkip "1" 
     .WaveguideBroadband "False" 
     .SetBBPSamples "5" 
     .SetSamplesFullDeembedding "20" 
     .MatrixDump "False" 
     .TimestepReduction "0.45" 
     .NumberOfSubcycles "4" 
     .SubcycleFillLimit "70" 
     .SetSubcycleState "Automatic" 
     .SetSubgridCycleState "Automatic" 
     .SimplifiedPBAMethod "False" 
     .UseParallelization "True" 
     .MaximumNumberOfThreads "16" 
     .TimeStepStabilityFactor "1.0" 
     .UseOpenBoundaryForHigherModes "True" 
     .SetModeFreqFactor "0.5" 
     .SurfaceImpedanceOrder "10" 
     .SetPortShielding "True" 
     .FrequencySamples "1001" 
     .ConsiderTwoPortReciprocity "True" 
     .UseTSTAtPort "True" 
     .SParaAdjustment "True" 
     .RestartAfterInstabilityAbort "True" 
     .HardwareAcceleration "False" 
     .AdaptivePortMeshing "True" 
     .AccuracyAdaptivePortMeshing "1" 
     .PassesAdaptivePortMeshing "4" 
End With

'@ define solver parameters

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "All" 
     .StimulationMode "All" 
     .SteadyStateLimit "-40" 
     .MeshAdaption "False" 
     .AutoNormImpedance "True" 
     .NormingImpedance "50" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
     .MPIParallelization "False" 
     .SuperimposePLWExcitation "False" 
End With

'@ farfield plot options

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "phi" 
     .Theta "0" 
     .Phi "0" 
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
     .SetFrequency "3" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .AlignToMainLobe "False" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0", "1", "0" 
     .SetCoordinateSystemType "spherical" 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "30" 
     .SetPhaseCenterComponent "Theta" 
     .SetPhaseCenterPlane "both" 
End With

'@ define solver parameters

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "All" 
     .StimulationMode "All" 
     .SteadyStateLimit "-40" 
     .MeshAdaption "False" 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
     .MPIParallelization "False" 
     .SuperimposePLWExcitation "False" 
End With

'@ set 3d mesh adaptation properties

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
With MeshAdaption3D
    .SetType "Time" 
    .SetAdaptionStrategy "Energy" 
    .MinPasses "2" 
    .MaxPasses "6" 
    .SkipPulses "0" 
    .CellIncreaseFactor "0.7" 
    .WeightE "1.0" 
    .WeightB "1.0" 
    .RefineX "True" 
    .RefineY "True" 
    .RefineZ "True" 
    .ClearStopCriteria
    .AddSParameterStopCriterion "True", "0.8*frequency_minimum", "frequency_maximum", "0.02", "1", "True" 
    .Add0DResultStopCriterion "", "0.02", "1", "False" 
End With

'@ define solver parameters

'[VERSION]2009.8|18.0.3|20090230[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "All" 
     .StimulationMode "All" 
     .SteadyStateLimit "-40" 
     .MeshAdaption "False" 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
     .MPIParallelization "False" 
     .SuperimposePLWExcitation "False" 
End With

'@ set units in materials

'[VERSION]2010.6|20.0.0|20100827[/VERSION]
Material.SetUnitInMaterial "vacuum_clear", "GHz", "cm" 
Material.SetUnitInMaterial "substrate", "GHz", "cm"

'@ set units in materials

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Material.SetUnitInMaterial "$CoilMaterial$", "GHz", "cm"

'@ create group: meshgroup1

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Group.Add "meshgroup1", "mesh"

'@ set local mesh properties for: meshgroup1

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
With MeshSettings
     With .ItemMeshSettings ("group$meshgroup1")
          .SetMeshType "Hex"
          .Set "EdgeRefinement", "1.0"
          .Set "Extend", "0", "microstrip_taper_width/2", "0"
          .Set "Fixpoints", 1
          .Set "MeshType", "Default"
          .Set "Priority", "0"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "Step", "0", "microstrip_coupler_width/3", "0"
          .Set "UseDielectrics", 1
          .Set "UseEdgeRefinement", 0
          .Set "UseForRefinement", 1
          .Set "UseForSnapping", 1
          .Set "UseSnappingPriority", 0
          .Set "UseStepAndExtend", 1
          .Set "UseVolumeRefinement", 0
          .Set "VolumeRefinement", "1.0"
          .SetMeshType "HexTLM"
          .Set "EdgeRefinement", "1.0"
          .Set "Extend", "0", "microstrip_taper_width/2", "0"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "Step", "0", "microstrip_coupler_width/3", "0"
          .Set "UseDielectrics", 1
          .Set "UseEdgeRefinement", 0
          .Set "UseForRefinement", 1
          .Set "UseForSnapping", 1
          .Set "UseSnappingPriority", 0
          .Set "UseStepAndExtend", 1
          .Set "UseVolumeRefinement", 0
          .Set "VolumeRefinement", "1.0"
     End With
End With

'@ create group: meshgroup2

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Group.Add "meshgroup2", "mesh"

'@ set local mesh properties for: meshgroup2

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
With MeshSettings
     With .ItemMeshSettings ("group$meshgroup2")
          .SetMeshType "Hex"
          .Set "EdgeRefinement", "1.0"
          .Set "Extend", "0", "0", "0"
          .Set "Fixpoints", 1
          .Set "MeshType", "Default"
          .Set "Priority", "0"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "Step", "0", "0", "substrate_height/4"
          .Set "UseDielectrics", 1
          .Set "UseEdgeRefinement", 0
          .Set "UseForRefinement", 1
          .Set "UseForSnapping", 1
          .Set "UseSnappingPriority", 0
          .Set "UseStepAndExtend", 1
          .Set "UseVolumeRefinement", 0
          .Set "VolumeRefinement", "1.0"
          .SetMeshType "HexTLM"
          .Set "EdgeRefinement", "1.0"
          .Set "Extend", "0", "0", "0"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "Step", "0", "0", "substrate_height/4"
          .Set "UseDielectrics", 1
          .Set "UseEdgeRefinement", 0
          .Set "UseForRefinement", 1
          .Set "UseForSnapping", 1
          .Set "UseSnappingPriority", 0
          .Set "UseStepAndExtend", 1
          .Set "UseVolumeRefinement", 0
          .Set "VolumeRefinement", "1.0"
     End With
End With

'@ create group: meshgroup3

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Group.Add "meshgroup3", "mesh"

'@ set local mesh properties for: meshgroup3

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
With MeshSettings
     With .ItemMeshSettings ("group$meshgroup3")
          .SetMeshType "Hex"
          .Set "EdgeRefinement", "1.0"
          .Set "Extend", "microstrip_coupler_width", "0", "0"
          .Set "Fixpoints", 1
          .Set "MeshType", "Default"
          .Set "Priority", "0"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "Step", "microstrip_coupler_width/3", "0", "0"
          .Set "UseDielectrics", 1
          .Set "UseEdgeRefinement", 0
          .Set "UseForRefinement", 1
          .Set "UseForSnapping", 1
          .Set "UseSnappingPriority", 0
          .Set "UseStepAndExtend", 1
          .Set "UseVolumeRefinement", 0
          .Set "VolumeRefinement", "1.0"
          .SetMeshType "HexTLM"
          .Set "EdgeRefinement", "1.0"
          .Set "Extend", "microstrip_coupler_width", "0", "0"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "Step", "microstrip_coupler_width/3", "0", "0"
          .Set "UseDielectrics", 1
          .Set "UseEdgeRefinement", 0
          .Set "UseForRefinement", 1
          .Set "UseForSnapping", 1
          .Set "UseSnappingPriority", 0
          .Set "UseStepAndExtend", 1
          .Set "UseVolumeRefinement", 0
          .Set "VolumeRefinement", "1.0"
     End With
End With

'@ create group: meshgroup4

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Group.Add "meshgroup4", "mesh"

'@ set local mesh properties for: meshgroup4

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
With MeshSettings
     With .ItemMeshSettings ("group$meshgroup4")
          .SetMeshType "Hex"
          .Set "EdgeRefinement", "1.0"
          .Set "Extend", "2*slotline_length", "slotline_width/2", "0"
          .Set "Fixpoints", 1
          .Set "MeshType", "Default"
          .Set "Priority", "0"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "Step", "slotline_length/3", "slotline_width/2", "0"
          .Set "UseDielectrics", 1
          .Set "UseEdgeRefinement", 0
          .Set "UseForRefinement", 1
          .Set "UseForSnapping", 1
          .Set "UseSnappingPriority", 0
          .Set "UseStepAndExtend", 1
          .Set "UseVolumeRefinement", 0
          .Set "VolumeRefinement", "1.0"
          .SetMeshType "HexTLM"
          .Set "EdgeRefinement", "1.0"
          .Set "Extend", "2*slotline_length", "slotline_width/2", "0"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "Step", "slotline_length/3", "slotline_width/2", "0"
          .Set "UseDielectrics", 1
          .Set "UseEdgeRefinement", 0
          .Set "UseForRefinement", 1
          .Set "UseForSnapping", 1
          .Set "UseSnappingPriority", 0
          .Set "UseStepAndExtend", 1
          .Set "UseVolumeRefinement", 0
          .Set "VolumeRefinement", "1.0"
     End With
End With

'@ add items to group: "meshgroup1"

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Group.AddItem "solid$Antenna:microstrip_taper", "meshgroup1"

'@ add items to group: "meshgroup2"

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Group.AddItem "solid$Antenna:substrate", "meshgroup2"

'@ add items to group: "meshgroup3"

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Group.AddItem "solid$Antenna:microstrip_coupler", "meshgroup3"

'@ add items to group: "meshgroup4"

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Group.AddItem "solid$Antenna:feed_assist", "meshgroup4"

'@ define time domain solver parameters

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
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

'@ set mesh properties (Hexahedral)

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
With Mesh 
     .MeshType "PBA" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "Version", 1%
     'MAX CELL - WAVELENGTH REFINEMENT 
     .Set "StepsPerWaveNear", "10" 
     .Set "StepsPerWaveFar", "10" 
     .Set "WavelengthRefinementSameAsNear", "1" 
     'MAX CELL - GEOMETRY REFINEMENT 
     .Set "StepsPerBoxNear", "10" 
     .Set "StepsPerBoxFar", "1" 
     .Set "MaxStepNear", "0" 
     .Set "MaxStepFar", "0" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "ModelBoxDescrFar", "maxedge" 
     .Set "UseMaxStepAbsolute", "0" 
     .Set "GeometryRefinementSameAsNear", "0" 
     'MIN CELL 
     .Set "UseRatioLimitGeometry", "1" 
     .Set "RatioLimitGeometry", "100" 
     .Set "MinStepGeometryX", "0" 
     .Set "MinStepGeometryY", "0" 
     .Set "MinStepGeometryZ", "0" 
     .Set "UseSameMinStepGeometryXYZ", "1" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "FaceRefinementOn", "0" 
     .Set "FaceRefinementPolicy", "2" 
     .Set "FaceRefinementRatio", "2" 
     .Set "FaceRefinementStep", "0" 
     .Set "FaceRefinementNSteps", "2" 
     .Set "EllipseRefinementOn", "0" 
     .Set "EllipseRefinementPolicy", "2" 
     .Set "EllipseRefinementRatio", "2" 
     .Set "EllipseRefinementStep", "0" 
     .Set "EllipseRefinementNSteps", "2" 
     .Set "FaceRefinementBufferLines", "3" 
     .Set "EdgeRefinementOn", "1" 
     .Set "EdgeRefinementPolicy", "1" 
     .Set "EdgeRefinementRatio", "6" 
     .Set "EdgeRefinementStep", "0" 
     .Set "EdgeRefinementBufferLines", "3" 
     .Set "RefineEdgeMaterialGlobal", "0" 
     .Set "RefineAxialEdgeGlobal", "0" 
     .Set "BufferLinesNear", "3" 
     .Set "UseDielectrics", "1" 
     .Set "EquilibrateOn", "0" 
     .Set "Equilibrate", "1.5" 
     .Set "IgnoreThinPanelMaterial", "0" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "SnapToAxialEdges", "1"
     .Set "SnapToPlanes", "1"
     .Set "SnapToSpheres", "1"
     .Set "SnapToEllipses", "1"
     .Set "SnapToCylinders", "1"
     .Set "SnapToCylinderCenters", "1"
     .Set "SnapToEllipseCenters", "1"
End With 
With Discretizer 
     .MeshType "PBA" 
     .PBAType "Fast PBA" 
     .AutomaticPBAType "True" 
     .FPBAAccuracyEnhancement "enable"
     .ConnectivityCheck "False"
     .ConvertGeometryDataAfterMeshing "True" 
     .UsePecEdgeModel "True" 
     .GapDetection "False" 
     .FPBAGapTolerance "1e-3" 
     .SetMaxParallelMesherThreads "Hex", "8"
     .SetParallelMesherMode "Hex", "Maximum"
     .PointAccEnhancement "0" 
     .UseSplitComponents "True" 
     .EnableSubgridding "False" 
     .PBAFillLimit "99" 
     .AlwaysExcludePec "False" 
End With

'@ Exported from Antenna Magus: Microstrip-fed Vivaldi antenna - Friday, June 04, 2021

'[VERSION]2016.7|25.0.2|20090230[/VERSION]


'@ switch working plane

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Plot.DrawWorkplane "false" 

'@ set local mesh properties (for backward compatibility)

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With MeshSettings
     With .ItemMeshSettings ("group$meshgroup1")
          .SetMeshType "Hex"
          .Set "UseSameStepWidthXYZ", 0
          .SetMeshType "Hex"
          .Set "UseSameExtendXYZ", 0
          .SetMeshType "HexTLM"
          .Set "UseSameStepWidthXYZ", 0
          .SetMeshType "HexTLM"
          .Set "UseSameExtendXYZ", 0
     End With
End With
With MeshSettings
     With .ItemMeshSettings ("group$meshgroup2")
          .SetMeshType "Hex"
          .Set "UseSameStepWidthXYZ", 0
          .SetMeshType "HexTLM"
          .Set "UseSameStepWidthXYZ", 0
     End With
End With
With MeshSettings
     With .ItemMeshSettings ("group$meshgroup3")
          .SetMeshType "Hex"
          .Set "UseSameStepWidthXYZ", 0
          .SetMeshType "Hex"
          .Set "UseSameExtendXYZ", 0
          .SetMeshType "HexTLM"
          .Set "UseSameStepWidthXYZ", 0
          .SetMeshType "HexTLM"
          .Set "UseSameExtendXYZ", 0
     End With
End With
With MeshSettings
     With .ItemMeshSettings ("group$meshgroup4")
          .SetMeshType "Hex"
          .Set "UseSameStepWidthXYZ", 0
          .SetMeshType "Hex"
          .Set "UseSameExtendXYZ", 0
          .SetMeshType "HexTLM"
          .Set "UseSameStepWidthXYZ", 0
          .SetMeshType "HexTLM"
          .Set "UseSameExtendXYZ", 0
     End With
End With


'@ farfield plot options

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
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
     .SetFrequency "21" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
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
     .SetPhaseCenterComponent "theta" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 

     .StoreSettings
End With 


'@ farfield array properties

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With FarfieldArray
     .Reset 
     .UseArray "TRUE" 
     .Arraytype "Rectangular" 
     .XSet "10", "0", "0" 
     .YSet "1", "0", "0" 
     .ZSet "1", "0", "0" 
     .SetList
End With


'@ farfield plot options

'[VERSION]2020.1|29.0.1|20191021[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
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
     .SetFrequency "21" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
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
     .SetPhaseCenterComponent "theta" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 

     .StoreSettings
End With 


