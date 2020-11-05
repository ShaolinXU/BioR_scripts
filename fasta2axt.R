#!/usr/bin/env Rscript
#Author: Shaolin Xu
#Date: 20201105
#Email: shaolin@stu2018.jnu.edu.cn

library(seqinr)

args = commandArgs(trailingOnly=TRUE)

output <- args[2] # 输出文件名称

seq_file <- read.fasta(args[1],as.string = T)
test <- seq_file[[1]]

N_seq <- length(seq_file)

ref_seq <- seq_file[[which(attr(seq_file,"name")==args[3])]] #args[3] 指定用作参照的物种
ref_seq_seq <- ref_seq[1]

for (i in 1:N_seq){
  if(attr(seq_file[[i]],"name")!=args[3]){
    comp_pair <- paste(args[3],attr(seq_file[[i]],"name"),sep = "-")
    write(comp_pair,file = args[2],append = T) # output file name in args[4]
    write(ref_seq_seq,file = args[2],append = T)
    write(seq_file[[i]][1],file = args[2],append=T)
    write("\n",file = args[2],append=T)
  }
}
