function [out height width]=img2patch(Y,B)
%%image2patch��ԭʼͼ����б��Σ�ʹ�ñ任���ͼ�����ݸ����ʺϽ���ѵ��
%%Input:
%%%@Y:����ͼ��
%%%@B:�ֿ��С
%%%��������ͼ��Y��СΪ[400,400],BΪ4����img2patch��ͼ��ֳɣ�400*400/��4*4����=10000��4x4��С��ͼ���
%%%����Щ4x4��ͼ���reshape��1x16�����������ٽ���10000���������ϲ���һ��10000x16�ľ���

%%output
%%%@out:�任���ͼ��
%%%@height: ͼ��߶�/4����Ҫ��patch2img�������õ�
%%%@width  ͼ�����/4����Ҫ��patch2img�������õ�

[m,n]=size(Y);
m=floor(m/B)*B; %%��ͼ��ĳ��Ȳ���B�ı�������Ҫȡ����floorΪȡ��������e.g. floor(7.9)=7.
n=floor(n/B)*B;
Y=Y(1:m,1:n); %%������ȡ�����ͼ�����ԭʼͼ��
cy=mat2cell(Y,ones(m/B,1)*B,ones(n/B,1)*B);
%%mat2cell��ͼ��ֿ��зǳ�����
%%A=[1 2 3;4 5 6;7 8 9];
%%B=mat2cell(A,[2 1],[1 2]);
%%�� B{1,1}=[1 3];B{1,2}=[2 3;5 6];B{2,1}=[7];b{2,2}={8 9};
%%����ͨ��help mat2cell��ѯ���й���
for i=1:m/B
    for j=1:n/B
        cy{i,j}=(cy{i,j}(:))';%%a(:)��ʾ������a��ѹ�⡯��һ������������ʽ�ǵ�һ�нӵڶ����������ƣ����Ͻǵķֺű�ʾת��
    end
end
out=cell2mat(cy(:));%%�����cell��Ԫ�غϲ���һ��matrix
height=m/B;
width=n/B;
end