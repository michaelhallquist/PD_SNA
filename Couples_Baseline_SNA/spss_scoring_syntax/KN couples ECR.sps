﻿*code to score the ECR in the couples study was written by Kimberly Nolf on 3.17.14
*recode the reverse items for Anxiety (2, 22) and Avoidance (3, 5, 11,15, 17, 19, 25, 27, 29, 31, 33, 35) scales.

RECODE 
ecr2,ecr3,ecr5,ecr11,ecr15,ecr17,ecr19,ecr22,ecr25,ecr27,ecr29,ecr31,ecr33,ecr35
(1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) INTO ecr2_R,ecr3_R,ecr5_R,ecr11_R,ecr15_R,ecr17_R,ecr19_R,ecr22_R,
ecr25_R,ecr27_R,ecr29_R,ecr31_R,ecr33_R,ecr35_R.
EXECUTE .

COMPUTE ECRanx=mean.16 (ecr2_R, ecr4, ecr6, ecr8, ecr10, ecr12, 
   ecr14,  ecr16, ecr18, ecr20, ecr22_R, ecr24, ecr26, ecr28, 
   ecr30, ecr32, ecr34, ecr36) .
COMPUTE ECRavoid=mean.16 (ecr1, ecr3_R, ecr5_R, ecr7, ecr9, 
   ecr11_R, ecr13, ecr15_R, ecr17_R, ecr19_R, ecr21, ecr23, 
   ecr25_R, ecr27_R, ecr29_R, ecr31_R, ecr33_R, ecr35_R) .
EXECUTE.

COMPUTE ECRSum = SUM.32(ecr1,ecr2_R,ecr3_R,ecr4,ecr5_R,ecr6,ecr7,ecr8,ecr9,ecr10,ecr11_R,ecr12,ecr13,ecr14,
ecr15_R,ecr16,ecr17_R,ecr18,ecr19_R,ecr20,ecr21,ecr22_R,ecr23,ecr24,ecr25_R,ecr26,ecr27_R,ecr28,ecr29_R,ecr30,
ecr31_R,ecr32,ecr33_R,ecr34,ecr35_R,ecr36) .
EXECUTE .

COMPUTE ECRNumMiss = NMISS(ecr1,ecr2_R,ecr3_R,ecr4,ecr5_R,ecr6,ecr7,ecr8,ecr9,ecr10,ecr11_R,ecr12,ecr13,ecr14,
ecr15_R,ecr16,ecr17_R,ecr18,ecr19_R,ecr20,ecr21,ecr22_R,ecr23,ecr24,ecr25_R,ecr26,ecr27_R,ecr28,ecr29_R,ecr30,
ecr31_R,ecr33_R,ecr34,ecr35_R,ecr36) .
EXECUTE .

alter type ECRanx TO ECRSum (F8.0).
EXECUTE.
RECODE ECRanx ECRavoid ECRSum (SYSMIS=9999) .
EXECUTE .
VARIABLE LABELS ECRanx 'ECR Anxiety' ECRavoid 'ECR Avoidance' ECRSum 'ECR Sum Value' .
