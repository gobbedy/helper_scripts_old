#!/bin/bash

# This script is designed to work on Beihang; would need some fiddling to work on a different cluster
job_id_list=(`squeue -lha | grep -w dell | grep RUNNING | grep -oP '\d{4,6}'`)
declare -A usage_list
for job_id in "${job_id_list[@]}"
do
    user=$(scontrol show jobid=${job_id} | grep -oP 'UserId[^ ]+' | grep -oP '[^=]+$' | grep -oP '^[^(]+')
    num_gpus=$(scontrol show jobid=${job_id} | grep -oP 'gres/gpu.*' | grep -oP '\d+$')
    if [[ -z ${num_gpus} ]]; then
      echo "***WARNING: $user is running job ${job_id} with no GPUs. See below. ***"
      squeue -lha | grep ${job_id}
      echo ""
    fi
    prior_num_gpus="${usage_list[$user]}"
#echo $prior_num_gpus
    num_gpus=$((prior_num_gpus + num_gpus))
    usage_list[$user]=$num_gpus
done

total_gpu_in_use=0
for user in "${!usage_list[@]}"; do
    num_gpus=${usage_list[$user]}
    total_gpu_in_use=$((total_gpu_in_use+num_gpus))
    printf "User %s is using %s GPUs.\n" "$user" "$num_gpus"
done

echo ""
printf "Total number of GPUs in use: %s\n" "$total_gpu_in_use"

unused_gpus=$((112-total_gpu_in_use))
printf "Number of unused GPUs: %s\n" "$unused_gpus"