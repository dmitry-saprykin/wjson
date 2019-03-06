#!/bin/bash

script_path=$(readlink -e $0)
script_dir=$(dirname $script_path)
project_dir=$(dirname $script_dir)
project_name=$(basename $project_dir)
build_dir="$project_dir/build"

#rm -r $prj_dir/build/report
#lcov --no-external -t "$prj" -o $prj_dir/build/$prj.info -c -d $prj_dir/build/ 
#lcov --no-external --directory src --capture --output-file postgresql.info

#genhtml -o $prj_dir/build/report $prj_dir/build/$prj.info
#google-chrome $prj_dir/build/report/index.html

if [ ! -d "$build_dir" ]; then
  echo "Для построения отчета нужно собрать проект с опцией CODE_COVERAGE=ON и запустить тесты"
  exit 1
fi

gcda_count="$(find ./ -type f -iname '*.gcda' | wc -l)"

if [ "$gcda_count" = "0" ]; then
  echo "Не найдены *.gcda файлы"
  echo "Для построения отчета нужно пересобрать проект с опцией CODE_COVERAGE=ON и запустить тесты"
  exit 1
fi

rm -rf $build_dir/cov-report
rm -f $build_dir/$project_name-coverage.info

lcov --directory $build_dir --capture --output-file $build_dir/$project_name-coverage.info
mkdir $build_dir/cov-report
genhtml -o $build_dir/cov-report/ $build_dir/$project_name-coverage.info
google-chrome $build_dir/cov-report/index.html
