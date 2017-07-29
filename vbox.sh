#!/bin/bash
vboxmanage storageattach "caros" --storagectl IDE --port 0 --device 0 --type dvddrive --medium "iso/caros.iso"
virtualbox --startvm "caros"
