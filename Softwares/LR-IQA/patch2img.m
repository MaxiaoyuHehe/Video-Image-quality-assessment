function img=patch2img(p,height,width,B)
%%patch2img������patch2img��ͼ��ԭ����
%%Input:
%%%@p:����img2patch���ͼ������
%%%@height:p�в����ڿ����Ϣ�����ͼ��Ŀ����Ҫ����ı���ָ�����˴�height=ͼ��߶�/B ����img2patch�еĵڶ��������
%%%@width:ͬ��
%%%@B:�ֿ��С


pp=mat2cell(p,ones(width*height,1),ones(1,1)*B*B);
  
    
    np=cell(height,width);
    for i=1:height
        for j=1:width
            np{i,j}=pp{(j-1)*height+i};
            tmp=np{i,j};
            np{i,j}=reshape(tmp',[B,B]);%%reshape������Ҫ��֤reshapeǰ��ָ���ľ����е�Ԫ���������� e.g. ���ܽ�3x8�ľ���reshape��4x5��matlab��reshape�����Զ���ȡ�����Զ����
        end
    end
    
    img=cell2mat(np);
    
end