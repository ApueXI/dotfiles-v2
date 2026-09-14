----

# sudo mount -t ntfs-3g /dev/sda1 /mnt/hdd
# sudo umount /mnt/hdd

# sudo mount -t ntfs-3g /dev/sda1 /home/cred/external_drives
# sudo umount /home/cred/external_drives

- /dev/sda1 is different for every hdd i think
- /mnt/hdd is my dir for hdd, you can create yours
- i used ntfs-3g since my hdd is ntfs, you can check fstype in terminal by 'lsblk -f'

---

-
