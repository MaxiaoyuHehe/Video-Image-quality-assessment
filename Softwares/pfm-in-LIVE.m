clear

pca=zeros(982,50);
sc=zeros(982,1);%%�͹۷�������sc�У���������Ƕ�ά�ģ��޸�sc��ά��

%%������ʵ��ϸ�ڽ�Ϊ����������ֱ��ʹ��
Limt=[228,461,635,809,983];
sub=[0,227,460,634,808];
Class={'jp2k','jpeg','wn','gblur','fastfading'};
load dmos;
load refnames_all;

for i=1:982
    i
    path1='E:\databaserelease2\';%%������ĳ����databaserelease2��realpath.
    path2=Class{find(Limt>i, 1 )};
    path3='\img';
    path4='.bmp';
    Img_test=[path1 path2 path3 num2str(i-sub(find(Limt>i, 1 ))) path4];
    path5='E:\databaserelease2\refimgs\';
    Img_src=[path5 refnames_all{i}]; 
    ImSc=imread(Img_src); 
    ImTs=imread(Img_test); 
   %%���������㷨д������Ϳ�����
    sc(i)=ssim(ImSc,ImTs);
 
   
end 
   
