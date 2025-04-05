function h5conv2tiff(filename)
entry = '/entry/data/data';
R = h5read(filename, entry);
R = R';
[filepath,name,~] = fileparts(filename);
if isempty(filepath)
    filepath = pwd;
end
filename = fullfile(filepath, filesep, [name, '.tif']);
imwritetiff(R, filename, 32)