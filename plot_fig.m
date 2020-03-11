function plot_fig(subjs, types)
    eeglab;
    % types = {'MI','MRCP', ... }
    % subjs e.g. {'S04', 'S05', 'S06', 'S07', 'S08', 'S09', 'S10', 'S11'}
    % plot_fig({'S04', 'S05', 'S06' }, {'MI','MRCP'})

    % plot_fig('ALL', {'MI','MRCP'})
    
    if strcmp(subjs,'ALL')
        subjs = {'S04', 'S05', 'S06', 'S07', 'S08', 'S09', 'S10', 'S11'}
    end
    
    tlimits = [-1000 12996];
    
    if ~exist('runs','var')
        set_runs = {1}
    else
        set_runs = runs
    end
    
    for r = set_runs
        run = r{1}
        for t = types
            type = t{1}
            if strcmp(type,'MI')
                set_path = 'MI_set_1-40/'
                f_name = '_during_'
                dest = 'MI_fig_4-40hz/'
                erspmax = 7;
                freqs = [4 40];
                cycles = [3 0.5];
            elseif strcmp(type,'MRCP')
                set_path = 'MRCP_set_0.1-40/'
                f_name = '_during_'
                dest = 'MRCP_fig_0-6hz/'
                erspmax = 7;
                freqs = [0 6];
                cycles = [3 0.01];
            end
    
            for subject = subjs
                s = subject{1};
    
                % .set list names]
                subj_file = {strcat(s,f_name,'sit.set'), strcat(s,f_name,'stand.set')};

    
                % call plotERSPTopo.m to plot ERSP
                for sub = subj_file
                    plotERSPTopo(set_path,sub{1},s,dest, erspmax, freqs, cycles, tlimits);
                end
            end
        end
    end