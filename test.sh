
#变量部分
var='
#删除变量
tes="nothing"
tes="anything"
unset tes
echo $tes

#通过循环声明变量
for file in $(ls);
    do
    echo "${file}asdf"
    done

#设置只读变量，只读变量不能被改变
your_name="qinjx"
readonly your_name
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting $greeting_1


'
#字符串部分
str='
#字符串长度
string="abcd"
echo ${#string} #输出 4

#字符串切割
string="runoob is a great site"
echo ${string:1:4} # 输出 unoo

#字符串拼接
your_name="qinjx"
greeting="hello, $your_name !"
greeting_1="hello, ${your_name} !"
echo $greeting $greeting_1
'

#数组部分
arr='
#数组下标访问

array_name=(0 1 2 3 4 5 6)
echo ${array_name[${array_name[1]}+1]}
'

#系统调用shell文件时传参
para='
#传递参数

echo "Shell 传递参数实例！";
echo "执行的文件名：$0";
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo "第三个参数为：$3";
echo "参数个数为：$#";
echo "传递的参数作为一个字符串显示：$*";

#$* 和 $@的区别
echo "-- \$* 演示 ---"
for i in "$*"; do
    echo $i
done
echo $*

echo "-- \$@ 演示 ---"
for i in "$@"; do
    echo $i
done

#$$ $! $? 进程id，???,返回值
echo "$$ $! $?"
'

#各类运算符
op='
#算术运算符，同C++

a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"

#关系运算符，类似汇编语言
a=10
b=20

if [ $a -eq $b ] #一个变量最好用[]括起来防止识别错
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi

#布尔运算符 ，逻辑运算符 && || 类似 -a -o
if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi

#字符串运算符
a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi

#文件测试运算符
file="./test.sh"
if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi
'

#echo 指令的各种功能
echo_test='
#echo用于输出字符串， 加上 -e 开启转义
echo -e "ok!\n"
echo -e "not ok \c"
echo -e "now you can see the change"

#结果重定向至文件
#echo "it is a test" > myfile

#执行命令并显示结果
echo `date`
echo="
echo输出的字符串总结
===================================================================

       能否引用变量  |  能否引用转移符  |  能否引用文本格式符(如：换行符、制表符)

单引号  |否           |否             |否

双引号  |能           |能             |能

无引号  |能           |能             |否                          

==================================================================
"
#read 命令一个一个词组地接收输入的参数，每个词组需要使用空格进行分隔；
#如果输入的词组个数大于需要的参数个数，则多出的词组将被作为整体为最后一个参数接收。
read first second
echo "first = $first,second = $second"

#read -p “提示文字”  -n字长限制 -t 输入限时 -s 隐藏输入内容
'

#printf的各种功能
printf_test='
#printf 在shell中有类似C的用法，制表符规则和C中一样
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876 

#printf 没有引号也可以输出 多出的参数会被重用

printf "%s %s\n" abc def abc 

printf "%s %s %s\n" a b c d e f g h i j

# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n" 
'

#Shell中的 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。
#似乎 test x 等价于 [ x ]


#流程控制
control_test='
a=100
b=200


if [ $[a+b] -lt $b ]
then
    echo 1
elif [ $a -gt $b ]
then 
    echo 2
else
    echo 3
fi

#for 遍历列表

for nam in item1 item2 item3
do
    echo $nam
done

for((i=1;i<=5;i++));do
    echo "这是第 $i 次调用";
done;

#while 用于判断条件，条件不满足时退出 ,until 与while退出条件相反
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done

#Bash let 命令，它用于执行一个或多个表达式，变量计算中不需要加上 $ 来表示变量

#until 例子
a=0

until [ $a -gt 10 ]
do
   echo $a
   a=`expr $a + 1`
done

#case 语法与C switch类似
echo 输入 1 到 4 之间的数字:
echo 你输入的数字为:
read aNum
case $aNum in
    1)  echo 你选择了 1
    ;;
    2)  echo 你选择了 2
    ;;
    3)  echo 你选择了 3
    ;;
    4)  echo 你选择了 4
    ;;
    *)  echo 你没有输入 1 到 4 之间的数字
    ;;
esac

while :
do
    echo "输入 1 到 5 之间的数字:"
    read aNum
    case $aNum in
        1|2|3|4|5) 
            echo "$aNum!"
        ;;
        *) 
            echo "wrong"
            break #continue
        ;;
    esac
done
'

#shell 函数
func='
demoFun(){
    echo "这是我的第一个 shell 函数!"
}
echo "-----函数开始执行-----"
demoFun
echo "-----函数执行完毕-----"

#通过$? 来返回运算结果 通过$1 ... $n 来传参，这个过程中会屏蔽掉系统的$1，$?等

funWithReturn(){
    echo "这个函数会对输入的两个数字进行相加运算..."
    echo "两个数字分别为 $1 和 $2 !"
    return $(($1+$2))
}
funWithReturn 1 2
echo "输入的两个数字之和为 $? !"
'

#重定向和引用

finaltest='
#加 > 可以输出重定向 >>追加而不覆盖 2>重定向错误信息
echo `who` > user 
echo `date` >> user
echo `cat user`

#加 < 则可以重定向输入
read x1 x2 < user
echo $x1
echo $x2
# 合并错误和输出可以用command > file 2>&1

#一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件：

#标准输入文件(stdin)：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
#标准输出文件(stdout)：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
#标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。

#Here Document 是 Shell 中的一种特殊的重定向方式，用来将输入重定向到一个交互式 Shell 脚本或程序。

cat << EOF
1231
123
12
EOF


#引用测试
. ./test2.sh

echo "$url"
'