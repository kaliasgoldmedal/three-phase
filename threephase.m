clc

Nf=1000; %Number of Frames
fm = 50; %signal
MI = 230*sqrt(2); %modulation index
theta1 = 0;
theta2 = 2*pi/3;

%time series
t=linspace(0,0.04,Nf);
Vr = m(MI,fm,theta1,t); %modulation function time series VR
Vy = m(MI,fm,(2*pi/3),t); %modulation function time series Vy
Vb = m(MI,fm,(-2*pi/3),t); %modulation function time series Vb

Vry = Vr-Vy;
Vyb = Vy-Vb;
Vbr = Vb-Vr;

Vrmax = max(Vr);

angVr = mod((2*pi*50.*t),2*pi)*(180/pi);
angVy = mod((2*pi*50.*t)+(2*pi/3),2*pi)*(180/pi);
angVb = mod((2*pi*50.*t)-(2*pi/3),2*pi)*(180/pi);

angVry = mod((2*pi*50.*t)-(pi/6),2*pi)*(180/pi);
angVyb = mod((2*pi*50.*t)+(2*pi/3)-(pi/6),2*pi)*(180/pi);
angVbr = mod((2*pi*50.*t)-(2*pi/3)-(pi/6),2*pi)*(180/pi);

tc = linspace(0,2*pi,Nf); % vector of angles to draw circles

circ_radius = 1;


writeobj = VideoWriter('tph','Uncompressed AVI');
open(writeobj);

fig1=figure('Renderer', 'painters', 'Position', [280 80 900 600]);



subplot(4,4,[1 2 5 6])  %Figure 1
title('Three Phase Voltages');


h = gca;
set(h,'XLim',[0 0.04], 'Ylim',[-2*230*sqrt(2) 2*230*sqrt(2)], 'Color','k');
h.XAxis.Visible = 'off';
h.YAxis.Visible = 'on';

pos = get(gca, 'Position');
Xarn=(t+ abs(min(xlim)))/diff(xlim) * pos(3) + pos(1);
Yarn=(Vr - min(ylim))/diff(ylim) * pos(4) + pos(2);
Yayn=(Vy - min(ylim))/diff(ylim) * pos(4) + pos(2);
Yabn=(Vb - min(ylim))/diff(ylim) * pos(4) + pos(2);


curve0=animatedline('LineWidth',2,'Color',"r");
curve1=animatedline('LineWidth',2,'Color',"r", 'Marker', '.', 'MarkerSize', 20);

curve2=animatedline('LineWidth',2,'Color',"y");
curve3=animatedline('LineWidth',2,'Color',"y", 'Marker', '.', 'MarkerSize', 20);


curve4=animatedline('LineWidth',2,'Color',"b");
curve5=animatedline('LineWidth',2,'Color',"b", 'Marker', '.', 'MarkerSize', 20);


subplot(4,4,[3 4 7 8])   %Figure 2
title('Phase Voltage Phasors(RMS)');
set(gca,'XLim',[-3 3], 'Ylim',[-2 2], 'Color','k');
h1=gca;
h1.XAxis.Visible = 'off';
h1.YAxis.Visible = 'off';
curve6=animatedline('LineWidth',2,'Color',"r");
curve7=animatedline('LineWidth',2,'Color',"r", 'Marker', '.', 'MarkerSize', 20);

curve8=animatedline('LineWidth',2,'Color',"y");
curve9=animatedline('LineWidth',2,'Color',"y", 'Marker', '.', 'MarkerSize', 20);

curve10=animatedline('LineWidth',2,'Color',"b");
curve11=animatedline('LineWidth',2,'Color',"b", 'Marker', '.', 'MarkerSize',20);

curve12=animatedline('LineWidth',0.25,'Color',"w",'LineStyle',':');

pos = get(gca, 'Position');
Xdrn=(cosd(angVr)+ abs(min(xlim)))/diff(xlim) * pos(3) + pos(1);
Ydrn=(sind(angVr) - min(ylim))/diff(ylim) * pos(4) + pos(2);

Xdyn=(cosd(angVy)+ abs(min(xlim)))/diff(xlim) * pos(3) + pos(1);
Ydyn=(sind(angVy) - min(ylim))/diff(ylim) * pos(4) + pos(2);

Xdbn=(cosd(angVb)+ abs(min(xlim)))/diff(xlim) * pos(3) + pos(1);
Ydbn=(sind(angVb) - min(ylim))/diff(ylim) * pos(4) + pos(2);

