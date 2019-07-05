#!/usr/bin/env bash

max_jobs_in_parallel=$1
pending_job_id_list=($(squeue -hlu kongfs |grep PENDING| cut -d' ' -f 14))
singleton_id=0
for job_id in "${pending_job_id_list[@]}"; do
  scontrol update jobid=${job_id} JobName=dat_${singleton_id}
  singleton_id=$(((singleton_id+1) % ${max_jobs_in_parallel}))
done