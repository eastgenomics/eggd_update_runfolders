#!/bin/bash
# eggd_update_runfolders 1.0.2

set -e

main() {

    echo "Value of SampleSheet: '$SampleSheet'"

    dx download "$SampleSheet" -o SampleSheet

    project_name=$(dx describe --name $DX_PROJECT_CONTEXT_ID)
    IFS='\_' read -r category runfolder <<< $project_name # Remove project prefix e.g. 002
    echo "RF $runfolder"
    samples=$(sed "0,/Data/d" < SampleSheet | sed '1d' | awk -F "," '{print $2}' | awk -F "-" '{print $1}' | grep -v NA12878 | sort | uniq )  # Get all sample IDs, except NA12878 (as it's not in the database)

    for sample in $samples; do
        echo "${sample}^${runfolder}";
    done > linux_update_runfolders.txt

    # Make the newline a carriage return for Windows
    awk '{printf "%s\r\n", $0}' linux_update_runfolders.txt > UpdateRunFolders.txt

    UpdateRunFolders=$(dx upload UpdateRunFolders.txt --brief)

    dx-jobutil-add-output UpdateRunFolders "$UpdateRunFolders" --class=file
}
