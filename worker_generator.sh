#!/bin/bash

# Create workers directory if it doesn't exist
mkdir -p workers

# Move into workers directory
cd workers

# Find the highest existing worker number
max_num=$(ls worker*.txt 2>/dev/null | \
sed -E 's/worker([0-9]+)\.txt/\1/' | \
sort -n | tail -1)

# If no files exist, start from 0
if [ -z "$max_num" ]; then
    max_num=0
fi

# Create next batch of 35 worker files
start=$((max_num + 1))
end=$((max_num + 35))

for ((i=start; i<=end; i++))
do
cat > worker${i}.txt << EOF
Employee ID: $i
Status: Active
EOF
done

echo "Created worker files from worker${start}.txt to worker${end}.txt"

# Display total files
echo "Total worker files:"
ls worker*.txt | wc -l
