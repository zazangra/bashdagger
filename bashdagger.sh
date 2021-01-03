#!/usr/bin/env bash

#Collect V set
echo "Welcome to the Simple Bash Dagger!"
echo 
echo
echo "Add your variables"
echo
read -p "V:" -a Var
echo
echo

# Add values to variables
values=() 
echo 
echo "Add your values to variables"
for i in ${Var[@]}
do 
        read -p "$i is:" val
        if  [ $val = "0" ] || [ $val = "1" ]; then
                values+=( "$i=$val" )
        else
                echo "Values must be either 0 or 1"
                break
        fi
done
echo

#Building edgend and endpoint, and add to them values!!!

em=()
ar=()
echo
echo "Build edge (E) set"
echo
echo "First, 2 set to be built: (EM) edgends and (AR) endpoints"
echo
echo "Buil edgends (EM) set"
echo
echo "# You must specify for each var if it's in EM with -y x-, where x is the number of 
edgends where var appears (leave blank if it's 1), and with -n- if var it's not in EM"
echo
echo

for i in ${Var[@]}
do
    read -p "$i is EM:" ans num
    if [ "$ans" == "y" ]; then
            if  [ -z "$num" ]; then
                    em+=( "$i" )
            else
                for ((a=0; a<$num; a++)) 
            do
                    em+=( "$i" )
            done
            fi
    elif [[ "$ans" == "n" ]]; then
            :
    else
            echo "Wrong input: only -y/n-  -y/n + numbers- are accepted"
    fi
done

echo
echo "Build endpoints (AR) set"
echo
echo "Same rules as above"
echo

for i in ${Var[@]}
do
    read -p "$i is AR:" risp int
    if [ "$risp" == "y" ]; then
            if [ -z "$int" ]; then
                    ar+=( "$i" )
            else
                    for ((b=0; b<$int; b++))
                do
                        ar+=( "$i" )
                done
            fi
    elif [[ "$risp" == "n" ]]; then
            :
    else
            echo "Wrong input: only -y/n-  -y/n + numbers- are accepted"
    fi
done
echo 
echo
echo

# Now times for tell wich EM is with wich AR, and equations
echo "Finally, build the pairs in E"
echo
e=()
cons=()
for i in ${em[@]}
do
        read -p "$i has arrowhead:" arhead
        if [[ "${ar[*]}" =~ $arhead ]]; then 
                e+=( "$i→$arhead;" )
                cons+=( $arhead )
        else 
                echo "var not in arrowends"
        fi
done
echo
echo

#The final output: var, values edges and equations
echo 
echo "This is your DAG:"
echo
echo "V={"${Var[*]}"}" 
echo  "E={ "${e[@]}"}"
echo
echo "Your values"
echo ${values[*]}
echo
echo "Your atomic equations"

eq=()
len=${#e[@]}
for (( i=0; i<$len; i++ )); 
do
        echo "If ${em[$i]} then ${cons[$i]}"
        eq+=( "If ${em[$i]} then ${cons[$i]};\n" )
done
echo
echo

# Now the big stuff, intervention!
echo
echo "Do you want to do some do()?"
read risp
if [ "$risp" == "y"  ]; then
        :
else
        echo "See you soon"
        exit
fi
echo "Good Choice" # Is it?

echo
read -p "Enter input: do " dovar doval
if [[ ! ${Var[*]} =~ $dovar ]]; then
        echo "Your var is not defined"
elif [[ ! ${ar[*]} =~ $dovar ]]; then
        echo "It makes no sense to do() this var!"
elif [ $doval = "1" ] || [ $doval = "0" ]; then
        vardo=$dovar   
        valdo=$doval
        :
else
        echo "Value must be binary!"
        exit 
fi

echo
echo

# Variation Output 
declare -a newe=( ${e[*]/*$vardo;/} )
declare -a newval=( ${values[*]/$vardo*/$vardo=$doval} )
declare -a neweq=( ${eq[*]/*$vardo;*/} )

echo "Your new DAG"
echo "E:{"${newe[*]}"}"
echo
echo "Values:"
echo ${newval[*]}
echo
echo "Your new equations:"
echo -e ${neweq[*]}
echo

