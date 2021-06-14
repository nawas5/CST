
Lgnd = 35.15e-3;
Wgnd = 20.24e-3;
Ls = 4.74e-3; 
Ltaper = 28.5e-3; 
Wtaper = 39.96e-3;
s = 0.43e-3;
d = 2.16e-3; 
Ka = (1/Ltaper)*(log(Wtaper/s)/log(exp(1)));

vivaldiant = vivaldi('TaperLength',Ltaper, 'ApertureWidth', Wtaper,     ...
                     'OpeningRate', Ka,'SlotLineWidth', s,              ...
                     'CavityDiameter',d,'CavityToTaperSpacing',Ls,      ...
                     'GroundPlaneLength', Lgnd, 'GroundPlaneWidth', Wgnd,...
                     'FeedOffset',-10e-3);  
figure
show(vivaldiant);
vivaldiant.FeedOffset = -14e-3;
ewant = pcbStack(vivaldiant);
topLayer = ewant.Layers{1};
figure
show(topLayer)