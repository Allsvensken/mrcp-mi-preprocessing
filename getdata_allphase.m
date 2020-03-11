function [sit, stand] = getdata_allphase(subjs, types)

% subjs e.g. {'S04', 'S05' , ... }
% types e.g {'MI', 'MRCP' }
% [sit, stand] = getdata_allphase({'...'}, {'...'});
subjs = 'S01'
types = 'MI'
eeglab;

for s = subjs
    subj = subjs
    for t = types
        type = types
        if strcmp(type,'MI')
            mat_path = 'C:\Users\allsv\ERSP_PLOT\'
            set_path = 'MI_set_1-40/' 
            f_name = '_during_'
        elseif strcmp(type,'MRCP')
            mat_path = '../MATLAB_array/MRCP_allphase_matfile_0.1-40/'
            set_path = 'MRCP_set_0.1-40/'
            f_name = '_during_'
        end
        % make set_path directory if it doesn't exist
        if ~exist(set_path, 'dir')
            mkdir(set_path)
        end
    status = {'_sitim', '_sitrst', '_standim', '_standrst'};
        for states = status
            state = states{1}
            % create Matlab array from .mat files
            mat_sit = load(strcat(mat_path,subj,state, f_name,'sitting.mat'));
            sit = mat_sit.data([1:64],:);
            mat_stand = load(strcat(mat_path,subj, state, f_name,'standing.mat'));
            stand = mat_stand.data([1:64],:);

            chanlocs = 'eeg_chan64.locs';
            tasks = {{'sit',sit}, {'stand',stand}};

            for task = tasks

                eeg_data = task{1}{1,2};
                setname = strcat(subj,state,f_name,task{1}{1,1})

                % import Matlab array to EEG data  
                [EEG, com] = pop_importdata('dataformat', 'array', 'data', eeg_data, 'setname', setname, ...
                'srate', 1200, 'pnts', 6000, 'xmin', -1, 'nbchan', 64, 'chanlocs', chanlocs);

                % save data EEG data to .set
                save_name = strcat(setname,'.set')
                [EEG, com] = pop_saveset(EEG , 'filename', save_name, 'filepath', set_path);
            end
        end
    end
end

