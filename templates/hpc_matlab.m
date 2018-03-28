function hpc_matlab(stringVariable, otherVariable, runNumber)
% Sample matlab script to be run on cluster - [RUN THROUGH QSUB]
%
% Syntax:  qsub -N MyExperimentName -v stringVariable=\'test\',otherVariable=2.5,runNumber=1 sb_hpc_matlab.sh
%
% See also: sb_hpc_matlab.sh below
%
%%
% sb_hpc_matlab.sh [make a new file out of this]
% -------------------------------------------------------------------------
%
% #!/bin/sh
% #PBS -N GenericSubmissionName
% #PBS -q default
% #PBS -l nodes=1:ppn=12
% #PBS -l walltime=24:00:00
% #PBS -l vmem=64gb
% 
% #---------------
% # -N          == Name of script
% # -q          == Queue (e.g. default, hpc, wr5, hpc2) [use default!]
% # -- nodes    == #number of nodes
% # -- ppn      == #processors per node
% # -- walltime == time till it cuts off automatically
% # -- vmem     == RAM to use (see http://wr0.wr.inf.h-brs.de/wr/hardware/hardware.html) for each nodes capability
% #---------------
% 
% # Necessary to pseudo-revert to old memory allocation behaviour
% export MALLOC_ARENA_MAX=4
% 
% # Load Java, needed for parallel computing toolbox
% # java/7, java/8 no noticable difference in terms of stability
% module load java/default
% module load cuda/default
% 
% # Run experiment
% cd $PBS_O_HOME/myCodeFolder/exactly_where_hpc_matlab_is/
% matlab -nodisplay -nosplash -nodesktop -r "hpc_matlab($stringVariable, $otherVariable, $runNumber)"
%
% -------------------------------------------------------------------------
%% Other usefulness
% 
% * Getting into the cluster:
% ssh -XC agaier2m@wr0.wr.inf.h-brs.de
% 
% * Getting files in and out:
% scp -r <source> <destination>
% e.g. scp -r agaier2m@wr0.wr.inf.h-brs.de:/scratch/agaier2m/experimentData/experimentResults.tar .
%
% ** Using git is much easier for source code **
%
% * Show current jobs: 
%   yours:          qstat
%   everbodies:     showbatch
%   graphically:    http://www.wr.inf.h-brs.de/wr/stat/batch.xhtml
%
% * Kill jobs:
%   qdel <jobID> (you can find this with qstat)
%   qselect -u agaier2m | xargs qdel #killAllYourJobs
%
% * More PBS script commands and info:
%    https://www.westgrid.ca/files/PBS%20Script_0.pdf
%    https://www.osc.edu/supercomputing/batch-processing-at-osc/pbs-directives-summary
%
%%

% Author: Adam Gaier
% Bonn-Rhein-Sieg University of Applied Sciences (BRSU)
% email: adam.gaier@h-brs.de
% Oct 2017; Last revision: 13-Oct-2017

%%
%------------- BEGIN CODE --------------
disp(['Variable 1: ', stringVariable newline ...
      'Variable 2: ', num2str(otherVariable) newline ...
      'Run number: ', int2str(runNumber)     ]);

%% Parallelization Settings
distcomp.feature( 'LocalUseMpiexec', false );
nCores = 12; parpool(nCores);

% Create Temp Directory for Multithreading
tmpdir = getenv('TMPDIR');
if isempty(tmpdir);tmpdir='/tmp';end
myCluster.JobStorageLocation  = tmpdir;
myCluster.HasSharedFilesystem = true;

%% Ensure Randomness of Randomness
% Otherwise all your replicate jobs will be the same.
RandStream.setGlobalStream(RandStream('mt19937ar','Seed','shuffle'));

%% Add all files to path
currentPath = mfilename('fullpath'); 
addpath(genpath(currentPath(1:end-length(mfilename)))); % All files above this mfile
addpath(genpath('~/Code/matlabExtensions/'));           % Add Some other folder

%% Run Algorithm
runTime = tic;

myAlgorithm = @(x) rand(1,length(x)).*0.2.*sin(x);
hyperParameters = 1:10;

disp('Running Job')
output = myAlgorithm(hyperParameters);
disp(['Runtime: ' seconds2human(toc(runTime))]);

%% Save Results

save(['result_' stringVariable int2str(runNumber) '.mat'],'output','hyperParameters');
end

%------------- END OF CODE --------------
