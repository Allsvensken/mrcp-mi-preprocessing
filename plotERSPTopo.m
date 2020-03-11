im_state = {'_sitim', '_sitrst', '_standim', '_standrst'};
human_state = {'_sit', '_stand'};

for imst = im_state
    imstatus = imst{1}
    for hmst = human_state
        hmstatus = hmst{1}
        filename = strcat('S01',imstatus, '_during', hmstatus, '.set');
        dirname = 'C:\Users\allsv\ERSP_PLOT\MI_set_1-40';
        subj = 'sub_01';
        dest = strcat(imstatus, '_during', hmstatus,'_');

        eegchannels = 1:64;

        channels = {'AFz', 'Fz', 'Fp1', 'Fp2', 'AF7', 'AF5', 'AF3', 'AF4', 'AF6', 'AF8', 'F7' ,'F5', 'F3', 'F1', 'F2', 'F4', 'F6', 'F8', 'FT7', 'FC5', 'FC3', 'FC1', 'FCz', 'FC2', 'FC4', 'FC6', 'FT8', 'T7', 'C5', 'C3', 'C1', 'Cz', 'C2', 'C4', 'C6', 'T8','TP7', 'CP5', 'CP3', 'CP1', 'CPz', 'CP2', 'CP4', 'CP6', 'TP8', 'P7', 'P5', 'P3', 'P1', 'Pz', 'P2', 'P4', 'P6', 'P8', 'PO7', 'PO3', 'POz', 'PO4', 'PO8', 'O1', 'Oz', 'O2', 'VEOG', 'HEOG'};

        cycles = [3 0.5];

        freqs = [4 40];

        tlimits = [-1000 3999];

        baseline = [-1000 0];

        alpha = 0.05;

        mine = -4;

        maxe = 4;

        erspmax = 4;

        eeg = pop_loadset(filename,dirname);

        folder = strcat(dest,subj,'/');
        if ~exist(folder, 'dir')
            mkdir(folder)
        end

        close all;


        for i=eegchannels

            tmpsig = eeg.data(i,:,:);

            tmpsig = tmpsig(:);

            triallength = size(eeg.data,2);

            close all;

            fprintf('PROCESSING CHANNEL #%2.0f\n' ,i);
        % 
        %       [ersp(:,:,i),itc,powbase,times,freqs,erspboot,itcboot] = ...,
        %           newtimef(tmpsig,triallength,tlimits,eeg.srate,cycles, ...,
        %           'baseline',baseline, 'alpha', alpha, 'freqs', freqs,'padratio',1,...,
        %           'plotersp','on','plotitc','off','timesout',400, ...,
        %           'title',eeg.chanlocs(i).labels,'erspmax',erspmax);
        %      
        %      

            % [ersp(:,:,i),itc,powbase,times,freqs,erspboot,itcboot] = ...,
            % newtimef(tmpsig,triallength,tlimits,eeg.srate,cycles, ...,
            % 'baseline',baseline,'freqs', freqs,'padratio',1,...,
            % 'plotersp','on','plotitc','off','timesout',400, ...,
            % 'title',eeg.chanlocs(i).labels,'erspmax',erspmax);

            [ersp(:,:,i),itc,powbase,times,freqs,erspboot,itcboot] = ...,
            newtimef(tmpsig,triallength,tlimits,eeg.srate,cycles, ...,
            'freqs', freqs,'padratio',1,...,
            'plotersp','on','plotitc','off','timesout',400, ...,
            'title',eeg.chanlocs(i).labels,'erspmax',erspmax);

        %        
            figname = extractBefore(filename,'.set');
            set(gcf, 'PaperPosition', [0 0 10 5]); %x_width=10cm y_width=15cm
            saveas(gcf, strcat(folder ,figname,'_',num2str(i,'%d'),'_',channels{i},'.jpg'));

        %      erspimage{i} = getframe(gcf,[116 80 347 308]);



        %      for i1=1:size(ersp,1);
        % 
        %          for i2=1:size(ersp,2);
        % 
        %              if (ersp(i1,i2,i)>erspboot(i1,1)) & (ersp(i1,i2,i)<erspboot(i1,2));
        % 
        %                  ersp_sig(i1,i2,i)=0;
        % 
        %              else
        % 
        %                  ersp_sig(i1,i2,i)=ersp(i1,i2,i);
        % 
        %              end
        % 
        %          end
        % 
        %      end



        end
    end
end