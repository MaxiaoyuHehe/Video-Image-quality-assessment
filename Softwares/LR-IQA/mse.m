function PSNR = mse(f1, f2)
%��������ͼ��ķ�ֵ�����
k = 8;
%kΪͼ���Ǳ�ʾ�ظ����ص����õĶ�����λ������λ�
fmax = 2.^k - 1;
a = fmax.^2;
e = double(f1) - double(f2);
[m, n] = size(e);
e=e(:);
PSNR = sum(e.^2)/(m*n);
