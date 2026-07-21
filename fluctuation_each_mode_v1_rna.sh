#!/bin/bash

#------------------------------------------------------------------------------------------------------------------------#
#  	Este script é utilizado para gerar a flutuacao de cada residuo para cada modo normal
#
#  	Script desenvolvido por Eric Allison Philot & Angelica Nakagawa Lima.
#  	e-mail: ericphilot@hotmail.com  angelicanakagawa@yahoo.com.br
#  	Date: 17/01/2013
#-----------------------------------------------------------------------------------------------------------------------


# Pula linhas na tela
echo "  "
echo "  "

begin_mode=7
read -p 'numero do maior modo gerado (biggest than 7; ex.:100 ): ' end_mode 

begin_res=0
end_res=76

echo "  "


#18/02/2011

mkdir ./analysis_fluct/
cd analysis_fluct
mkdir fluct_modes_residues_rna

cd ../


#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
#Loop for all modes
for i in $(seq $begin_mode $end_mode) ; do

echo mode $i

sed 's/fluct atom temp 300 tfreq 0.1 mode XX/fluct atom temp 300 tfreq 0.1 mode '"$i"'/' ./analyse_each_mode-XX.inp > ./analyse_each_mode.inp

charmm < ./analyse_each_mode.inp > ./analyse_mode_${i}.out
cp ./analyse_mode_${i}.out ./analysis_fluct/fluct_modes_residues_rna

done
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#

# entrar no diretorio com as flutuacoes
#cd ./fluct_modes_residues_c

pwd

#rm temporary* all_c3_residue.txt


#Loop for all modes
for i in $(seq $begin_mode $end_mode) ; do

cat analyse_mode_${i}.out | grep "RNAA" > temporaryrna.txt

cat temporaryrna.txt | grep "C3'" > temporaryrna_c3.txt

awk '
 {print $4 "   "'${i}'"   " $7}' temporaryrna_c3.txt >> temporary2rna_c3.txt

echo " " >> temporary2rna_c3.txt

done

cp temporary2rna_c3.txt all_residues_rna.txt

rm temporary*

