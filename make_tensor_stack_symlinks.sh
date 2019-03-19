#!/bin/bash

# Generates symlinks needed to build.
# Must be run as root.

target_dir="/usr/local/cuda"

# /bin
bin_dir="$target_dir/bin"
if [ ! -e $bin_dir ]; then
  mkdir -p $bin_dir
  ln -s /usr/bin/bin2c $bin_dir/bin2c
  ln -s /usr/lib/nvidia-cuda-toolkit/bin/crt $bin_dir/crt
  ln -s /usr/bin/fatbinary $bin_dir/fatbinary
  ln -s /usr/bin/nvcc $bin_dir/nvcc
  ln -s /usr/bin/nvlink $bin_dir/nvlink
fi

#/include
inc_dir="$target_dir/include"
mkdir -p $inc_dir
link_includes() {
  for file in $(ls -1 $1); do
    target=$inc_dir/$(basename $file)
    if [ ! -e $target ]; then
      ln -s $file $target
    fi
  done
}
link_includes "/usr/include/cu*"

#/lib64
lib_dir="$target_dir/lib64"
if [ ! -e $lib_dir ]; then
  mkdir -p $lib_dir
  ln -s /usr/lib/x86_64-linux-gnu/libcublas.so.10.0 $lib_dir/libcublas.so.10.0
  ln -s /usr/lib/x86_64-linux-gnu/libcudart.so.10.0 $lib_dir/libcudart.so.10.0
  ln -s /usr/lib/x86_64-linux-gnu/libcudart_static.a $lib_dir/libcudart_static.a
  ln -s /usr/lib/x86_64-linux-gnu/libcufft.so.10.0 $lib_dir/libcufft.so.10.0
  ln -s /usr/lib/x86_64-linux-gnu/libcupti.so.10.0 $lib_dir/libcupti.so.10.0
  ln -s /usr/lib/x86_64-linux-gnu/libcurand.so.10.0 $lib_dir/libcurand.so.10.0
  ln -s /usr/lib/x86_64-linux-gnu/libcusolver.so.10.0 $lib_dir/libcusolver.so.10.0
  ln -s /usr/lib/x86_64-linux-gnu/libnppc.so.10.0 $lib_dir/libnppc.so.10.0
  ln -s /usr/lib/x86_64-linux-gnu/libnppial.so.10.0 $lib_dir/libnppial.so.10.0
  ln -s /usr/lib/x86_64-linux-gnu/stubs $lib_dir/stubs
fi

#/nvvm
nvvm_dir="$target_dir/nvvm"
if [ ! -e $nvvm_dir ]; then
  ln -s /usr/lib/nvidia-cuda-toolkit $nvvm_dir
fi
