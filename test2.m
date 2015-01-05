c = {'abc' 'def' 'ghk';[23],[24],[67];[87],[13],[999];[656],[6767],[546]}; 
  fid = fopen('junk.csv','w')
  numColumns = size(c,2);
  % use repmat to construct repeating formats
  % ( numColumns-1 because no comma on last one)
  headerFmt = repmat('%s,',1,numColumns-1);
  numFmt = repmat('%f,',1,numColumns-1);
  fprintf(fid,[headerFmt,'%s\n'],c{1,:})
  fprintf(fid,[numFmt,'%f\n'],c{2:end,:})
  fclose(fid)