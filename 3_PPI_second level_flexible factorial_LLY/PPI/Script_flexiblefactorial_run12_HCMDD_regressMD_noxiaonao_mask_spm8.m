% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'D:\2018depression_AVemotion\2020activation_recalculation\result2\work5\Script_flexiblefactorial_run12_HCMDD_regressMD_noxiaonao_mask_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