subplot(4,4,[11 12 15 16]) %Figure 4
title('Line and Phase Voltage Phasors (RMS)');
set(gca,'XLim',[-3 3], 'Ylim',[-2 2], 'Color','k');
xticklabels({'','','','3\pi/2','','',''})
yticklabels({'','','\pi','','','',''})
h4=gca;
h4.XAxis.Visible = 'on';
h4.YAxis.Visible = 'on';

curve13=animatedline('LineWidth',2,'Color',"r");
curve14=animatedline('LineWidth',2,'Color',"r", 'Marker', '.', 'MarkerSize', 20);

curve15=animatedline('LineWidth',2,'Color',"y");
curve16=animatedline('LineWidth',2,'Color',"y", 'Marker', '.', 'MarkerSize', 20);

curve17=animatedline('LineWidth',2,'Color',"b");
curve18=animatedline('LineWidth',2,'Color',"b", 'Marker', '.', 'MarkerSize',20);

curve19=animatedline('LineWidth',0.25,'Color',"w",'LineStyle',':');

curve20=animatedline('LineWidth',0.25,'Color',"w",'LineStyle',':');

curve27=animatedline('LineWidth',2,'Color',"r");
curve28=animatedline('LineWidth',2,'Color',"r", 'Marker', '.', 'MarkerSize', 20);

curve29=animatedline('LineWidth',2,'Color',"y");
curve30=animatedline('LineWidth',2,'Color',"y", 'Marker', '.', 'MarkerSize', 20);

curve31=animatedline('LineWidth',2,'Color',"b");
curve32=animatedline('LineWidth',2,'Color',"b", 'Marker', '.', 'MarkerSize',20);

pos1 = get(gca, 'Position');
Xdrn1=(cosd(angVr)+ abs(min(xlim)))/diff(xlim) * pos1(3) + pos1(1);
Ydrn1=(sind(angVr) - min(ylim))/diff(ylim) * pos1(4) + pos1(2);

Xdyn1=(cosd(angVy)+ abs(min(xlim)))/diff(xlim) * pos1(3) + pos1(1);
Ydyn1=(sind(angVy) - min(ylim))/diff(ylim) * pos1(4) + pos1(2);

Xdbn1=(cosd(angVb)+ abs(min(xlim)))/diff(xlim) * pos1(3) + pos1(1);
Ydbn1=(sind(angVb) - min(ylim))/diff(ylim) * pos1(4) + pos1(2);

Xdryn1=(sqrt(3)*cosd(angVry)+ abs(min(xlim)))/diff(xlim) * pos1(3) + pos1(1);
Ydryn1=(sqrt(3)*sind(angVry) - min(ylim))/diff(ylim) * pos1(4) + pos1(2);

Xdybn1=(sqrt(3)*cosd(angVyb)+ abs(min(xlim)))/diff(xlim) * pos1(3) + pos1(1);
Ydybn1=(sqrt(3)*sind(angVyb) - min(ylim))/diff(ylim) * pos1(4) + pos1(2);

Xdbrn1=(sqrt(3)*cosd(angVbr)+ abs(min(xlim)))/diff(xlim) * pos1(3) + pos1(1);
Ydbrn1=(sqrt(3)*sind(angVbr) - min(ylim))/diff(ylim) * pos1(4) + pos1(2);


subplot(4,4,[9 10 13 14])   %Figure 3
title('Line Voltages');
h3 = gca;
set(h3,'XLim',[0 0.04], 'Ylim',[-2*230*sqrt(2) 2*230*sqrt(2)], 'Color','k');
h3.XAxis.Visible = 'on';
xticklabels({'0', '\pi','2\pi','3\pi','4\pi'})
h3.YAxis.Visible = 'on';

pos = get(gca, 'Position');
Xarrn=(t+ abs(min(xlim)))/diff(xlim) * pos(3) + pos(1);
Yaryn=(Vry - min(ylim))/diff(ylim) * pos(4) + pos(2);
Yaybn=(Vyb - min(ylim))/diff(ylim) * pos(4) + pos(2);
Yabrn=(Vbr - min(ylim))/diff(ylim) * pos(4) + pos(2);

curve21=animatedline('LineWidth',2,'Color',"r");
curve22=animatedline('LineWidth',2,'Color',"r", 'Marker', '.', 'MarkerSize', 20);

