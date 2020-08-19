#!/bin/bash
tmp_dir=$(mktemp -d -t git-XXXXXXXXXX) && \
cur_dir=$PWD && \
git clone -q https://github.com/senglin/python-aws-workspace.git $tmp_dir &&\
pushd $tmp_dir > /dev/null && \
cp -pr .devcontainer .vscode $cur_dir && \
popd > /dev/null && \
rm -rf $tmp_dir && \
echo "------------------------" && \
echo "| PYTHON RPi4 WORKSPACE |" && \
echo "------------------------" && \
echo "Copied .devcontainer & .vscode into $cur_dir"
