#!/bin/bash

. progress_bar.sh

PROJECTS_TO_PULL=(
	"sample_proj_x"
	"sample_isa_2"
	"sample_isa_4"
	"sample_isa_3"
        "sample_isa_1"
        "sample_isa_5"
        "sample_isa_6"
        "sample_isa_7"
        "sample_isa_8"
        "sample_isa_9"
)

progress="show"

function usage {
    programName=$0
    echo " ℹ️  help: "
    echo "description: use this program to pull projects [${PROJECTS_TO_PULL[@]}]"
    echo "usage: $programName [-p hide]"
    echo "      -progress    Show progress"
    exit 1
}

while getopts ":p:h" opt; do
  case ${opt} in
    p) progress=$OPTARG
    ;;
    h) usage
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    usage
    ;;
  esac
done

if [ $progress = "show" ]
then
  setup_scroll_area
fi

let index=1
let length=${#PROJECTS_TO_PULL[@]}

for VARIABLE in ${PROJECTS_TO_PULL[*]}
do
  echo "do_pull $CODE_DIR/$VARIABLE"
  sleep 2

  if [ $progress = "show" ]
  then
    draw_progress_bar $(percentage $index $length)
  fi
  index=$((index+1))
done
wait

if [ $progress = "show" ]
then
  destroy_scroll_area
fi