curve23=animatedline('LineWidth',2,'Color',"y");
curve24=animatedline('LineWidth',2,'Color',"y", 'Marker', '.', 'MarkerSize', 20);

curve25=animatedline('LineWidth',2,'Color',"b");
curve26=animatedline('LineWidth',2,'Color',"b", 'Marker', '.', 'MarkerSize',20);





for p=1:5:length(tc)
    addpoints(curve12,circ_radius*cos(tc(p)),circ_radius*sin(tc(p)),'k');
    addpoints(curve19,circ_radius*cos(tc(p)),circ_radius*sin(tc(p)),'k');
    addpoints(curve20,sqrt(3)*cos(tc(p)),sqrt(3)*sin(tc(p)),'k');
end
axPos = get(gca,'Position');

hr = annotation('line',[0 ,0],  [0,0]);
set(hr,'LineWidth',0.25,'color',"r",'LineStyle',':');

hy = annotation('line',[0 ,0],  [0,0]);
set(hy,'LineWidth',0.25,'color',"y",'LineStyle',':');

hb = annotation('line',[0 ,0],  [0,0]);
set(hb,'LineWidth',0.25,'color',"b",'LineStyle',':');

hrr = annotation('line',[0 ,0],  [0,0]);
set(hrr,'LineWidth',0.25,'color',"w",'LineStyle',':');

hyy = annotation('line',[0 ,0],  [0,0]);
set(hyy,'LineWidth',0.25,'color',"w",'LineStyle',':');

hbb = annotation('line',[0 ,0],  [0,0]);
set(hbb,'LineWidth',0.25,'color',"w",'LineStyle',':');

hry = annotation('line',[0 ,0],  [0,0]);
set(hry,'LineWidth',0.25,'color',"r",'LineStyle',':');

hyb = annotation('line',[0 ,0],  [0,0]);
set(hyb,'LineWidth',0.25,'color',"y",'LineStyle',':');

hbr = annotation('line',[0 ,0],  [0,0]);
set(hbr,'LineWidth',0.25,'color',"b",'LineStyle',':');

Vpi = annotation('line',[0 ,0],  [0,0]);
set(Vpi,'LineWidth',0.25,'color',"w",'LineStyle','--');

V2pi = annotation('line',[0 ,0],  [0,0]);
set(V2pi,'LineWidth',0.25,'color',"w",'LineStyle','--');

V3pi = annotation('line',[0 ,0],  [0,0]);
set(V3pi,'LineWidth',0.25,'color',"w",'LineStyle','--');

h01 = annotation('line',[0 ,0],  [0,0]);
set(h01,'LineWidth',0.25,'color',"w",'LineStyle','-.');

h02 = annotation('line',[0 ,0],  [0,0]);
set(h02,'LineWidth',0.25,'color',"w",'LineStyle','-.');

h03 = annotation('line',[0 ,0],  [0,0]);
set(h03,'LineWidth',0.25,'color',"w",'LineStyle','-.');

h04 = annotation('line',[0 ,0],  [0,0]);
set(h04,'LineWidth',0.25,'color',"w",'LineStyle','-.');

v01 = annotation('line',[0 ,0],  [0,0]);
set(v01,'LineWidth',0.25,'color',"w",'LineStyle','-.');

v02 = annotation('line',[0 ,0],  [0,0]);
set(v02,'LineWidth',0.25,'color',"w",'LineStyle','-.');



