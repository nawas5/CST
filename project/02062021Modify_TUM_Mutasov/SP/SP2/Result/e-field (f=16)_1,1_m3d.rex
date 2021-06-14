<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile creator="Solver HFTD - Field 3DFD Monitor" version="20170330">
  <SpecialMaterials>
    <Background type="NORMAL"/>
    <Material name="MSLINE1/Metal" type="FIELDFREE"/>
    <Material name="MSLINE2/Metal" type="FIELDFREE"/>
    <Material name="MSLINE3/Metal" type="FIELDFREE"/>
    <Material name="MSLINE4/Metal" type="FIELDFREE"/>
    <Material name="MSREF1/GND" type="FIELDFREE"/>
    <Material name="PEC" type="FIELDFREE"/>
  </SpecialMaterials>
  <SimulationProperties dB_Amplitude="20" encoded_unit="&amp;U:V^1.:m^-1" fieldname="e-field (f=16) [1]" fieldtype="E-Field" frequency="16"/>
  <MetaGeometryFile filename="model.gex" lod="1"/>
  <ResultGroups num_steps="1" transformation="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1">
    <Frame index="0">
      <FieldResultFile filename="e-field (f=16)_1,1.m3d" type="m3d"/>
    </Frame>
  </ResultGroups>
  <ResultDataType complex="1" timedomain="0" vector="1"/>
  <SimulationDomain min="-8.019499778748 -8.019499778748 0" max="8.019499778748 8.019499778748 7"/>
  <PlotSettings Plot="4" ignore_symmetry="0" deformation="0"/>
  <Source type="SOLVER"/>
</MetaResultFile>
