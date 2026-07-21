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

begin_res=1
end_res=175

echo "  "


#18/02/2011

mkdir ./analysis_fluct/
cd analysis_fluct
mkdir fluct_modes_residues_a

cd ../


#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
#Loop for all modes
for i in $(seq $begin_mode $end_mode) ; do

echo mode $i

sed 's/fluct atom temp 300 tfreq 0.1 mode XX/fluct atom temp 300 tfreq 0.1 mode '"$i"'/' ./analyse_each_mode-XX.inp > ./analyse_each_mode.inp

# charmm < ./analyse_each_mode.inp > ./analyse_mode_${i}.out
# /home/lbcb/Downloads/charmm/bin/charmm -i analyse_each_mode.inp > ./analyse_mode_${i}.out
charmm < ./analyse_each_mode.inp > ./analyse_mode_${i}.out
cp ./analyse_mode_${i}.out ./analysis_fluct/fluct_modes_residues_a

done
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#

# entrar no diretorio com as flutuacoes
#cd /home/lbcb/yolanda/het_selvagem_ph4
pwd

#rm temporary* all_ca_residue.txt


#Loop for all modes
for i in $(seq $begin_mode $end_mode) ; do

cat analyse_mode_${i}.out | grep "PROA" > temporarya.txt
#cat analyse_mode_${i}.out | grep "PROB" > temporaryb.txt
#cat analyse_mode_${i}.out | grep "PROC" > temporaryc.txt


cat temporarya.txt | grep "CA" > temporarya_ca.txt
#cat temporaryb.txt | grep "CA" > temporaryb_ca.txt
#cat temporaryc.txt | grep "CA" > temporaryc_ca.txt

awk '
 {print $4 "   "'${i}'"   " $7}' temporarya_ca.txt >> temporary2a_ca.txt

#awk '
# {print $4 "   "'${i}'"   " $7}' temporaryb_ca.txt >> temporary2b_ca.txt

#awk '
# {print $4 "   "'${i}'"   " $7}' temporaryc_ca.txt >> temporary2c_ca.txt


echo " " >> temporary2a_ca.txt
#echo " " >> temporary2b_ca.txt
#echo " " >> temporary2c_ca.txt

done

cp temporary2a_ca.txt all_residues_a.txt
#cp temporary2b_ca.txt all_residues_b.txt
#cp temporary2c_ca.txt all_residues_c.txt

rm temporary*

