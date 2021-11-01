function ppi_wrapper(regionnumber,firstsubject,lastsubject)
regionnumber=5; %%ROI脑区的个数
firstsubject=1;
lastsubject=37; %%%被试数,两组放在一起
%在这里输入数字就可以点击上方的绿色运行键，或者也可以不在这里输入，直接在matlab里输入ppi_wrapper(2,1,86)直接运行

%User input required (directories and subjects)
addpath('D:\2018depression_AVemotion\2020activation_recalculation\manuscript\newppitppl\')%newPPI放的路径
addpath('D:\soft\spm8_2')%%%spm8的路径

%User input required (region files)
%'H:\Depression\fmri data\mask oxytocin_20130131\process\gppi\rL_AMY.img'
% regionfile={'G:\Lisa\MaskOXT\2ndLevel\gppi_84FullFactorial_1st12\sphere6_A-N_IFG_L_-48_39_-6.img'...
%     'G:\Lisa\MaskOXT\2ndLevel\gppi_84FullFactorial_1st12\sphere6_A-N_IFG_L_-48_39_-6.img'...
%     'G:\Lisa\MaskOXT\2ndLevel\gppi_84FullFactorial_1st12\sphere6_A-N_IFG_L_-48_39_-6.img'} %%%ROI路径和名称

% regionfile={'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\Harvard\STG_anterior_L_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\Harvard\STG_middle_anterior_L_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\IFG_L_6_4_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\INS_L_6_1_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\MTG_L_4_4_1_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\MTG_L_4_4_2_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\PhG_R_6_2_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\PhG_R_6_4_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\STG_L_6_3_jiaoji_ROI.img'...
%     'F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_calculation\gPPI_1st_calculation\gPPI_mask\MDDvsBDvsMDD_WPandWN_SI\jiangtianzi\STG_L_6_4_jiaoji_ROI.img'} %%%ROI路径和名称

% regionfile={'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_tu3_mPFC.nii'} %%%ROI路径和名称

regionfile={'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_1_Temporal_inf_L.nii'...
    'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_2_DLPFC_R.nii'...
    'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_3_Occipital_Mid_L.nii'...
    'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_4_mPFC_L.nii'...
    'D:\2018depression_AVemotion\2020activation_recalculation\mask\ROI_5_Angular_R.nii'...
    } %%%ROI路径和名称



%这里可以用marsbar提取roi，然后export至nii文件，然后用mricro转化nii文件至hdr/img格式。

%User input required (region names)

%  region={'A-N_IFG_L_-48_39_-6'  'ROI2'   'ROI3' }; %保存在每个被试的first level里面的文件夹名称


% region={'seed16' 'seed17' 'seed18' 'seed20' 'seed21'}; %保存在每个被试的first level里面的文件夹名称

% region={'PPI_ROI_tu3_mPFC'}; %保存在每个被试的first level里面的文件夹名称
region={'ROI1_Temporal_Inf_L' 'ROI2_DLPFC_R' 'ROI3_Occipital_Mid_L' 'ROI4_mPFC_L' 'ROI5_Angular_R'}; %保存在每个被试的first level里面的文件夹名称




%User input required (master template)
load('master.mat')%需要load master改里面的两个参数，task——P中设置实验条件
for j=1:regionnumber
P.VOI=regionfile{j};
P.Region=region{j};

%User input required (change directory to where the input structure should
%be saved)
% save(['G:\Lisa\MaskOXT\newppitppl\example_structure_inputs\roi master\' region{j} '.mat'],'P');%每个种子点跑ppi的batch，下面会调用

% save(['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_1st_calculation\gPPI_mask_output_patient\MDDvsBDvsMDD_WPandWN_SI\' region{j} '.mat'],'P');%自己定义（新建的文件夹）路径，每个种子点跑ppi的batch，下面会调用
% save(['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_1st_calculation\gPPI_mask_output_MDD\MDDvsBDvsMDD_WPandWN_SI\' region{j} '.mat'],'P');%自己定义（新建的文件夹）路径，每个种子点跑ppi的batch，下面会调用
save(['D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\mask_out\' region{j} '.mat'],'P');%自己定义（新建的文件夹）路径，每个种子点跑ppi的batch，下面会调用


for i=firstsubject:lastsubject;
%    load('F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\list1.txt')
%    Subjects{i}=['f',num2str(i)];
     path = 'D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\run1\MDD\'   %存放数据的路径，一下三条指令是顺序读取路径下的子文件夹
     temp = dir(path)
     temp=temp(3:end)
     Subjects{i}= temp(i).name
    try
        %User input required directory of SPM.mat files
%         Directory=['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\MDD\chen_depression_MDD_001_chenfurong']
       Directory=['D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\run1\MDD\' Subjects{i}]; %firstlevel每个被试的文件夹，ppi结果需要放在这里面
        
        cd(Directory)
        
        %User input required (directory same as line 23 above)
%         load(['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_1st_calculation\gPPI_mask_output_patient\MDDvsBDvsMDD_WPandWN_SI\' region{j} '.mat']);%调用上面保存的batch,同上面的save master.mat,每个ROI有一个       
%           load(['F:\MDDcyy\subsequenceCalculation\BasedOnEPI\1stResults\gPPI_1st_calculation\gPPI_mask_output_MDD\MDDvsBDvsMDD_WPandWN_SI\' region{j} '.mat']);%调用上面保存的batch,同上面的save master.mat,每个ROI有一个
          load(['D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\mask_out\' region{j} '.mat']);%调用上面保存的batch,同上面的save master.mat,每个ROI有一个


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
