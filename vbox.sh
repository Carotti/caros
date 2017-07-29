#!/bin/bash
vm="caros"
iso="caros.iso"

vboxmanage storageattach $vm --storagectl IDE --port 0 --device 0 --type dvddrive --medium $iso
virtualbox --startvm $vm
