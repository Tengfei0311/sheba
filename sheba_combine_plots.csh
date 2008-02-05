#!/bin/csh
# CVS: $Revision: 1.2 $ $Date: 2008/02/05 11:46:40 $
# gather the sub-plots into one summary plot
#
# Requires: ghostscript and psutils. 

# undo the rotation of the error plots
pstops -q -pa4 '1:0L' $1_errclu.eps /tmp/sheba_tmp.eps

# combine the plot files
gs -q -dNOPAUSE -sDEVICE=pswrite -sOUTPUTFILE=/tmp/sheba_tmp2.ps -dBATCH split_inp.ps split_rot.ps split_wav.ps /tmp/sheba_tmp.eps

# make them into a single page
pstops -q -pa4 '4:0@0.49(0,0)+1@0.49(0,0.4h)+2@0.5(0.42w,0)+3@0.40(0.5w,0.45h)' /tmp/sheba_tmp2.ps /tmp/sheba_tmp3.ps

# copy this file
\cp /tmp/sheba_tmp3.ps $1_result.ps

# tidy up
rm -f /tmp/sheba_tmp.eps /tmp/sheba_tmp?.ps