for i=1:5:length(t)
    
    clearpoints(curve1)
    clearpoints(curve3)
    clearpoints(curve5)
    clearpoints(curve6)
    clearpoints(curve7)
    clearpoints(curve8)
    clearpoints(curve9)
    clearpoints(curve10)
    clearpoints(curve11)
    clearpoints(curve13)
    clearpoints(curve14)
    clearpoints(curve15)
    clearpoints(curve16)
    clearpoints(curve17)
    clearpoints(curve18)

    clearpoints(curve22)
    clearpoints(curve24)
    clearpoints(curve26)

    clearpoints(curve27)
    clearpoints(curve28)
    clearpoints(curve29)
    clearpoints(curve30)
    clearpoints(curve31)
    clearpoints(curve32)

    

    addpoints(curve0,t(i),Vr(i));
    addpoints(curve2,t(i),Vy(i));
    addpoints(curve4,t(i),Vb(i));
    addpoints(curve1,t(i),Vr(i));
    addpoints(curve3,t(i),Vy(i));
    addpoints(curve5,t(i),Vb(i));

    addpoints(curve21,t(i),Vry(i));
    addpoints(curve23,t(i),Vyb(i));
    addpoints(curve25,t(i),Vbr(i));
    addpoints(curve22,t(i),Vry(i));
    addpoints(curve24,t(i),Vyb(i));
    addpoints(curve26,t(i),Vbr(i));
  

    
    addpoints(curve6,[0, cosd(angVr(i))],[0,sind(angVr(i))]);
    addpoints(curve7,cosd(angVr(i)),sind(angVr(i)));

    addpoints(curve8,[0, cosd(angVy(i))],[0,sind(angVy(i))]);
    addpoints(curve9,cosd(angVy(i)),sind(angVy(i)));

    addpoints(curve10,[0, cosd(angVb(i))],[0,sind(angVb(i))]);
    addpoints(curve11,cosd(angVb(i)),sind(angVb(i)));


    addpoints(curve13,[0, cosd(angVr(i))],[0,sind(angVr(i))]);
    addpoints(curve14,cosd(angVr(i)),sind(angVr(i)));

    addpoints(curve15,[0, cosd(angVy(i))],[0,sind(angVy(i))]);
    addpoints(curve16,cosd(angVy(i)),sind(angVy(i)));

    addpoints(curve17,[0, cosd(angVb(i))],[0,sind(angVb(i))]);
    addpoints(curve18,cosd(angVb(i)),sind(angVb(i)));


    addpoints(curve27,[0, sqrt(3)*cosd(angVry(i))],[0,sqrt(3)*sind(angVry(i))]);
    addpoints(curve28,sqrt(3)*cosd(angVry(i)),sqrt(3)*sind(angVry(i)));

    addpoints(curve29,[0, sqrt(3)*cosd(angVyb(i))],[0,sqrt(3)*sind(angVyb(i))]);
    addpoints(curve30,sqrt(3)*cosd(angVyb(i)),sqrt(3)*sind(angVyb(i)));

    addpoints(curve31,[0, sqrt(3)*cosd(angVbr(i))],[0,sqrt(3)*sind(angVbr(i))]);
    addpoints(curve32,sqrt(3)*cosd(angVbr(i)),sqrt(3)*sind(angVbr(i)));

      
    set(hr,'X',[Xdrn(i), Xarn(i)],'Y',[Ydrn(i),Yarn(i)]);
    set(hy,'X',[Xdyn(i), Xarn(i)],'Y',[Ydyn(i),Yayn(i)]);
    set(hb,'X',[Xdbn(i), Xarn(i)],'Y',[Ydbn(i),Yabn(i)]);
    

    set(hrr,'X',[Xdrn(i), Xdrn1(i)],'Y',[Ydrn(i),Ydrn1(i)]);
    set(hyy,'X',[Xdyn(i), Xdyn1(i)],'Y',[Ydyn(i),Ydyn1(i)]);
    set(hbb,'X',[Xdbn(i), Xdbn1(i)],'Y',[Ydbn(i),Ydbn1(i)]);

    set(hry,'X',[Xdryn1(i), Xarrn(i)],'Y',[Ydryn1(i),Yaryn(i)]);
    set(hyb,'X',[Xdybn1(i), Xarrn(i)],'Y',[Ydybn1(i),Yaybn(i)]);
    set(hbr,'X',[Xdbrn1(i), Xarrn(i)],'Y',[Ydbrn1(i),Yabrn(i)]);
    
    set(Vpi,'X',[0.22, 0.22],'Y',[0.1,0.95]);
    set(V2pi,'X',[0.31, 0.31],'Y',[0.1,0.95]);
    set(V3pi,'X',[0.4, 0.4],'Y',[0.1,0.95]);

    set(h01,'X',[0.5, 0.125],'Y',[0.735,0.735]);
   
    set(h02,'X',[0.5, 0.125],'Y',[0.3,0.3]);
    set(h03,'X',[0.782, 0.66],'Y',[0.735,0.735]);
    set(h04,'X',[0.83, 0.62],'Y',[0.3,0.3]);

    set(v01,'X',[0.721, 0.721],'Y',[0.635,0.835]);
    set(v02,'X',[0.721, 0.721],'Y',[0.47,0.13]);
    
    
    currFrame=getframe(fig1);
    writeVideo(writeobj, currFrame)
   
end
close(writeobj)

function e= m(MI,f,theta1,t) %modulation function1
  e=(MI*sin(2*pi*f*t + theta1) + 0);  
end




