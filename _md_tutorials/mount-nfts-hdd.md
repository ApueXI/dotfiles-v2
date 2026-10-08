# Mounting HDD in root or in home

## Root/Admin

- `sudo mount -t ntfs-3g /dev/sda1 /mnt/hdd`
- `sudo umount /mnt/hdd`

## Home

- `sudo mount -t ntfs-3g /dev/sda1 /home/cred/external_drives`
- `sudo umount /home/cred/external_drives`

## Reminder

- `/dev/sda1` is different for every hdd i think
  - use `lsblk -f` to find where is yours
- `/mnt/hdd` and `/home/cred/external_drives` is my dir for hdd, you can create yours
- i used ntfs-3g since my hdd is ntfs, you can check fstype in terminal by `lsblk -f`
