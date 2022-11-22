## Example on how to expand If and For in multiple lines

ORI=/data/salomonis2/LabFiles/Frank-Li/neoantigen/MS/schuster/MS
NOW=/data/salomonis2/LabFiles/Frank-Li/neoantigen/revision/ovarian/MS

cd $ORI
for folder in *
do
    if [ -d $folder ]
        then mkdir ${NOW}/${folder}
             cd ${ORI}/${folder}   
             for file in *.raw
             do
                 mv $file ${NOW}/${folder}
             done
    fi
    cd $ORI
done
