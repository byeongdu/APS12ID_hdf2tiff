# APS12ID_hdf2tiff
 APS 12ID h5 data convert to tiff format
## Background
Since Feb of 2022, APS 12ID SAXS beamlines changed their image data format from tiff to hdf5 format. The newer format requires less disc space thanks to LZ4 compression provided by the hdf format. This code is written for anyone who needs conversion of a hdf image to a tiff image.
## Requirement
These are matlab codes, and thus matlab is required. Additionally, to be able to load the lz4 compressed h5 file, it is necessary to download a proper library. Follow [this guide](https://www.mathworks.com/matlabcentral/answers/393621-how-can-i-import-a-lzf-compressed-hdf5-dataset-in-matlab).
