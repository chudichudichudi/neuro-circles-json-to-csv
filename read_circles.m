a=importdata('circles_incc.csv','\t',1);
NCOLS=size(a.data,2);
for k=1:NCOLS
    eval([a.colheaders{1,k},'=a.data(:,k)']);
end
 NSUB=length(present_x);
 
 goodsubs=find(diff([timeline_year_1900_pos,timeline_year_2100_pos]')<9999);
 b=a.data(goodsubs,:);
   [t,i]=sort(b(:,1));b=b(i,:); % sort by age.
for k=1:NCOLS
    eval([a.colheaders{1,k},'=b(:,k)']);
end
  
 
 NSUB=length(goodsubs);
 L=9;C=6; % lineas y columnas de los plots
 
%% circles
close all;figure;
 FUTURE=[future_x,future_y,future_radius];
 PAST=[past_x,past_y,past_radius];    
 PRESENT=[present_x,present_y,present_radius];
 
for k=1:NSUB
    subplot(L,C,k);
    viscircles(FUTURE(k,1:2),FUTURE(k,3),'EdgeColor','r')
    viscircles(PRESENT(k,1:2),PRESENT(k,3),'EdgeColor','g')
    viscircles(PAST(k,1:2),PAST(k,3),'EdgeColor','b')
end


%% timeline
figure;
 TIMELINE_HIST=([timeline_year_1900_pos,timeline_wwii_pos,timeline_the_beatles_pos,timeline_today_pos,timeline_year_2100_pos]);
 TIMELINE_LIFE=([timeline_my_birth_pos,timeline_my_childhood_pos,timeline_my_youth_pos, timeline_my_third_age_pos]);
 T_LIFE=[];
 for i=1:NSUB
     temp=TIMELINE_HIST(i,:);
     temp=temp-temp(1);     
     f=200/(temp(5)-temp(1));
     T_HIST(i,:)=(temp*f)+1900
     temp2 =TIMELINE_LIFE(i,:)-TIMELINE_HIST(i,1);
     T_LIFE(i,:)=(temp2*f)+1900;
 end
birth=2014-question_age;
 
color_hist={'k','r','g','b','k'};
 
 
 for i=1:NSUB
     subplot(L,C,i);
     X=[T_LIFE(i,1),T_LIFE(i,end),T_LIFE(i,end),T_LIFE(i,1)]; Y=[0.5 0.5 1.5 1.5]; P=patch(X,Y,[0.7 0.7 0.7]); set(P,'edgecolor','w');
     for j=1:size(TIMELINE_HIST,2)
           line([T_HIST(i,j),T_HIST(i,j)],[0,2],'Color',color_hist{j},'LineWidth',4)
     end
     xlim([1850 2150]);box off;set(gca,'ytick',[]); if (i < NSUB);set(gca,'xtick',[]);end
     line([birth(i) birth(i)],[0,2],'Color','k','LineWidth',2,'LineStyle','--')
     
 end
  
 
 %% Weekdays
 
figure;
  monday=[monday_x,monday_y,monday_width,monday_height,monday_color];
 tuesday=[tuesday_x,tuesday_y,tuesday_width,tuesday_height,tuesday_color]; 
wednesday=[wednesday_x,wednesday_y,wednesday_width,wednesday_height,wednesday_color];
  thursday=[thursday_x,thursday_y,thursday_width,thursday_height,thursday_color];
 friday=[friday_x,friday_y,friday_width,friday_height,friday_color]; 
saturday=[saturday_x,saturday_y,saturday_width,saturday_height,saturday_color];
sunday=[sunday_x,sunday_y,sunday_width,sunday_height,sunday_color];


for k=1:NSUB
subplot(L,C,k);
[X,Y]=patch_time(monday(k,:));
patch(X,Y,[0.2 0.2 0.2])

[X,Y]=patch_time(tuesday(k,:));
patch(X,Y,[0.35 0.35 0.35])

[X,Y]=patch_time(wednesday(k,:));

patch(X,Y,[0.5 0.5 0.5])

[X,Y]=patch_time(thursday(k,:));
patch(X,Y,[0.65 0.65 0.65])

[X,Y]=patch_time(friday(k,:));
patch(X,Y,[0.8 0.8 0.8])

[X,Y]=patch_time(saturday(k,:));
patch(X,Y,[0 0 1])

[X,Y]=patch_time(sunday(k,:));

patch(X,Y,[1 0 0])
end

%%
figure;
winter=[winter_x,winter_y,winter_width,winter_height,winter_color];
spring=[spring_x,spring_y,spring_width,spring_height,spring_color];
summer=[summer_x,summer_y,summer_width,summer_height,summer_color];
autum=[autum_x,autum_y,autum_width,autum_height,autum_color];

for k=1:NSUB
    subplot(L,C,k);

[X,Y]=patch_time(winter(k,:));patch(X,Y,[0 0 1])
[X,Y]=patch_time(spring(k,:));patch(X,Y,[0 1 0])
[X,Y]=patch_time(summer(k,:));patch(X,Y,[1 0 0])
[X,Y]=patch_time(autum(k,:));patch(X,Y,[0.8 0.2 0.2])
end
