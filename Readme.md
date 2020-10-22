<!-- dx-header -->
# eggd_update_runfolders (DNAnexus Platform App)

## What does this app do?

The app generates a text file used to update run folders within the Gemini database for all samples on a given sample sheet.

## What are typical use cases for this app?

This app should be executed as part of a DNAnexus workflow for multiple samples.

## What data are required for this app to run?

This app requires the SampleSheet.csv file for a run as input.

## What does this app output?
It outputs one file (UpdateRunFolders.txt) containing a list of all samples on the run with the runfolder name in the format - sample_name^runfolder.

</br></br>

This is the source code for an app that runs on the DNAnexus Platform.
For more information about how to run or modify it, see
https://documentation.dnanexus.com/.

#### This app was made by EMEE GLH