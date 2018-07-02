#预先移除c_e文件
if [ -e compile_error ]
then
	rm compile_error
fi
#通过管道将 $1 作为参数传入cut中 获得前缀、后缀
#$() 类似于 ``
prefix=$(echo ${1} | cut -d . -f 1)
suffix=$(echo ${1} | cut -d . -f 2)
if [ ${suffix} = "cxx" ] 
then
	g++ -std=gnu++11 -c ${prefix}.cxx 2> compile_error
	if [ -s compile_error ]
	then 
		echo "Compile failed!"
		vim compile_error
		vim ${prefix}.cxx
		exit 1
	else
		echo "Compile successfully!"
		g++ -o ${prefix} ${prefix}.o 2> link_error
		if [ $? != 0 ]
		then
			echo "Link failed!"
			vim link_error
			vim ${prefix}.cxx
			exit 1
		fi
		echo "Link successfully!"
		echo "Next execute program:"
		./${prefix}
	fi
elif [ ${suffix} = "cpp" ]
then
	g++ -std=gnu++11 -c ${prefix}.cpp 2> compile_error
	if [ -s compile_error ]
	then 
		echo "Compile failed!"
		vim compile_error
		vim ${prefix}.cpp
		exit 1
	else
		echo "Compile successfully!"
		g++ -o ${prefix} ${prefix}.o 2> link_error
		if [ $? != 0 ]
		then
			echo "Link failed!"
			vim link_error
			vim ${prefix}.cpp
			exit 1
		fi
		echo "Link successfully!"
		echo "Next execute program:"
		./${prefix}
	fi
elif [ ${suffix} = "c" ]
then
	gcc -c -std=c99 ${prefix}.c 2> compile_error
	if [ -s compile_error ]
	then 
		echo "Compile failed!"
		vim compile_error
		vim ${prefix}.c
		exit 1
	else
		echo "Compile successfully!"
		gcc -o ${prefix} ${prefix}.o 2> link_error
		if [ $? != 0 ]
		then
			echo "Link failed!"
			vim link_error
			vim ${prefix}.c
			exit 1
		fi
		echo "Link successfully!"
		echo "Next execute program:"
		./${prefix}
	fi
fi
rm ${prefix}.o ${prefix} compile_error link_error
exit 0