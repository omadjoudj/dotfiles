#!/bin/bash

rsync -arHP \
    --exclude=.cache \
    --exclude=.debug \
    --exclude=.dbus \
    --exclude=.gvfs \
    --exclude=.local/share/gvfs-metadata \
    --exclude=.local/share/Trash \
    --exclude=.recently-used \
    --exclude=.thumbnails \
    --exclude=.xsession-errors \
    --exclude=.Trash \
    --exclude=.steam \
    /home/omadjoudj /media/XXXX/<Machine>-backups/
