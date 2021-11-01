clear
path=('D:\2018depression_AVemotion\2020activation_recalculation\onelevel2_work5_37V37_ppi_nocontrast_spm8\run2\HC'); %导入gPPI计算的结果路径，可以循环对每个种子点下每个被试的结果进行contrast计算
temp=dir(path);
temp=temp(3:end);
for i=1:length(temp)
    Name = temp(i).name;
%     name_dir = dir([path,filesep,Name]);
%     k = 1;
%     for j =1:length(name_dir)-2
%         if name_dir(j+2).isdir == 1           
%             Name_1(k,1) =name_dir(j+2);
%             k =k+1;
%         end
%     end
%     clear name_dir k j
    Name_1 = {'PPI_ROI1_Temporal_Inf_L';'PPI_ROI2_DLPFC_R';'PPI_ROI3_Occipital_Mid_L';'PPI_ROI4_mPFC_L';'PPI_ROI5_Angular_R'}; % # Change 
%     Name_1 = Name_1(7:11,:);
    for j =1:length(Name_1)
        mat_dir = dir([path,filesep,Name,filesep,Name_1{j},filesep,'*.mat']);
        matlabbatch{1}.spm.stats.con.spmmat = cellstr([path,filesep,Name,filesep,Name_1{j},filesep,mat_dir.name]);
        matlabbatch{1}.spm.stats.con.consess{1}.tcon.name = '01_gPPI_chongtu_activation';
        matlabbatch{1}.spm.stats.con.consess{1}.tcon.convec = [0 0 1 0 0 0 0 0 0 0 0];
        matlabbatch{1}.spm.stats.con.consess{1}.tcon.sessrep = 'repl';
        matlabbatch{1}.spm.stats.con.consess{2}.tcon.name = '02_gPPI_yizhi_activation';
        matlabbatch{1}.spm.stats.con.consess{2}.tcon.convec = [0 0 0 1 0 0 0 0 0 0 0];
        matlabbatch{1}.spm.stats.con.consess{2}.tcon.sessrep = 'repl';
        matlabbatch{1}.spm.stats.con.consess{3}.tcon.name = '03_gPPI_chongtu_yizhi_activation';
        matlabbatch{1}.spm.stats.con.consess{3}.tcon.convec = [0 0 1 -1 0 0 0 0 0 0 0];
        matlabbatch{1}.spm.stats.con.consess{3}.tcon.sessrep = 'repl';
        %%
%         matlabbatch{1}.spm.stats.con.consess{3}.tcon.name = '03_gPPI_Word_activation';
%         matlabbatch{1}.spm.stats.con.consess{3}.tcon.convec = [0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0];
%         matlabbatch{1}.spm.stats.con.consess{3}.tcon.sessrep = 'repl';
%         
        %%
        matlabbatch{1}.spm.stats.con.delete = 0;
 
        spm_jobman('run',matlabbatch);
    end
end
