#!/bin/zsh

RET_VAL="0"

cd "$(dirname $0)/.."

git log -n 1 --name-only --pretty=format: --diff-filter=ACMR | egrep '\.pp$' | while read commited_file; do
    puppet parser validate "${commited_file}"
    if [ "${$?}" != "0" ]; then
        RET_VAL=1
    fi
done

exit ${RET_VAL}
