Lgnd = 35.16e-3;
Wgnd = 20.24e-3;
Ls = 0.064e-3; 
Ltaper = 30.35e-3; 
Wtaper = 15.9e-3;
s = 0.0954e-3;
d = 2.17e-3; 
Ka = (1/Ltaper)*(log(Wtaper/s)/log(exp(1)));

vivaldiant = vivaldi('TaperLength',Ltaper, 'ApertureWidth', Wtaper,     ...
                     'OpeningRate', Ka,'SlotLineWidth', s,              ...
                     'CavityDiameter',d,'CavityToTaperSpacing',Ls,      ...
                     'GroundPlaneLength', Lgnd, 'GroundPlaneWidth', Wgnd,...
                     'FeedOffset',-15e-3);  
figure
show(vivaldiant);
vivaldiant.FeedOffset = -15e-3;
ewant = pcbStack(vivaldiant);
topLayer = ewant.Layers{1};
figure
show(topLayer)

substrate = dielectric('Name','FR4','EpsilonR', 3.27, 'Thickness', H);


vivaldi_Notch = pcbStack;
vivaldi_Notch.Name = 'vivaldiNotch';
vivaldi_Notch.BoardThickness = H;
vivaldi_Notch.BoardShape = boardShape;
vivaldi_Notch.Layers = {topLayer,substrate,bottomLayer};
vivaldi_Notch.FeedLocations = [-(Lgnd/2), -(Wgnd/2 - fp - W1/2), 1, 3];
vivaldi_Notch.FeedDiameter = W1/2;
figure;
show(vivaldi_Notch);

freq = linspace(15e9, 27e9,41);
bandfreqs = [16e9, 26e9];
freqIndx = nan.*(ones(1,numel(bandfreqs)));
for i = 1:numel(bandfreqs)
    df = abs(freq-bandfreqs(i));
    freqIndx(i) = find(df==min(df));
end
load vivaldi_Notch_auto_mesh
vivaldiInfo = info(vivaldi_Notch)
figure;
impedance(vivaldi_Notch, freq);
