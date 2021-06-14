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
                     'FeedOffset',-16e-3);  
figure
show(vivaldiant);
vivaldiant.FeedOffset = -15e-3;
ewant = pcbStack(vivaldiant);
topLayer = ewant.Layers{1};
figure
show(topLayer)


cutout = antenna.Rectangle('Length',0.5e-3,'Width',2e-3,'Center',[-0.015,0]);
topLayer = topLayer-cutout;
figure;
show(topLayer);

L1 = 4.74e-3;
L2 = 4.1e-3;
L3 = 4.1e-3;
W1 = 1.5e-3;
W2 = 1e-3; 
W3 = 0.75e-3;
H = 0.8e-3;
fp = 11.2e-3; 
th = 90; 

patch1 = antenna.Rectangle('Length',L1,'Width',W1,...
                           'Center',[-(Lgnd/2 - L1/2), -(Wgnd/2 - fp - W1/2)],...
                           'NumPoints', [10,2,10,2]);
patch2 = antenna.Rectangle('Length',L2,'Width',W2,...
                           'Center',[-(Lgnd/2 - L1 - L2/2), -(Wgnd/2 - fp - W1/2)],...
                           'NumPoints', [5,2,5,2]);
patch3 = antenna.Rectangle('Length',W3,'Width',L3,...
                           'Center',[-(Lgnd/2 - L1 - L2 - W3/2), -(Wgnd/2 - fp - W1/2 + W2/2- L3/2)],...
                           'NumPoints', [2,10,2,10]);
                       
                       
Bowtie = em.internal.makebowtie(8.55e-3, W3, th, [0 0 0],'rounded',20);
rotatedBowtie = em.internal.rotateshape(Bowtie,[0 0 1],[0 0 0],90);
p = antenna.Polygon('Vertices', rotatedBowtie');

radialStub = translate(p, [-(Lgnd/2 - L1 - L2 - W3/2) -(Wgnd/2 - fp - W1/2 + W2/2- L3) 0]);
   
bottomLayer = patch1+patch2+patch3+radialStub;
figure;
show(bottomLayer);

boardShape = antenna.Rectangle('Length',Lgnd,'Width',Wgnd);  
figure;
hold on;
plot(topLayer)
plot(bottomLayer)
grid on

substrate = dielectric('Name','FR4','EpsilonR', 4.4, 'Thickness', H);


vivaldi_Notch = pcbStack;
vivaldi_Notch.Name = 'vivaldiNotch';
vivaldi_Notch.BoardThickness = H;
vivaldi_Notch.BoardShape = boardShape;
vivaldi_Notch.Layers = {topLayer,substrate,bottomLayer};
vivaldi_Notch.FeedLocations = [-(Lgnd/2), -(Wgnd/2 - fp - W1/2), 1, 3];
vivaldi_Notch.FeedDiameter = W1/2;
figure; 
show(vivaldi_Notch);

freq = linspace(2.5e9, 27e9,41);
bandfreqs = [3.1e9, 27e9];
freqIndx = nan.*(ones(1,numel(bandfreqs)));
for i = 1:numel(bandfreqs)
    df = abs(freq-bandfreqs(i));
    freqIndx(i) = find(df==min(df));
end
load vivaldi_Notch_auto_mesh
vivaldiInfo = info(vivaldi_Notch)
figure;
impedance(vivaldi_Notch, freq);

figure
mesh(vivaldi_Notch, 'MaxEdgeLength',5e-3,'MinEdgeLength',0.8e-3);
view(0,90)

load vivaldi_Notch_manual_mesh.mat
figure;
impedance(vivaldi_Notch, freq);

figure;
s = sparameters(vivaldi_Notch, freq);
rfplot(s);
gamma = rfparam(s,1,1);

G = zeros(1,numel(freq));
az = 0;
el = 0;
for i = 1:numel(freq)
    G(i) = pattern(vivaldi_Notch,freq(i),az,el);
end
g = figure;
plot(freq./1e9,G,'-*','LineWidth',2);
xlabel('Frequency (GHz)');
ylabel('Magnitude (dBi)');
grid on;
title('Gain Variation With Frequency');

mismatchFactor = 10*log10(1 - abs(gamma).^2);
Gr = mismatchFactor.' + G;
figure(g);
hold on
plot(freq./1e9,Gr,'r-.');
legend('Gain','Realized Gain','Location','best')
title('Variation of Gain and Realized Gain with Frequency')
hold off

dfsub = abs(freq - (10.4e9+7e9)/2);
subfreqIndx = find(dfsub==min(dfsub));
figure;
pattern(vivaldi_Notch, freq(subfreqIndx));

az = -180:5:180;
el = -90:5:90;
fmin = freq(freqIndx(1));
fmax = freq(freqIndx(2));
R = 100*299792458/fmin;
coord = 'sph';
phi = 0;
theta = 90 - el;
[Points, ~, ~] = em.internal.calcpointsinspace( phi, theta, R,coord);


E_at_fmin = EHfields(vivaldi_Notch,fmin,Points);
E_at_fmax = EHfields(vivaldi_Notch,fmax,Points);
Eth_at_fmin = helperFieldInSphericalCoordinates(E_at_fmin,phi,theta);
Eth_at_fmax = helperFieldInSphericalCoordinates(E_at_fmax,phi,theta);
phase_at_fmin = angle(Eth_at_fmin);
phase_at_fmax = angle(Eth_at_fmax);

delta_phase = max(phase_at_fmin-phase_at_fmax) - min(phase_at_fmin-phase_at_fmax);
delta_omega = 2*pi*(fmax-fmin);
delta_time = pi*delta_phase/180/delta_omega;
delta_timeXZ = delta_time*1e12; 
sprintf("The time delay variation in the XZ-plane is: %2.2f %s",delta_timeXZ,'ps')

phi = az;
theta = 0;
delta_omega = 2*pi*(fmax-fmin);
[Points, ~, ~] = em.internal.calcpointsinspace( phi, theta, R,coord);
E_at_fmin = EHfields(vivaldi_Notch,fmin,Points);
E_at_fmax = EHfields(vivaldi_Notch,fmax,Points);
[~,Ephi_at_fmin] = helperFieldInSphericalCoordinates(E_at_fmin,phi,theta);
[~,Ephi_at_fmax] = helperFieldInSphericalCoordinates(E_at_fmax,phi,theta);
phase_at_fmin = angle(Ephi_at_fmin);
phase_at_fmax = angle(Ephi_at_fmax);
delta_phase = max(phase_at_fmin-phase_at_fmax) - min(phase_at_fmin-phase_at_fmax);
delta_time = pi*delta_phase/180/delta_omega;
delta_timeXY = delta_time*1e12;
sprintf("The time delay variation in the XY-plane is: %2.2f %s",delta_timeXY,'ps')

fLim = 6.5e9;
findx = find(freq>fLim);
freq2 = freq(1:findx(1)-1);
s_model = sparameters(vivaldi_Notch, freq2);
rfplot(s_model);
s_proto = sparameters('UWB2.s1p');
hold on
rfplot(s_proto)
legend('Model','Measured','Location','best')

