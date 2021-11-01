function ppi_wrapper(regionnumber,firstsubject,lastsubject)
regionnumber=5; %%ROI�����ĸ���
firstsubject=1;
lastsubject=37; %%%������,�������һ��
%�������������־Ϳ��Ե���Ϸ�����ɫ���м�������Ҳ���Բ����������룬ֱ����matlab������ppi_wrapper(2,1,86)ֱ������

%User input required (directories and subjects)
addpath('D:\2018depression_AVemotion\2020activation_recalculation\manuscript\newppitppl\')%newPPI�ŵ�·��
addpath('D:\soft\spm8_2')%%%spm8��·��

%User input required (region files)
%'H:\Depression\fmri data\mask oxytocin_20130131\process\gppi\rL_AMY.img'
% regionfile={'G:\Lisa\MaskOXT\2ndLevel\gppi_84FullFactorial_1st12\sphere6_A-N_IFG_L_-48_39_-6.img'...
%     'G:\Lisa\MaskOXT\2ndLevel\gppi_84FullFactorial_1st12\sphere6_A-N_IFG_L_-48_39_-6.img'...
%     'G:\Lisa\MaskOXT\2ndLevel\gppi_84FullFactorial_1st12\sphere6_A-N_IFG_L_-48_39_-6.img'} %%%ROI·��������

% regionfile={'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\Harvard\STG_anterior_L_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\Harvard\STG_middle_anterior_L_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\IFG_L_6_4_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\INS_L_6_1_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\MTG_L_4_4_1_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\MTG_L_4_4_2_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\PhG_R_6_2_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\PhG_R_6_4_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\STG_L_6_3_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\STG_L_6_4_jiaoji_ROI.img'} %%%ROI·��������

% regionfile={'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_tu3_mPFC.nii'} %%%ROI·��������

regionfile={'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_1_Temporal_inf_L.nii'...
    'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_2_DLPFC_R.nii'...
    'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_3_Occipital_Mid_L.nii'...
    'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_4_mPFC_L.nii'...
    'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_5_Angular_R.nii'...
    } %%%ROI·��������



%���������marsbar��ȡroi��Ȼ��export��nii�ļ���Ȼ����mricroת��nii�ļ���hdr/img��ʽ��

%User input required (region names)

%  region={'A-N_IFG_L_-48_39_-6'  'ROI2'   'ROI3' }; %������ÿ�����Ե�first level������ļ�������


% region={'seed16' 'seed17' 'seed18' 'seed20' 'seed21'}; %������ÿ�����Ե�first level������ļ�������

% region={'PPI_ROI_tu3_mPFC'}; %������ÿ�����Ե�first level������ļ�������
region={'ROI1_Temporal_Inf_L' 'ROI2_DLPFC_R' 'ROI3_Occipital_Mid_L' 'ROI4_mPFC_L' 'ROI5_Angular_R'}; %������ÿ�����Ե�first level������ļ�������




%User input required (master template)
load('master.mat')%��Ҫload master�����������������task����P������ʵ������
for j=1:regionnumber
P.VOI=regionfile{j};
P.Region=region{j};

%User input required (change directory to where the input structure should
%be saved)
% save(['G:\Lisa\MaskOXT\newppitppl\example_structure_inputs\roi master\' region{j} '.mat'],'P');%ÿ�����ӵ���ppi��batch����������

% save(['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_1st_calculation\gPPI_mask_output_patient\MDDvsBDvsMDD_WPandWN_SI\' region{j} '.mat'],'P');%�Լ����壨�½����ļ��У�·����ÿ�����ӵ���ppi��batch����������
% save(['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_1st_calculation\gPPI_mask_output_MDD\MDDvsBDvsMDD_WPandWN_SI\' region{j} '.mat'],'P');%�Լ����壨�½����ļ��У�·����ÿ�����ӵ���ppi��batch����������
save(['D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\mask_out\' region{j} '.mat'],'P');%�Լ����壨�½����ļ��У�·����ÿ�����ӵ���ppi��batch����������


for i=firstsubject:lastsubject;
%    load('F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\list1.txt')
%    Subjects{i}=['f',num2str(i)];
     path = 'D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\run1\MDD\'   %������ݵ�·����һ������ָ����˳���ȡ·���µ����ļ���
     temp = dir(path)
     temp=temp(3:end)
     Subjects{i}= temp(i).name
    try
        %User input required directory of SPM.mat files
%         Directory=['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\MDD\chen_depression_MDD_001_chenfurong']
       Directory=['D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\run1\MDD\' Subjects{i}]; %firstlevelÿ�����Ե��ļ��У�ppi�����Ҫ����������
        
        cd(Directory)
        
        %User input required (directory same as line 23 above)
%         load(['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_1st_calculation\gPPI_mask_output_patient\MDDvsBDvsMDD_WPandWN_SI\' region{j} '.mat']);%�������汣���batch,ͬ�����save master.mat,ÿ��ROI��һ��       
%           load(['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_1st_calculation\gPPI_mask_output_MDD\MDDvsBDvsMDD_WPandWN_SI\' region{j} '.mat']);%�������汣���batch,ͬ�����save master.mat,ÿ��ROI��һ��
          load(['D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\mask_out\' region{j} '.mat']);%�������汣���batch,ͬ�����save master.mat,ÿ��ROI��һ��


%         P.subject=['chen_depression_MDD_001_chenfurong']%Subjects{i};
        P.subject=Subjects{i};
        P.directory=Directory;
        
        %User input required (change analysis to be more specific)
        save([Subjects{i} '_analysis_' region{j} '.mat'],'P');
        PPPI([Subjects{i} '_analysis_' region{j} '.mat']);
    catch
%        disp(['Failed: ' Subjects{i}])
       disp(['Failed'])
    end
end
end
% end
