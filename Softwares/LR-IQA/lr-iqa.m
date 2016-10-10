function [sc1,sc2]=lr-iqa(path1,path2,B)
%%�ú�����������LR-IQAָ��
%%input
%%@path1��ԭʼͼƬ·��
%%@path2��ʧ��ͼƬ·��
%%@B:�ֿ��С
%%output
%%@sc1:ѧϰ�������ʧ��ѧϰ��������ƶ�
%%@sc2:Ԥ�����

    X=imread(path1);
    Y=imread(path2);
    %%תΪ�Ҷ�ͼ
    X=rgb2gray(X);
    Y=rgb2gray(Y);
    %%double���ں�������
    X=double(X);
    Y=double(Y);
  
    %%���ҪȡB��������
    [hh ww]=size(X);
    hh=floor(hh/B)*B;
    ww=floor(ww/B)*B;
   
    X=X(1:hh,1:ww);
    Y=Y(1:hh,1:ww);
   
    
   
    [x hh ww]=img2patch(X,B);
    [y hh ww]=img2patch(Y,B);
    %%��ȡѵ�������ĸ���
    lenx=size(x,1);
    
    mx=mean(x);
    my=mean(y);
    mx=repmat(mx,[lenx,1]);%%repmatҲ�ǳ��ú���
    my=repmat(my,[lenx,1]);
   
    %%����ѵ��ʱһ��Ҫ��ȥͼ��ľ�ֵ
    x=x-mx;
    y=y-my;
    
    %%��С���˷��Ƶ��ó�
    w=inv(x'*x)*x'*y;
    
    %%dyΪ�ؽ�ͼ��
    dy=x*w;
 
    %%��ʵ���Բ��ñ任����ֱ�Ӽ���mse������ʱΪ���ؽ�ͼ��Ŀ��ӻ���
    dyimg=patch2img(dy,hh,ww,B);
    yyimg=patch2img(y,hh,ww,B);
    cw=w(1:B*B,1:B*B);
    cw=cw(:);
    cI=eye(B*B);
    cI=cI(:);
    len1=sqrt(cw'*cw);
    len2=sqrt(cI'*cI);
    sc1=(cw'*cI)/(sqrt(cw'*cw)*sqrt(cI'*cI)*(abs(sqrt(cw'*cw)-sqrt(cI'*cI))+1));
    
    
    sc2=mse(dyimg,yyimg);
  
    if sc2<=2
        sc2=0;
    end
    
    
  
end