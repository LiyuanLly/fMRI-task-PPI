clc;clear;
path='D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\run1\MDD';
out1='D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8_aftercopy\PPI_ROI2_DLPFC_R\run1\chongtu\MDD';
out2='D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8_aftercopy\PPI_ROI2_DLPFC_R\run1\yizhi\MDD';
out3='D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8_aftercopy\PPI_ROI2_DLPFC_R\run1\chongtu_yizhi\MDD';

path_dir=dir(path);path_dir=path_dir(3:end);
for i=1:size(path_dir,1)
    Name=path_dir(i).name;
    outnew1 = [out1,filesep,Name,'.img']
    outnew11 = [out1,filesep,Name,'.hdr']
%     if ~isdir(outnew1)
%         mkdir(outnew1)
%     end   
    outnew2 = [out2,filesep,Name,'.img'];
    outnew22 = [out2,filesep,Name,'.hdr'];
%     if ~isdir(outnew2)
%         mkdir(outnew2)
%     end
    outnew3 = [out3,filesep,Name,'.img'];
    outnew33 = [out3,filesep,Name,'.hdr'];
%     if ~isdir(outnew2)
%         mkdir(outnew2)
    cur_dir1=[path,filesep,Name,filesep,'PPI_ROI2_DLPFC_R',filesep,'con_0001.img'];
    cur_dir11=[path,filesep,Name,filesep,'PPI_ROI2_DLPFC_R',filesep,'con_0001.hdr'];
    cur_dir2=[path,filesep,Name,filesep,'PPI_ROI2_DLPFC_R',filesep,'con_0002.img'];
    cur_dir22=[path,filesep,Name,filesep,'PPI_ROI2_DLPFC_R',filesep,'con_0002.hdr'];
    cur_dir3=[path,filesep,Name,filesep,'PPI_ROI2_DLPFC_R',filesep,'con_0003.img'];
    cur_dir33=[path,filesep,Name,filesep,'PPI_ROI2_DLPFC_R',filesep,'con_0003.hdr'];
    copyfile(cur_dir1,outnew1);
    copyfile(cur_dir11,outnew11);
    copyfile(cur_dir2,outnew2);
    copyfile(cur_dir22,outnew22);
    copyfile(cur_dir3,outnew3);
    copyfile(cur_dir33,outnew33);
end
