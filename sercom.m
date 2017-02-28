function sercom(data)
sc=serial('COM21');
fopen(sc);
fprintf(sc,data);
disp(data);
fclose(sc);
delete(sc);