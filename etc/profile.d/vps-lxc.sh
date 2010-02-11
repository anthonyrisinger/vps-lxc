#!/bin/bash
# add vps-lxc to PATH; export VPS_CONF

l=vps-lxc; s=vps
if [ -z "$(type -t ${l} ${s})" ]; then
    for x in {,/vps,/usr,/usr/local,/opt,/opt/local}/etc/{${l}/${l},${s}/${s}}.conf; do
        if [ -f "${x}" ]; then
            export VPS_CONF="${x}"
            [ "${x}" != "${x#/etc/}" ] || export PATH="${PATH}:${x%%/etc/*}/usr/bin"
            break
        fi
    done
fi
